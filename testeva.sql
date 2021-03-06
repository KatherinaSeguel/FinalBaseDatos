--------------------------------------------------------
-- Archivo creado  - lunes-julio-20-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table TESTEVA
--------------------------------------------------------

  CREATE TABLE "TDIGITAL"."TESTEVA" 
   (	"IDTEST" NUMBER(*,0), 
	"NOMBRETEST" VARCHAR2(30 BYTE), 
	"DESCTEST" VARCHAR2(30 BYTE), 
	"PROGRAMACURSO" VARCHAR2(30 BYTE), 
	"UNIDADMOD" VARCHAR2(30 BYTE), 
	"AUTHOR" VARCHAR2(30 BYTE), 
	"FECHACREA" DATE, 
	"ID_CURSO" NUMBER(*,0), 
	"CURSO_IDCURSO" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into TDIGITAL.TESTEVA
SET DEFINE OFF;
Insert into TDIGITAL.TESTEVA (IDTEST,NOMBRETEST,DESCTEST,PROGRAMACURSO,UNIDADMOD,AUTHOR,FECHACREA,ID_CURSO,CURSO_IDCURSO) values ('1','Programación Básica en Java','Test1','Programación FullStack','Algoritmos','Juan Peréz',to_date('05/05/20','DD/MM/RR'),'1','1');
Insert into TDIGITAL.TESTEVA (IDTEST,NOMBRETEST,DESCTEST,PROGRAMACURSO,UNIDADMOD,AUTHOR,FECHACREA,ID_CURSO,CURSO_IDCURSO) values ('2','Lenguaje de Base de Datos','Test Final','Java Trainnie','Bases de Datos Relacionales','Claudiasolar',to_date('10/06/20','DD/MM/RR'),'1','1');
Insert into TDIGITAL.TESTEVA (IDTEST,NOMBRETEST,DESCTEST,PROGRAMACURSO,UNIDADMOD,AUTHOR,FECHACREA,ID_CURSO,CURSO_IDCURSO) values ('3','Aplicaciones móviles Android','Test 1','Programación Android','Leng. de Definición de Datos','Pedro Pozo',to_date('01/07/20','DD/MM/RR'),'2','2');
--------------------------------------------------------
--  DDL for Index TESTEVA_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TDIGITAL"."TESTEVA_PK" ON "TDIGITAL"."TESTEVA" ("IDTEST") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table TESTEVA
--------------------------------------------------------

  ALTER TABLE "TDIGITAL"."TESTEVA" ADD CONSTRAINT "TESTEVA_PK" PRIMARY KEY ("IDTEST")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "TDIGITAL"."TESTEVA" MODIFY ("CURSO_IDCURSO" NOT NULL ENABLE);
  ALTER TABLE "TDIGITAL"."TESTEVA" MODIFY ("AUTHOR" NOT NULL ENABLE);
  ALTER TABLE "TDIGITAL"."TESTEVA" MODIFY ("PROGRAMACURSO" NOT NULL ENABLE);
  ALTER TABLE "TDIGITAL"."TESTEVA" MODIFY ("DESCTEST" NOT NULL ENABLE);
  ALTER TABLE "TDIGITAL"."TESTEVA" MODIFY ("NOMBRETEST" NOT NULL ENABLE);
  ALTER TABLE "TDIGITAL"."TESTEVA" MODIFY ("IDTEST" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table TESTEVA
--------------------------------------------------------

  ALTER TABLE "TDIGITAL"."TESTEVA" ADD CONSTRAINT "TESTEVA_CURSO_FK" FOREIGN KEY ("CURSO_IDCURSO")
	  REFERENCES "TDIGITAL"."CURSO" ("IDCURSO") ON DELETE CASCADE ENABLE;
