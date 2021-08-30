/*Table Schema*/


CREATE TABLE ProductMaster(ProductId		VARCHAR(20) Primary Key,
						   ProductName		VARCHAR(50),
						   PDescription	    VARCHAR(200),
						   UOM				INT,
						   Price			DECIMAL(38,3),
						   UpdatedBy		VARCHAR(20),
						   UpdatedOn        DATETIME)




CREATE TABLE ProductMasterHistory(ProductHistoryId  VARCHAR(36) Primary Key,
								  ProductId			VARCHAR(20),
								  ProductName		VARCHAR(50),
								  PDescription	    VARCHAR(200),
								  UOM				INT,
								  Price				DECIMAL(38,3),
								  UpdatedBy			VARCHAR(20),
								  UpdatedOn		    DATETIME)


CREATE TABLE CustomerDetails(CustomerId		VARCHAR(20) Primary KEY,
							 CustomerName	VARCHAR(50),
							 PhoneNo		INT,
							 Email			VARCHAR(30), 
							 UpdatedBy	    VARCHAR(20),
							 UpdatedOn      DATETIME)



CREATE TABLE OrderDetails (OrderId					VARCHAR(36),
						   CustomerId				VARCHAR(20),
						   ProductId				VARCHAR(20),
						   OrderedQuantity			INT,
						   Price					DECIMAL(38,3),
						   ProductAttributeMapId	VARCHAR(36),
						   OrderDate				DATETIME,
						   UpdatedOn				DATETIME,
						   PRIMARY KEY (OrderID),
						   FOREIGN KEY (CustomerId) REFERENCES CustomerDetails(CustomerId),
						   FOREIGN KEY (ProductId) REFERENCES ProductMaster(ProductId),
						   FOREIGN KEY (ProductAttributeMapId) REFERENCES ProductAttributeMapping(ProductAttributeMapId))


CREATE TABLE ProductAttributeMapping(ProductAttributeMapId		VARCHAR(36) ,
									 ProductId		            VARCHAR(20) ,
									 AtttributeId				VARCHAR(36) ,
									 AttributeValue	            VARCHAR(30),
									 PRIMARY KEY (ProductAttributeMapId),
									 FOREIGN KEY (ProductId) REFERENCES ProductMaster(ProductId),
									 FOREIGN KEY (AtttributeId) REFERENCES AttributeMaster(AtttributeId))

