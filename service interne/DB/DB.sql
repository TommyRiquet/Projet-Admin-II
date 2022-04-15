CREATE DATABASE 'Woodytoys'

CREATE TABLE 'articles' (
  'ID' INTEGER NOT NULL AUTO_INCREMENT,
  'article' varchar(90) NOT NULL,
  'prix' INTEGER NOT NULL,
  CONSTRAINT 'pk_articles' PRIMERY KEY (ID);
)

CREATE USER admin IDENTIFIED WITH mysql_native_password BY 'password'

GRANT ALL PRIVILEGES ON Woodytoys.* TO admin 
