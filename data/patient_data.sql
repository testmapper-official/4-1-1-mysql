CREATE DATABASE IF NOT EXISTS 'diabet_patients'

USE `diabet_patients`;

CREATE TABLE Patient (
  ID int PRIMARY KEY,
  gender varchar(6) NOT NULL,
  age int NOT NULL,
  heart_disease tinyint DEFAULT 0,
  hypertension tinyint DEFAULT 0,
  diabetes tinyint DEFAULT 0,
  smoking_history varchar(256) DEFAULT "No Info"
);

CREATE TABLE Test (
  ID int PRIMARY KEY,
  patientID int REFERENCES Patient(ID),
  hbA1c_level decimal,
  blood_glucose int,
  bmi int
);
