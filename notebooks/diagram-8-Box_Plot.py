import pandas as pd
import plotly.express as px
df = pd.read_csv('diabetes_prediction_dataset.csv')
fig = px.box(df,
             x='smoking_history',
             y='bmi',
             color='smoking_history',
             title='Распределение BMI по истории курения',
             template="plotly_dark")
fig.show()