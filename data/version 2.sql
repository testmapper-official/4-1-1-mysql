-- DDL Generated from https:/databasediagram.com

CREATE TABLE Person (
  ID int PRIMARY KEY,
  firstname varchar(64),
  surname varchar(64),
  telephone varchar(20),
  birthdate timestamp,
  gender varchar(6),
  age int NOT NULL,
  creation_date timestamp
);

CREATE TABLE Doctor (
  personID int PRIMARY KEY REFERENCES Person(ID),
  job_title varchar(128),
  organization varchar(128)
);

CREATE TABLE Patient (
  personID int PRIMARY KEY REFERENCES Person(ID),
  heart_disease tinyint,
  hypertension tinyint,
  diabetes tinyint,
  smoking_history varchar(256)
);

CREATE TABLE Test (
  ID int PRIMARY KEY,
  patientID int REFERENCES Patient(personID),
  doctorID int REFERENCES Doctor(personID),
  hbA1c_level decimal,
  blood_glucose int,
  bmi int,
  start_date timestamp NOT NULL,
  end_date timestamp
);
