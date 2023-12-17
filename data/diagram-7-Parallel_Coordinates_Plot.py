import pandas as pd
import plotly.express as px

df = pd.read_csv('diabetes_prediction_dataset.csv')

# smoking_history в числа
def convert_smoking(smoking):
    if smoking == 'current':
        return 2
    elif smoking == 'former' or smoking == 'not current' or smoking == 'ever':
        return 1
    elif smoking == 'never':
        return -1
    elif smoking == 'no info':
        return 0
    else:
        return None

# Применение функции выше к smoking_history и создание нового столбца
df['smoking_status'] = df['smoking_history'].apply(convert_smoking)

# Построение Parallel Coordinates Plot
fig = px.parallel_coordinates(df,
                              color="diabetes",
                              dimensions=['gender', 'age', 'hypertension', 'heart_disease',
                                          'smoking_status', 'bmi', 'HbA1c_level', 'blood_glucose_level'],
                              labels={'smoking_status': 'Smoking Status', 'gender': 'Gender', 'age': 'Age',
                                      'hypertension': 'Hypertension', 'heart_disease': 'Heart Disease',
                                      'bmi': 'BMI', 'HbA1c_level': 'HbA1c Level', 'blood_glucose_level': 'Blood Glucose Level'},
                              color_continuous_scale=px.colors.diverging.Tealrose,
                              color_continuous_midpoint=0.5,
                              template="plotly_dark")
fig.show()