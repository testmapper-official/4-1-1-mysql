USE diabet_predict;
DROP TABLE IF EXISTS dataset2;
CREATE TABLE IF NOT EXISTS dataset2 (
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
    (gender, age, hypertension, heart_disease, smoking_history, bmi, HbA1c_level, blood_glucose_level, diabetes);

ALTER TABLE diabet_predict.dataset2
ADD COLUMN ID INT AUTO_INCREMENT PRIMARY KEY FIRST;

INSERT INTO diabet_predict.gender(ID, name)
SELECT ID, gender
FROM dataset2;

ALTER TABLE diabet_predict.gender
ADD COLUMN genderID INT PRIMARY KEY;
UPDATE diabet_predict.gender
    SET genderID = 1
    WHERE name = 'Male';
UPDATE gender
    SET genderID = 2
    WHERE name = 'Female';

INSERT INTO diabet_predict.smokinghistory(ID, info)
SELECT ID, smoking_history
FROM dataset2;

ALTER TABLE diabet_predict.smokinghistory
ADD COLUMN skID INT PRIMARY KEY;
UPDATE diabet_predict.smokinghistory
    SET skID = 1
    WHERE info = 'never';
UPDATE diabet_predict.smokinghistory
    SET skID = 2
    WHERE info = 'not current'; 
UPDATE diabet_predict.smokinghistory
    SET skID = 3
    WHERE info = 'No info';
UPDATE diabet_predict.smokinghistory
    SET skID = 4
    WHERE info = 'ever';
UPDATE diabet_predict.smokinghistory
    SET skID = 5
    WHERE info = 'former';  
USE diabet_predict;
INSERT INTO diabet_predict.bloodanalysis
( SELECT ds.ID, gend.genderID, sh.skID, ds.age, ds.bmi, ds.HbA1c_level, ds.blood_glucose_level, ds.heart_disease, ds.hypertension, ds.diabetes
FROM dataset2 as ds, smokingHistory as sh, Gender as gend
WHERE sh.info = ds.smoking_history AND gend.name = ds.gender )
