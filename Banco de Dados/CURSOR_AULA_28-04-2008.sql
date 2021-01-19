USE MASTER
GO
CREATE DATABASE TUTORIAL_CURSOR
GO
USE TUTORIAL_CURSOR
GO
CREATE TABLE VEICULOS(
IDVEICULO INT IDENTITY(1,1) PRIMARY KEY NOT NULL, 
VEICULO VARCHAR(30) NOT NULL,
KILOMETRAGEM INT NOT NULL
)
GO

INSERT INTO VEICULOS(VEICULO, KILOMETRAGEM) VALUES ('CARRO1', 5230)
GO
INSERT INTO VEICULOS(VEICULO, KILOMETRAGEM) VALUES ('CARRO2', 7800)
GO
INSERT INTO VEICULOS(VEICULO, KILOMETRAGEM) VALUES ('CARRO3', 16540)
GO
INSERT INTO VEICULOS(VEICULO, KILOMETRAGEM) VALUES ('CARRO4', 32230)
GO


CREATE PROCEDURE TUTORIAL_CURSOR_SOMAKILOMETRAGEM
AS
BEGIN
-- DEFINIÇÃO VARIÁVEIS UTILIZADAS NA PROCEDURE
DECLARE @FLAG INT;
DECLARE @KILOMETROS INT;
DECLARE @TOTAL_DE_KILOMETROS INT;
SET @TOTAL_DE_KILOMETROS = 0;
SET @KILOMETROS = 0;

-- DEFINIÇÕES DO CURSOR
DECLARE MEU_CURSOR CURSOR FOR SELECT KILOMETRAGEM FROM VEICULOS;
OPEN MEU_CURSOR
 SET @FLAG = 1
		WHILE(@FLAG = 1)
			BEGIN
				SET @FLAG = 0
				FETCH NEXT FROM MEU_CURSOR INTO @KILOMETROS
				IF(@@FETCH_STATUS = 0)
					BEGIN
						SET @FLAG = 1
						SET @TOTAL_DE_KILOMETROS = @TOTAL_DE_KILOMETROS + @KILOMETROS
					END
			END
		CLOSE MEU_CURSOR
		DEALLOCATE MEU_CURSOR
		PRINT @TOTAL_DE_KILOMETROS
 
end
GO


EXEC TUTORIAL_CURSOR_SOMAKILOMETRAGEM