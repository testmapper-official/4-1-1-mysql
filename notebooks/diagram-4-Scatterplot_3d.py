import pandas as pd
import plotly.express as px

# Загрузка данных
df = pd.read_csv('diabetes_prediction_dataset.csv')

# Выбор переменных для визуализации
# В данном примере мы выбрали возраст, ИМТ и уровень глюкозы в крови
x, y, z = 'age', 'bmi', 'blood_glucose_level'

# Перекодирование столбца diabetes для визуализации: 0 для здоровых, 1 для больных диабетом
df["diabetes_color"] = df["diabetes"].apply(lambda x: 'Pink' if x == 1 else 'Green')

# Построение трехмерной диаграммы рассеивания
fig = px.scatter_3d(df, x=x, y=y, z=z, color='diabetes_color', color_discrete_map={'Pink': 'pink', 'Green': 'green'},
                    title="Трехмерная точечная диаграмма для прогнозирования диабета", template="plotly_dark")

# Установка размера маркеров
fig.update_traces(marker=dict(size=3))
fig.update_layout(scene=dict(
                    xaxis_title='Возраст',
                    yaxis_title='Индекс массы тела',
                    zaxis_title='Уровень глюкозы в крови'
                ))

fig.show()