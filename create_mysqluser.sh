#/bin/bash
NEW_USER="teacher"
NEW_USER_PASSWORD="test..123"
sudo mariadb <<MYSQL_SCRIPT
-- Create a new database with a dynamic name


-- Create a new user and grant privileges
CREATE USER '$NEW_USER'@'localhost' IDENTIFIED BY '$NEW_USER_PASSWORD';
GRANT ALL PRIVILEGES ON *.* TO '$NEW_USER'@'localhost';
FLUSH PRIVILEGES;

-- Use the new database
CREATE DATABASE IF NOT EXISTS teacher;
USE teacher;

-- Create a sample table and insert example data
CREATE TABLE IF NOT EXISTS sample_table (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    age INT
);

INSERT INTO sample_table (name, age) VALUES ('John Doe', 30);
INSERT INTO sample_table (name, age) VALUES ('Jane Smith', 25);

MYSQL_SCRIPT

echo "Created teacher account"