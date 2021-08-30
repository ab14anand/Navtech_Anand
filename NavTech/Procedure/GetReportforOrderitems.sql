
/*Stored Procedure for order list report*/

CREATE PROCEDURE GetReportforOrderitems @FromDate DATE,
										@ToDate   DATE

AS

BEGIN
	SELECT B.ProductName,
		   A.Price,
		   OrderedQuantity,
		   Attribute,
		   OrderDate,
		   C.AttributeValue
	FROM OrderDetails A WITH(NOLOCK)
	JOIN ProductMaster B WITH(NOLOCK)
	ON   A.ProductId=B.ProductId
	JOIN ProductAttributeMapping C WITH(NOLOCK)
	ON   C.ProductId=A.ProductId
	JOIN AttributeMaster D WITH(NOLOCK)
	ON   D.AtttributeId=C.AtttributeId


END