import pandas as pd
import plotly.express as px

# Загрузка данных из CSV
df = pd.read_csv('diabetes_prediction_dataset.csv')

# Данные для визуализации
grouped_data = df.groupby(['gender', 'age', 'diabetes']).size().reset_index(name='counts')

# Создание мозаичной диаграммы
fig = px.treemap(grouped_data, path=['gender', 'age', 'diabetes'], values='counts',
                 color='diabetes',
                 color_continuous_scale='RdBu',
                 title='Распределение диабета в зависимости от пола и возраста',
                 template="plotly_dark")
fig.show()