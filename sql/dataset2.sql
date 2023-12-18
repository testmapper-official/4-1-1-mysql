USE diabet_predict;

CREATE TABLE dataset2 (
  gender VARCHAR(16),
  age INT,
  hypertension TINYINT,
  heart_disease TINYINT,
  smoking_history VARCHAR(64),
  bmi DECIMAL(10, 2),
  HbA1c_level DECIMAL(10, 2),
  blood_glucose_level INT,
  diabetes TINYINT
);

LOAD DATA INFILE '\diabetes_prediction_dataset.csv'
    INTO TABLE dataset2 
    FIELDS OPTIONALLY ENCLOSED BY '"' TERMINATED BY ','
    LINES TERMINATED BY '\r\n'
    IGNORE 1 LINES
    (gender, age, hypertension, heart_disease, smoking_history, bmi, HbA1c_level, blood_glucose_level, diabetes)

ALTER TABLE diabet_predict.dataset
ADD COLUMN ID INT AUTO_INCREMENT PRIMARY KEY FIRST;

INSERT INTO diabet_predict.gender(ID, gender)
SELECT ID, gender
FROM dataset2;

INSERT INTO diabet_predict.smokinghistory(ID, smk_info)
SELECT ID, smoking_history
FROM dataset2;

INSERT INTO diabet_predict.bloodanalysis(ID, genderID, smID, age, bmi, HbA1c_level, blood_glucose, heart_disease, hypertension, diabetes)
SELECT ID, ID, ID, age, bmi, HbA1c_level, blood_glucose_level, heart_disease, hypertension, diabetes
FROM dataset2;