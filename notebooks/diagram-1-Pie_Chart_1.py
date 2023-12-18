import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv('diabetes_prediction_dataset.csv')

# Преобразование столбца age в нужный тип данных
df['age'] = pd.to_numeric(df['age'], errors='coerce')

# Разделение на возрастные группы
bins = [0, 18, 34, 69, 74, 150]
labels = ['Молодой', 'Зрелый', 'Средний', 'Пожилой', 'Старческий']
df['age_group'] = pd.cut(df['age'], bins=bins, labels=labels, right=False)

# Создание круговых диаграмм
fig, axes = plt.subplots(1, 5, figsize=(20, 4))

# Значения для параметра explode
explode = (0.1, 0.1, 0.1, 0.1)

# Цвета для категорий из Set3
colors = plt.cm.Set3.colors

for i, group in enumerate(labels):
    subset = df[df['age_group'] == group]
    data = [
        subset['diabetes'].sum(),
        subset['hypertension'].sum(),
        subset['heart_disease'].sum(),
        len(subset) - subset['diabetes'].sum() - subset['hypertension'].sum() - subset['heart_disease'].sum()
    ]
    labels = [''] * 4  # пустые строки
    autopct = ''

    if i >= 2:  # задаем подписи и проценты только для трех последних диаграмм
        labels = ['Diabetes', 'Hypertension', 'Heart disease', 'Healthy']
        autopct = '%1.1f%%'

    axes[i].pie(data, labels=labels, autopct=autopct, startangle=140, wedgeprops={'edgecolor': 'white'}, explode=explode, colors=colors)
    axes[i].set_title(f'{group}')

plt.suptitle('Заболеваемость с возрастом', fontsize=16)
plt.tight_layout()
plt.show()