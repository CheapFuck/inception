-- Create a database and a user with privileges
CREATE DATABASE IF NOT EXISTS my_database;
CREATE USER IF NOT EXISTS 'my_user'@'%' IDENTIFIED BY 'my_password';
GRANT ALL PRIVILEGES ON my_database.* TO 'my_user'@'%' IDENTIFIED BY 'my_password';
FLUSH PRIVILEGES;
