--------------------------------------------------------
--  File created - Tuesday-May-24-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table FLIGHT_DETAILS
--------------------------------------------------------

  CREATE TABLE "FLIGHT_DETAILS" 
   (	"FLIGHT_ID" VARCHAR2(25 BYTE), 
	"FLIGHT_NAME" VARCHAR2(25 BYTE), 
	"SOURCE" VARCHAR2(50 BYTE), 
	"DESTINATION" VARCHAR2(50 BYTE), 
	"ESTIMATED_TRAVEL_DURATION" VARCHAR2(15 BYTE), 
	"SEATING_CAPACITY" NUMBER(*,0), 
	"RESERVATION_TYPE" VARCHAR2(15 BYTE), 
	"RESERVATION_CAPACITY" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table FLIGHT_SCHEDULE_DETAILS
--------------------------------------------------------

  CREATE TABLE "FLIGHT_SCHEDULE_DETAILS" 
   (	"FLIGHT_ID" VARCHAR2(25 BYTE), 
	"FLIGHT_NAME" VARCHAR2(25 BYTE), 
	"AVAILABLE_DAYS" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table PAYMENT_ONLINE_DETAILS
--------------------------------------------------------

  CREATE TABLE "PAYMENT_ONLINE_DETAILS" 
   (	"CREDIT_CARD_NUMBER" VARCHAR2(16 BYTE), 
	"CREDIT_CARD_VALIDITY" VARCHAR2(10 BYTE), 
	"TICKET_CHARGES" FLOAT(126)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table RESERVE_FLIGHT_DETAILS
--------------------------------------------------------

  CREATE TABLE "RESERVE_FLIGHT_DETAILS" 
   (	"USER_ID" NUMBER(*,0), 
	"FLIGHT_ID" VARCHAR2(25 BYTE), 
	"DATE_OF_JOURNEY" VARCHAR2(20 BYTE), 
	"NO_OF_SEATS" NUMBER(*,0), 
	"RESERVATION_TYPE" VARCHAR2(15 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table ROUTE_DETAILS
--------------------------------------------------------

  CREATE TABLE "ROUTE_DETAILS" 
   (	"ROUTE_ID" NUMBER(*,0), 
	"ROUTE_NAME" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table USER_DETAILS
--------------------------------------------------------

  CREATE TABLE "USER_DETAILS" 
   (	"USER_ID" NUMBER(*,0), 
	"PASSWORD" VARCHAR2(20 BYTE), 
	"FIRST_NAME" VARCHAR2(50 BYTE), 
	"LAST_NAME" VARCHAR2(50 BYTE), 
	"DATE_OF_BIRTH" VARCHAR2(20 BYTE), 
	"AGE" NUMBER(*,0), 
	"GENDER" VARCHAR2(10 BYTE), 
	"ADDRESS" VARCHAR2(150 BYTE), 
	"PHONE_NUMBER" NUMBER(*,0), 
	"MAIL" VARCHAR2(50 BYTE), 
	"LOGIN_STATUS" VARCHAR2(15 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table FLIGHT_DETAILS
--------------------------------------------------------

  CREATE TABLE "FLIGHT_DETAILS" 
   (	"FLIGHT_ID" VARCHAR2(25 BYTE), 
	"FLIGHT_NAME" VARCHAR2(25 BYTE), 
	"SOURCE" VARCHAR2(50 BYTE), 
	"DESTINATION" VARCHAR2(50 BYTE), 
	"ESTIMATED_TRAVEL_DURATION" VARCHAR2(15 BYTE), 
	"SEATING_CAPACITY" NUMBER(*,0), 
	"RESERVATION_TYPE" VARCHAR2(15 BYTE), 
	"RESERVATION_CAPACITY" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Table USER_DETAILS
--------------------------------------------------------

  CREATE TABLE "USER_DETAILS" 
   (	"USER_ID" NUMBER(*,0), 
	"PASSWORD" VARCHAR2(20 BYTE), 
	"FIRST_NAME" VARCHAR2(50 BYTE), 
	"LAST_NAME" VARCHAR2(50 BYTE), 
	"DATE_OF_BIRTH" VARCHAR2(20 BYTE), 
	"AGE" NUMBER(*,0), 
	"GENDER" VARCHAR2(10 BYTE), 
	"ADDRESS" VARCHAR2(150 BYTE), 
	"PHONE_NUMBER" NUMBER(*,0), 
	"MAIL" VARCHAR2(50 BYTE), 
	"LOGIN_STATUS" VARCHAR2(15 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
REM INSERTING into HR.FLIGHT_DETAILS
SET DEFINE OFF;
REM INSERTING into HR.FLIGHT_SCHEDULE_DETAILS
SET DEFINE OFF;
REM INSERTING into HR.PAYMENT_ONLINE_DETAILS
SET DEFINE OFF;
REM INSERTING into HR.RESERVE_FLIGHT_DETAILS
SET DEFINE OFF;
REM INSERTING into HR.ROUTE_DETAILS
SET DEFINE OFF;
REM INSERTING into HR.USER_DETAILS
SET DEFINE OFF;
--------------------------------------------------------
--  DDL for Index SYS_C007117
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007117" ON "FLIGHT_DETAILS" ("FLIGHT_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Index SYS_C007116
--------------------------------------------------------

  CREATE UNIQUE INDEX "SYS_C007116" ON "USER_DETAILS" ("USER_ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  Constraints for Table FLIGHT_DETAILS
--------------------------------------------------------

  ALTER TABLE "FLIGHT_DETAILS" ADD PRIMARY KEY ("FLIGHT_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table USER_DETAILS
--------------------------------------------------------

  ALTER TABLE "USER_DETAILS" ADD PRIMARY KEY ("USER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table FLIGHT_SCHEDULE_DETAILS
--------------------------------------------------------

  ALTER TABLE "FLIGHT_SCHEDULE_DETAILS" ADD FOREIGN KEY ("FLIGHT_ID")
	  REFERENCES "FLIGHT_DETAILS" ("FLIGHT_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RESERVE_FLIGHT_DETAILS
--------------------------------------------------------

  ALTER TABLE "RESERVE_FLIGHT_DETAILS" ADD FOREIGN KEY ("USER_ID")
	  REFERENCES "USER_DETAILS" ("USER_ID") ENABLE;
  ALTER TABLE "RESERVE_FLIGHT_DETAILS" ADD FOREIGN KEY ("FLIGHT_ID")
	  REFERENCES "FLIGHT_DETAILS" ("FLIGHT_ID") ENABLE;