DROP DATABASE IF EXISTS employees_db;
CREATE DATABASE employees_db;
USE employees_db;

CREATE TABLE departments(
    id integer auto_increment not null primary key,
    name varchar(30) not null
);


CREATE TABLE roles(
    id integer auto_increment not null primary key,
    title varchar(30) not null,
    salary decimal not null,
    departments_id integer not null,
    foreign key (departments_id) references departments(id)

);

CREATE TABLE employees(
    id integer auto_increment not null primary key,
    first_name varchar(30) not null,
    last_name varchar(30) not null,
    roles_id integer not null,
    manager_id integer,
    foreign key (roles_id) references roles(id),
    foreign key (manager_id) references employees(id)
 
);



INSERT into departments (name)
VALUES ("Manager");
INSERT into departments (name)
VALUES ("Sales");
INSERT into departments (name)
VALUES ("Legal");
INSERT into departments (name)
VALUES ("Engineering");
INSERT into departments (name)
VALUES ("Finance");


INSERT INTO roles (title, salary, departments_id)
VALUES ("Manager", 65000, 1);
INSERT INTO roles (title, salary, departments_id)
VALUES ("Sales Lead", 45000, 2);
INSERT INTO roles (title, salary, departments_id)
VALUES ("Salesperson", 35000, 2);
INSERT INTO roles (title, salary, departments_id)
VALUES ("Lead Engineer", 43000, 4);
INSERT INTO roles (title, salary, departments_id)
VALUES ("Accountant", 50000, 5);
INSERT INTO roles (title, salary, departments_id)
VALUES ("Legal", 50000, 3);
INSERT INTO roles (title, salary, departments_id)
VALUES ("SofwarEngineer", 40000, 4);



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

select * from employees;
select * from roles;
select * from departments;