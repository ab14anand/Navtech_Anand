CREATE PROCEDURE BulkInsert @InputPara VARCHAR(MAX)

AS

BEGIN

DECLARE @TEMP TABLE(Productid varchar(20),
					ProductName varchar(50),
					PDescription varchar(200),
					UOM   int,
					Price decimal(38,3))



INSERT INTO @TEMP
SELECT * FROM OpenJson(@InputPara)
WITH (ProductId VARCHAR(20) '$.ProductId',
ProductName VARCHAR(50) '$.ProductName',
PDescription VARCHAR(200) '$.PDescription',
UOM INT '$.UOM',
Price DECIMAL(38,3) '$.Price'

INSERT INTO ProductMaster
SELECT * FROM @TEMP
WHERE Productid NOT IN(SELECT Productid FROM ProductMaster)



UPDATE ProductMaster A SET A.Price=B.Price
JOIN  @TEMP B  ON A.Productid=B.ProductId

END