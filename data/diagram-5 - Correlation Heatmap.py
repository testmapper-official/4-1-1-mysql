import pandas as pd
import plotly.express as px

# Загрузка данных
df = pd.read_csv('diabetes_prediction_dataset.csv')

# Выберем количественные переменные
numeric_columns = ['age', 'bmi', 'HbA1c_level', 'blood_glucose_level', 'diabetes']

binary_columns = ['hypertension', 'heart_disease']
selected_columns = numeric_columns + binary_columns

# Очистим данные от возможных пропущенных значений
df_selected = df[selected_columns].dropna()

# Вычислим корреляционную матрицу
corr_matrix = df_selected.corr(method='pearson')

# Построим тепловую карту
fig = px.imshow(corr_matrix,
                text_auto=True, # Автоматически добавит значения на тепловую карту
                labels=dict(x="Feature", y="Feature", color="Correlation"),
                x=corr_matrix.columns,
                y=corr_matrix.columns,
                template="plotly_dark")

# Назначим заголовок графика
fig.update_layout(title='Корреляционная тепловая карта для прогнозирования диабета', width=1920, height=1080)

fig.show()