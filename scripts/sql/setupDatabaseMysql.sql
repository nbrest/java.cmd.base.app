-- ********************************
-- *** Last updated: 2017/04/02 ***
-- ********************************

-- Create schema:
DROP SCHEMA IF EXISTS baseapp;
CREATE SCHEMA baseapp;

-- Use schema:
USE baseapp;

-- Create user:
-- Use '%' instead of 'localhost' to allow to connect remotely with this user
DROP USER IF EXISTS 'baseappUser'@'localhost';
CREATE USER 'baseappUser'@'localhost' identified by 'baseappPwd';

-- Grant privileges:
GRANT ALL PRIVILEGES ON baseapp.* TO 'baseappUser'@'localhost';

-- Application Tables for mysql:
DROP TABLE IF EXISTS dragonballuser;
DROP TABLE IF EXISTS hibernate_sequence;

CREATE TABLE dragonballuser (
  id bigint(20) NOT NULL,
  age int(11) DEFAULT NULL,
  email varchar(255) DEFAULT NULL,
  powerlevel int(11) DEFAULT NULL,
  stamina int(11) DEFAULT NULL,
  username varchar(255) NOT NULL,
  PRIMARY KEY (id),
  UNIQUE KEY UK_username (username)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE hibernate_sequence (
   next_val bigint(20) DEFAULT NULL
 ) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Hibernate expects hibernate_sequence to have an initial value or it will fail
INSERT INTO hibernate_sequence(next_val) VALUES (0);

-- Query application tables:
SELECT * FROM dragonballuser;
SELECT * FROM hibernate_sequence;

-- Query user permissions in mysql:
SELECT * FROM mysql.user;

-- Export table creation script in mysql:
show create table dragonballuser;
show create table hibernate_sequence;
