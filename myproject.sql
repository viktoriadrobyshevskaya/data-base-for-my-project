CREATE DATABASE IF NOT EXISTS myprojectVer2;
USE myprojectVer2;

CREATE TABLE IF NOT EXISTS authors
(
  id_author INT NOT NULL AUTO_INCREMENT,
  name VARCHAR(30) NOT NULL,
  middleName VARCHAR(30) NOT NULL,
  surname VARCHAR(30) NOT NULL,
  booksNumber INT NOT NULL,
  PRIMARY KEY (id_author)
  );
  
CREATE TABLE IF NOT EXISTS books
(
  id_book INT NOT NULL AUTO_INCREMENT,
  id_author INT NOT NULL,
  title VARCHAR(30) NOT NULL,
  year VARCHAR(4) NOT NULL,
  number INT NOT NULL,
  PRIMARY KEY (id_book),
  FOREIGN KEY (id_author) REFERENCES authors(id_author)
  );

CREATE TABLE IF NOT EXISTS roles
(
  id_role INT NOT NULL AUTO_INCREMENT,
  title VARCHAR(30) NOT NULL,
  PRIMARY KEY (id_role)
  );
  
CREATE TABLE IF NOT EXISTS users
(
  id_user INT NOT NULL AUTO_INCREMENT,
  login VARCHAR(30) NOT NULL,
  password VARCHAR(30) NOT NULL,
  id_role INT NOT NULL,
  FOREIGN KEY (id_role) REFERENCES roles(id_role),
  PRIMARY KEY (id_user)
  );
  
CREATE TABLE IF NOT EXISTS user_details
(
  id INT NOT NULL AUTO_INCREMENT,
  id_user INT NOT NULL,
  name VARCHAR(30) NOT NULL,
  middleName VARCHAR(30) NOT NULL,
  surname VARCHAR(30) NOT NULL,
  address VARCHAR(30) NULL DEFAULT NULL,
  phone VARCHAR(30) NULL DEFAULT NULL,
  FOREIGN KEY (id_user) REFERENCES users(id_user),
  PRIMARY KEY (id)
  );
  
  CREATE TABLE IF NOT EXISTS library_cards
(
  id_card INT NOT NULL AUTO_INCREMENT,
  id_user INT NOT NULL,
  FOREIGN KEY (id_user) REFERENCES users(id_user),
  PRIMARY KEY (id_card)
  );
  
   CREATE TABLE IF NOT EXISTS book_issuances
(
  id_issuance INT NOT NULL AUTO_INCREMENT,
  id_card INT NOT NULL,
  id_book INT NOT NULL,
  date_of_issue DATE NOT NULL,
  return_date DATE NOT NULL,
  FOREIGN KEY (id_card) REFERENCES library_cards(id_card),
  FOREIGN KEY (id_book) REFERENCES books(id_book),
  PRIMARY KEY (id_issuance)
  )