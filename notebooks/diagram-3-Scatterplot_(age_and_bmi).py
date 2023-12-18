import pandas as pd
import matplotlib.pyplot as plt

data = pd.read_csv('diabetes_prediction_dataset.csv')

plt.figure(figsize=(10, 6))
plt.scatter(data['age'], data['bmi'], c=data['diabetes'].map({0: 'lightgreen', 1: 'Red'}), s=15)

plt.xlabel('Age')
plt.ylabel('BMI')
plt.title('Диаграмма рассеивания - зависимость: возраст от BMI')

plt.show()