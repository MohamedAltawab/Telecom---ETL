-- Create DB --
USE master
GO
IF EXISTS (SELECT * FROM SYS.DATABASES WHERE name = 'Telecom')
DROP DATABASE  
GO
CREATE DATABASE Telecom

-- Create Fact Table -- 
USE Telecom
IF EXISTS (SELECT * FROM SYS.TABLES WHERE name = 'fact_transaction')
DROP TABLE fact_transaction
GO
CREATE TABLE fact_transaction (
	id int NOT NULL identity (1,1),
	transaction_id int NOT NULL, -- transaction id from the source system / file
	imsi varchar(9) NOT NULL,
	subscriber_id int,
	tac varchar(8) NOT NULL,
	snr varchar(6) NOT NULL,
	imei varchar(14)  NULL,
	cell int NOT NULL,
	lac int NOT NULL,
	event_type varchar(2)  NULL,
	event_ts datetime NOT NULL,
	audit_id int NOT NULL default (-1)

	constraint pk_fact_transaction_id primary key (id)
)

--ALTER fact_transaction TO ALLOW NULLS IN COLUMNS tac , snr
ALTER TABLE fact_transaction ALTER COLUMN tac VARCHAR(8) NULL
ALTER TABLE fact_transaction ALTER COLUMN snr VARCHAR(8) NULL

--DELETE fact_transaction DATA
TRUNCATE TABLE fact_transaction
--SHOW fact_transaction DATA
SELECT * FROM fact_transaction