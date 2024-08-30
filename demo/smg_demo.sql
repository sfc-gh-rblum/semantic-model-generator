--create database objects
create database CATRANSLATOR;
create schema CATRANSLATOR.ANALYTICS;
create stage CATRANSLATOR.ANALYTICS.DATA;
create or replace table CATRANSLATOR.ANALYTICS.CUSTOMERS
(
	CUSTOMER_ID VARCHAR(16777216),
	CUSTOMER_NAME VARCHAR(16777216),
	COUNT_LIFETIME_ORDERS NUMBER(18,0),
	FIRST_ORDERED_AT DATE,
	LAST_ORDERED_AT DATE,
	LIFETIME_SPEND_PRETAX NUMBER(22,2),
	LIFETIME_TAX_PAID NUMBER(22,2),
	LIFETIME_SPEND NUMBER(22,2),
	CUSTOMER_TYPE VARCHAR(9)
);

--load data to stage CATRANSLATOR.ANALYTICS.DATA


--load data to table
copy into CATRANSLATOR.ANALYTICS.CUSTOMERS (customer_id, customer_name, count_lifetime_orders, first_ordered_at, last_ordered_at, lifetime_spend_pretax, lifetime_tax_paid, lifetime_spend, customer_type)
from @data/SMG_DEMO.csv
file_format = (
    type = 'CSV'
    field_delimiter = ','
    skip_header = 1
    ); 


--verify the data
select * from CATRANSLATOR.ANALYTICS.CUSTOMERS;


