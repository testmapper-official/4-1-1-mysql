-- DDL Generated from https:/databasediagram.com

CREATE TABLE Patient (
  ID int PRIMARY KEY,
  firstname varchar(64),
  surname varchar(64),
  gender varchar(6),
  age int NOT NULL,
  heart_disease tinyint,
  hypertension tinyint,
  diabetes tinyint,
  smoking_history varchar(256)
);

CREATE TABLE Test (
  ID int PRIMARY KEY,
  patientID int REFERENCES Patient(ID),
  hbA1c_level decimal,
  blood_glucose int,
  bmi int
);
