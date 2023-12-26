import pandas as pd
import plotly.express as px

# Загрузка данных из CSV
df = pd.read_csv('diabetes_prediction_dataset.csv')

# Заменяем 0 и 1 на более понятные обозначения
df['diabetes'] = df['diabetes'].map({0: 'No Diabetes', 1: 'Diabetes'})
df['heart_disease'] = df['heart_disease'].map({0: 'No Heart Disease', 1: 'Heart Disease'})
df['hypertension'] = df['hypertension'].map({0: 'No Hypertension', 1: 'Hypertension'})

# Агрегация всех данных для визуализации
grouped_data = df.groupby(['gender', 'age', 'diabetes', 'heart_disease', 'hypertension']).size().reset_index(name='counts')

# Создание мозаичной диаграммы с дополнительными условиями
fig = px.treemap(grouped_data, path=['gender', 'age', 'diabetes', 'heart_disease', 'hypertension'], values='counts',
                 color='counts',
                 color_continuous_scale='RdBu',
                 title='Распределение диабета, сердечных заболеваний и гипертонии в зависимости от пола и возраста',
                 template="plotly_dark")

# Показываем фигуру
fig.show()