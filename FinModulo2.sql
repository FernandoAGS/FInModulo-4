DROP TABLE facturas CASCADE CONSTRAINTS;
----------------------------------------
CREATE TABLE facturas (
    facturas_id     INTEGER NOT NULL,
    factura_estado  VARCHAR2(20) NOT NULL,
    cliente_id      INTEGER NOT NULL
);

ALTER TABLE facturas ADD CONSTRAINT facturas_pk PRIMARY KEY ( facturas_id );
-----------------------------
ALTER TABLE facturas
    ADD CONSTRAINT facturas_cliente_fk FOREIGN KEY ( cliente_id )
        REFERENCES cliente ( cliente_id );
-----------------------
CREATE SEQUENCE facturas_facturas_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER facturas_facturas_id_trg BEFORE
    INSERT ON facturas
    FOR EACH ROW
    WHEN ( new.facturas_id IS NULL )
BEGIN
    :new.facturas_id := facturas_facturas_id_seq.nextval;
END;
/


