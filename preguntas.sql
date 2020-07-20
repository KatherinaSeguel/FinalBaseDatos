--------------------------------------------------------
-- Archivo creado  - lunes-julio-20-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table PREGUNTAS
--------------------------------------------------------

  CREATE TABLE "TDIGITAL"."PREGUNTAS" 
   (	"IDPRE" NUMBER(*,0), 
	"IDTEST" NUMBER(*,0), 
	"NUMPRE" NUMBER(*,0), 
	"ENUNCIADO" VARCHAR2(30 BYTE), 
	"PUNTAJE" NUMBER(*,0), 
	"TESTEVA_IDTEST" NUMBER(*,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into TDIGITAL.PREGUNTAS
SET DEFINE OFF;
Insert into TDIGITAL.PREGUNTAS (IDPRE,IDTEST,NUMPRE,ENUNCIADO,PUNTAJE,TESTEVA_IDTEST) values ('1','1','1','Enunciado Test 1 pregunta 1','10','1');
Insert into TDIGITAL.PREGUNTAS (IDPRE,IDTEST,NUMPRE,ENUNCIADO,PUNTAJE,TESTEVA_IDTEST) values ('2','1','2','Enunciado Test 1 pregunta 2','10','1');
Insert into TDIGITAL.PREGUNTAS (IDPRE,IDTEST,NUMPRE,ENUNCIADO,PUNTAJE,TESTEVA_IDTEST) values ('3','1','3','Enunciado Test 1 pregunta 3','10','1');
Insert into TDIGITAL.PREGUNTAS (IDPRE,IDTEST,NUMPRE,ENUNCIADO,PUNTAJE,TESTEVA_IDTEST) values ('4','1','4','Enunciado Test 1  pregunta 4','10','1');
Insert into TDIGITAL.PREGUNTAS (IDPRE,IDTEST,NUMPRE,ENUNCIADO,PUNTAJE,TESTEVA_IDTEST) values ('5','1','5','Enunciado Test 1 pregunta 5','10','1');
Insert into TDIGITAL.PREGUNTAS (IDPRE,IDTEST,NUMPRE,ENUNCIADO,PUNTAJE,TESTEVA_IDTEST) values ('6','1','6','Enunciado Test 1  pregunta 6','10','1');
Insert into TDIGITAL.PREGUNTAS (IDPRE,IDTEST,NUMPRE,ENUNCIADO,PUNTAJE,TESTEVA_IDTEST) values ('7','1','7','Enunciado Test 1 pregunta 7','10','1');
Insert into TDIGITAL.PREGUNTAS (IDPRE,IDTEST,NUMPRE,ENUNCIADO,PUNTAJE,TESTEVA_IDTEST) values ('8','1','8','Enunciado Test 1 pregunta 8','10','1');
Insert into TDIGITAL.PREGUNTAS (IDPRE,IDTEST,NUMPRE,ENUNCIADO,PUNTAJE,TESTEVA_IDTEST) values ('9','1','9','Enunciado Test 1 pregunta 9','10','1');
Insert into TDIGITAL.PREGUNTAS (IDPRE,IDTEST,NUMPRE,ENUNCIADO,PUNTAJE,TESTEVA_IDTEST) values ('10','1','10','Enunciado Test 1 pregunta 10','10','1');
Insert into TDIGITAL.PREGUNTAS (IDPRE,IDTEST,NUMPRE,ENUNCIADO,PUNTAJE,TESTEVA_IDTEST) values ('11','2','1','Enunciado Test 2 pregunta 1','10','2');
Insert into TDIGITAL.PREGUNTAS (IDPRE,IDTEST,NUMPRE,ENUNCIADO,PUNTAJE,TESTEVA_IDTEST) values ('12','2','2','Enunciado Test 2 pregunta 2','10','2');
Insert into TDIGITAL.PREGUNTAS (IDPRE,IDTEST,NUMPRE,ENUNCIADO,PUNTAJE,TESTEVA_IDTEST) values ('13','2','3','Enunciado Test 2 pregunta 3','10','2');
Insert into TDIGITAL.PREGUNTAS (IDPRE,IDTEST,NUMPRE,ENUNCIADO,PUNTAJE,TESTEVA_IDTEST) values ('14','2','4','Enunciado Test 2 pregunta 4','10','2');
Insert into TDIGITAL.PREGUNTAS (IDPRE,IDTEST,NUMPRE,ENUNCIADO,PUNTAJE,TESTEVA_IDTEST) values ('15','2','5','Enunciado Test 2 pregunta 5','10','2');
Insert into TDIGITAL.PREGUNTAS (IDPRE,IDTEST,NUMPRE,ENUNCIADO,PUNTAJE,TESTEVA_IDTEST) values ('16','2','6','Enunciado Test 2 pregunta 6','10','2');
Insert into TDIGITAL.PREGUNTAS (IDPRE,IDTEST,NUMPRE,ENUNCIADO,PUNTAJE,TESTEVA_IDTEST) values ('17','2','7','Enunciado Test 2 pregunta 7','10','2');
Insert into TDIGITAL.PREGUNTAS (IDPRE,IDTEST,NUMPRE,ENUNCIADO,PUNTAJE,TESTEVA_IDTEST) values ('18','2','8','Enunciado Test 2 pregunta 8','10','2');
Insert into TDIGITAL.PREGUNTAS (IDPRE,IDTEST,NUMPRE,ENUNCIADO,PUNTAJE,TESTEVA_IDTEST) values ('19','2','9','Enunciado Test 2 pregunta 9','10','2');
Insert into TDIGITAL.PREGUNTAS (IDPRE,IDTEST,NUMPRE,ENUNCIADO,PUNTAJE,TESTEVA_IDTEST) values ('20','2','10','Enunciado Test 2 pregunta 10','10','2');
--------------------------------------------------------
--  DDL for Index PREGUNTAS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TDIGITAL"."PREGUNTAS_PK" ON "TDIGITAL"."PREGUNTAS" ("IDPRE", "TESTEVA_IDTEST") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table PREGUNTAS
--------------------------------------------------------

  ALTER TABLE "TDIGITAL"."PREGUNTAS" ADD CONSTRAINT "PREGUNTAS_PK" PRIMARY KEY ("IDPRE", "TESTEVA_IDTEST")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "TDIGITAL"."PREGUNTAS" MODIFY ("TESTEVA_IDTEST" NOT NULL ENABLE);
  ALTER TABLE "TDIGITAL"."PREGUNTAS" MODIFY ("PUNTAJE" NOT NULL ENABLE);
  ALTER TABLE "TDIGITAL"."PREGUNTAS" MODIFY ("ENUNCIADO" NOT NULL ENABLE);
  ALTER TABLE "TDIGITAL"."PREGUNTAS" MODIFY ("NUMPRE" NOT NULL ENABLE);
  ALTER TABLE "TDIGITAL"."PREGUNTAS" MODIFY ("IDTEST" NOT NULL ENABLE);
  ALTER TABLE "TDIGITAL"."PREGUNTAS" MODIFY ("IDPRE" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table PREGUNTAS
--------------------------------------------------------

  ALTER TABLE "TDIGITAL"."PREGUNTAS" ADD CONSTRAINT "PREGUNTAS_TESTEVA_FK" FOREIGN KEY ("TESTEVA_IDTEST")
	  REFERENCES "TDIGITAL"."TESTEVA" ("IDTEST") ON DELETE CASCADE ENABLE;
