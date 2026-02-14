import sqlite3
from flask import Flask, request, render_template_string

app = Flask(__name__)

# Create database automatically
conn = sqlite3.connect("milk.db", check_same_thread=False)
cursor = conn.cursor()

# Create table if not exists
cursor.execute("""
CREATE TABLE IF NOT EXISTS records (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    cow_age INTEGER,
    milk_yield REAL
)
""")
conn.commit()

@app.route("/", methods=["GET", "POST"])
def home():
    if request.method == "POST":
        age = request.form["age"]
        yield_value = request.form["yield"]

        cursor.execute("INSERT INTO records (cow_age, milk_yield) VALUES (?, ?)",
                       (age, yield_value))
        conn.commit()

        return "Data Saved Successfully!"

    return """
        <h2>Milk Yield Entry</h2>
        <form method="POST">
            Cow Age: <input type="number" name="age"><br><br>
            Milk Yield: <input type="number" step="0.1" name="yield"><br><br>
            <button type="submit">Save</button>
        </form>
    """

if __name__ == "__main__":
    app.run()
