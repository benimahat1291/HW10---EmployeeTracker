DROP DATABASE IF EXISTS employees_db;
CREATE DATABASE employees_db;
USE employees_db;

CREATE TABLE department(
    id integer auto_increment not null,
    name varchar(30) not null,
    primary key(id)
);


CREATE TABLE roles(
    id integer auto_increment not null,
    title varchar(30) not null,
    salary decimal not null,
    department_id integer not null,
    primary key(id)
);

CREATE TABLE employees(
    id integer auto_increment not null,
    first_name varchar(30) not null,
    last_name varchar(30) not null,
    roles_id integer not null,
    manager_id integer,
    primary key(id)
);


INSERT into department (name)
VALUES ("Manager");
INSERT into department (name)
VALUES ("Sales");
INSERT into department (name)
VALUES ("Legal");
INSERT into department (name)
VALUES ("Engineering");
INSERT into department (name)
VALUES ("Finance");

INSERT INTO roles (title, salary, department_id)
VALUES ("Manager", 65000, 1);
INSERT INTO roles (title, salary, department_id)
VALUES ("Sales Lead", 45000, 2);
INSERT INTO roles (title, salary, department_id)
VALUES ("Salesperson", 35000, 2);
INSERT INTO roles (title, salary, department_id)
VALUES ("Lead Engineer", 43000, 4);
INSERT INTO roles (title, salary, department_id)
VALUES ("Accountant", 50000, 5);
INSERT INTO roles (title, salary, department_id)
VALUES ("Legal", 50000, 3);


INSERT INTO employees (first_name, last_name, roles_id)
VALUES ("Timmy","Stevens", 1);
INSERT INTO employees (first_name, last_name, roles_id)
VALUES ("Jonny","Grayson", 2);
INSERT INTO employees (first_name, last_name, roles_id)
VALUES ("Jack","Sparrow", 3);
INSERT INTO employees (first_name, last_name, roles_id)
VALUES ("Harry","Potter", 4);
INSERT INTO employees (first_name, last_name, roles_id)
VALUES ("Jimmy","Fallon", 5);
INSERT INTO employees (first_name, last_name, roles_id)
VALUES ("Bruce","Wayne", 6);
INSERT INTO employees (first_name, last_name, roles_id)
VALUES ("Peter","Parker", 7);

