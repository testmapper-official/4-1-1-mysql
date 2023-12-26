USE diabet_predict;
DROP TABLE IF EXISTS dataset2;
CREATE TEMPORARY TABLE IF NOT EXISTS dataset2 (
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

LOAD DATA INFILE '/var/lib/mysql-files/diabetes_prediction_dataset.csv'
    INTO TABLE dataset2 
    FIELDS OPTIONALLY ENCLOSED BY '"' TERMINATED BY ','
    LINES TERMINATED BY '\r\n'
    IGNORE 1 LINES
    (gender, age, hypertension, heart_disease, smoking_history, bmi, HbA1c_level, blood_glucose_level, diabetes);

ALTER TABLE diabet_predict.dataset2
ADD COLUMN ID INT AUTO_INCREMENT PRIMARY KEY FIRST;

INSERT INTO diabet_predict.Gender(ID, name)
SELECT ROW_NUMBER() OVER (ORDER BY gender ASC) as ID, gender as name
FROM (SELECT DISTINCT gender FROM dataset2) as dataset2;

INSERT INTO diabet_predict.SmokingHistory(ID, info)
SELECT ROW_NUMBER() OVER (ORDER BY smoking_history ASC) as ID, smoking_history as info
FROM (SELECT DISTINCT smoking_history FROM dataset2) as dataset2;

INSERT INTO diabet_predict.BloodAnalysis
( SELECT ds.ID, gend.ID as genderID, sh.ID as shID, ds.age, ds.bmi, ds.HbA1c_level, ds.blood_glucose_level, ds.heart_disease, ds.hypertension, ds.diabetes
FROM dataset2 as ds, SmokingHistory as sh, Gender as gend
WHERE sh.info = ds.smoking_history AND gend.name = ds.gender );

DROP TABLE IF EXISTS dataset2;