import pandas as pd
import pickle
from sklearn.ensemble import RandomForestRegressor

# 1. Load data
df = pd.read_csv('milk_yield.csv') 

# 2. Select the 4 columns for Age, Weight, Feed, Health
X = df[['Age', 'Weight', 'Feed', 'Health']] 
y = df['Yield'] 

# 3. Train
model = RandomForestRegressor(n_estimators=100)
model.fit(X, y)

# 4. Save the "Brain"
with open('model.pkl', 'wb') as f:
    pickle.dump(model, f)

print("SUCCESS: Model re-trained for 4 modules!")