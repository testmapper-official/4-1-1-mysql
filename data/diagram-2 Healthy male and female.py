import pandas as pd
import matplotlib.pyplot as plt
# Загрузка данных
df = pd.read_csv('diabetes_prediction_dataset.csv')

# Создание поднаборов данных для мужчин и женщин
male_subset = df[df['gender'] == 'Male']
female_subset = df[df['gender'] == 'Female']

# Создание круговых диаграмм для мужчин
fig, axes = plt.subplots(1, 2, figsize=(14, 7))

# Мужчины
male_labels = ['Diabetes', 'Hypertension', 'Heart Disease', 'Healthy']
male_data = [
    male_subset['diabetes'].sum(),
    male_subset['hypertension'].sum(),
    male_subset['heart_disease'].sum(),
    len(male_subset) - male_subset['diabetes'].sum() - male_subset['hypertension'].sum() - male_subset['heart_disease'].sum()
]
colors = plt.cm.Set3.colors
explode = (0.4, 0.4, 0.4, 0)  # добавляем отступ к первому сектору
axes[0].pie(male_data, labels=male_labels, autopct='%1.1f%%', startangle=140, colors=colors, explode=explode)

axes[0].set_title('Состояние здоровья мужчин')

# Женщины
female_labels = ['Diabetes', 'Hypertension', 'Heart Disease', 'Healthy']
female_data = [
    female_subset['diabetes'].sum(),
    female_subset['hypertension'].sum(),
    female_subset['heart_disease'].sum(),
    len(female_subset) - female_subset['diabetes'].sum() - female_subset['hypertension'].sum() - female_subset['heart_disease'].sum()
]
axes[1].pie(female_data, labels=female_labels, autopct='%1.1f%%', startangle=140, colors=colors)
axes[1].set_title('Состояние здоровья женщин')
percent_male = len(male_subset) / (len(male_subset) + len(female_subset)) * 100
percent_female = len(female_subset) / (len(male_subset) + len(female_subset)) * 100

# Добавление текст с процентом мужчин и женщин
fig.text(0.28, 0.1, 'Процент мужчин: %.2f%%' % percent_male, ha='center', fontsize=12)
fig.text(0.74, 0.1, 'Процент женщин: %.2f%%' % percent_female, ha='center', fontsize=12)
plt.show()