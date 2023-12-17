CREATE DATABASE IF NOT EXISTS 'diabet_predict'

USE `diabet_predict`;

CREATE TABLE SmokingHistory (
  ID INT PRIMARY KEY,
  info VARCHAR(64)
);

CREATE TABLE Gender (
  ID INT PRIMARY KEY,
  name VARCHAR(16)
);

CREATE TABLE BloodAnalysis (
  ID INT PRIMARY KEY,
  genderID INT,
  FOREIGN KEY (genderID) REFERENCES Gender(ID),
  skID INT,
  FOREIGN KEY (skID) REFERENCES SmokingHistory(ID),
  age INT,
  bmi DECIMAL(10, 2),
  hbA1c_level DECIMAL(10, 2),
  blood_glucose INT,
  heart_disease TINYINT,
  hypertension TINYINT,
  diabetes TINYINT
);
