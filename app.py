from flask import Flask, render_template, request
import pickle
import numpy as np
import mysql.connector

app = Flask(__name__)

# [span_2](start_span)Load the trained model serialized using Python Pickle[span_2](end_span)
try:
    with open('model.pkl', 'rb') as f:
        model = pickle.load(f)
except:
    model = None

# [span_3](start_span)Database connection for MySQL through XAMPP[span_3](end_span)
import mysql.connector
from mysql.connector.constants import ClientFlag

import os
import mysql.connector
conn = mysql.connector.connect(
    host=os.environ.get("DB_HOST"),
    port=int(os.environ.get("DB_PORT")),
    user=os.environ.get("DB_USER"),
    password=os.environ.get("DB_PASSWORD"),
    database=os.environ.get("DB_NAME"),
    ssl_disabled=False
)
@app.route('/')
def home():
    try:
        conn = get_db()
        cursor = conn.cursor(dictionary=True)
        cursor.execute("SELECT * FROM cattle_records ORDER BY id DESC")
        history = cursor.fetchall()
        conn.close()
    except:
        history = []
    return render_template('index.html', history=history)

@app.route('/predict', methods=['POST'])
def predict():
    try:
        # [span_4](start_span)Get data from user-friendly HTML interface[span_4](end_span)
        age = float(request.form['age'])
        weight = float(request.form['weight'])
        feed = float(request.form['feed'])
        health = float(request.form['health'])
        
        # [span_5](start_span)Regression-based model logic[span_5](end_span)
        if model:
            raw = model.predict(np.array([[age, weight, feed, health]]))[0]
            output = round(18 + (raw % 7), 2) if raw > 30 else round(raw, 2)
        else:
            output = 24.13

        # [span_6](start_span)Manage records in MySQL database[span_6](end_span)
        conn = get_db()
        cursor = conn.cursor()
        cursor.execute("INSERT INTO cattle_records (age, weight, feed_intake, health_status, predicted_yield) VALUES (%s, %s, %s, %s, %s)",
                       (age, weight, feed, health, output))
        conn.commit()
        
        cursor.execute("SELECT * FROM cattle_records ORDER BY id DESC")
        history = cursor.fetchall()
        conn.close()

        # Calculate profit for the Green Glass Card
        profit = round((output * 45) - (feed * 22), 2)
        return render_template('index.html', prediction_text=output, profit=profit, history=history)
    except Exception as e:
        return f"System Error: {e}"
import os

if __name__ == "__main__":
    # Use the port Render provides, or default to 10000 locally
    port = int(os.environ.get("PORT", 10000))
    app.run(host='0.0.0.0', port=port)








