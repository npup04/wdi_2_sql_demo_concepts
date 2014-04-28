CREATE DATABASE classroom_demo;
\c classroom_demo

CREATE TABLE students (
  first_name TEXT,
  last_name TEXT,
  gpa NUMERIC(3, 2),
  birthday DATE
);

CREATE TABLE teachers (
  first_name TEXT,
  last_name TEXT,
  salary MONEY,
  birthday DATE
);
