-- Generado por Oracle SQL Developer Data Modeler 20.2.0.167.1538
--   en:        2020-07-18 19:33:04 CLT
--   sitio:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE alternativas (
    id_test                   INTEGER NOT NULL,
    id_preg                   INTEGER NOT NULL,
    altern                    VARCHAR2(1) NOT NULL,
    descalter                 VARCHAR2(30) NOT NULL,
    valorlogico               CHAR(1) NOT NULL,
    valorporc                 INTEGER NOT NULL,
    preguntas_testeva_idtest  INTEGER NOT NULL,
    preguntas_idtest          INTEGER NOT NULL,
    preguntas_numpre          INTEGER NOT NULL
);

ALTER TABLE alternativas
    ADD CONSTRAINT alternativas_pk PRIMARY KEY ( id_test,
                                                 id_preg,
                                                 altern );

CREATE TABLE curso (
    idcurso  INTEGER NOT NULL,
    descrip  VARCHAR2(30) NOT NULL
);

ALTER TABLE curso ADD CONSTRAINT curso_pk PRIMARY KEY ( idcurso );

CREATE TABLE estudiante (
    idestu         INTEGER NOT NULL,
    nombre         VARCHAR2(30) NOT NULL,
    apellido       VARCHAR2(30) NOT NULL,
    fono           INTEGER NOT NULL,
    direcc         VARCHAR2(30) NOT NULL,
    idcurso        INTEGER NOT NULL,
    curso_idcurso  INTEGER NOT NULL
);

ALTER TABLE estudiante ADD CONSTRAINT estudiante_pk PRIMARY KEY ( idestu );

CREATE TABLE preguntas (
    idtest          INTEGER NOT NULL,
    numpre          INTEGER NOT NULL,
    enunciado       VARCHAR2(30) NOT NULL,
    puntaje         INTEGER NOT NULL,
    testeva_idtest  INTEGER NOT NULL
);

ALTER TABLE preguntas
    ADD CONSTRAINT preguntas_pk PRIMARY KEY ( testeva_idtest,
                                              idtest,
                                              numpre );

CREATE TABLE respuestas (
    idalumno              INTEGER NOT NULL,
    idtest                INTEGER NOT NULL,
    idpreg                INTEGER NOT NULL,
    alternativa           VARCHAR2(1) NOT NULL,
    resp                  CHAR(1) NOT NULL,
    puntaje               INTEGER NOT NULL,
    estudiante_idestu     INTEGER NOT NULL,
    alternativas_id_test  INTEGER NOT NULL,
    alternativas_id_preg  INTEGER NOT NULL,
    alternativas_altern   VARCHAR2(1) NOT NULL
);

ALTER TABLE respuestas
    ADD CONSTRAINT respuestas_pk PRIMARY KEY ( estudiante_idestu,
                                               alternativas_id_test,
                                               alternativas_id_preg,
                                               alternativas_altern,
                                               idtest,
                                               idpreg,
                                               alternativa );

CREATE TABLE testeva (
    idtest         INTEGER NOT NULL,
    nombretest     VARCHAR2(30) NOT NULL,
    desctest       VARCHAR2(30) NOT NULL,
    programacurso  VARCHAR2(30) NOT NULL,
    unidadmod      VARCHAR2(30),
    author         VARCHAR2(30) NOT NULL,
    fechacrea      DATE,
    id_curso       INTEGER,
    curso_idcurso  INTEGER NOT NULL
);

ALTER TABLE testeva ADD CONSTRAINT testeva_pk PRIMARY KEY ( idtest );

ALTER TABLE alternativas
    ADD CONSTRAINT alternativas_preguntas_fk FOREIGN KEY ( preguntas_testeva_idtest,
                                                           preguntas_idtest,
                                                           preguntas_numpre )
        REFERENCES preguntas ( testeva_idtest,
                               idtest,
                               numpre );

ALTER TABLE estudiante
    ADD CONSTRAINT estudiante_curso_fk FOREIGN KEY ( curso_idcurso )
        REFERENCES curso ( idcurso )
            ON DELETE CASCADE;

ALTER TABLE preguntas
    ADD CONSTRAINT preguntas_testeva_fk FOREIGN KEY ( testeva_idtest )
        REFERENCES testeva ( idtest )
            ON DELETE CASCADE;

ALTER TABLE respuestas
    ADD CONSTRAINT respuestas_alternativas_fk FOREIGN KEY ( alternativas_id_test,
                                                            alternativas_id_preg,
                                                            alternativas_altern )
        REFERENCES alternativas ( id_test,
                                  id_preg,
                                  altern )
            ON DELETE CASCADE;

ALTER TABLE respuestas
    ADD CONSTRAINT respuestas_estudiante_fk FOREIGN KEY ( estudiante_idestu )
        REFERENCES estudiante ( idestu )
            ON DELETE CASCADE;

ALTER TABLE testeva
    ADD CONSTRAINT testeva_curso_fk FOREIGN KEY ( curso_idcurso )
        REFERENCES curso ( idcurso )
            ON DELETE CASCADE;



-- Informe de Resumen de Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             6
-- CREATE INDEX                             0
-- ALTER TABLE                             12
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
