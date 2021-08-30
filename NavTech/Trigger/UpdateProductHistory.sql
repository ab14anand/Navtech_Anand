/* TRIGGER TO UPDATE THE PRODUCTHISTORYTABLE*/


CREATE TRIGGER [dbo].[UpdateProductHistory]
ON  [dbo].[ProductMaster] AFTER UPDATE
AS


BEGIN

INSERT INTO ABDR.dbo.ProductMasterHistory
SELECT NEWID(),* FROM inserted I;

END