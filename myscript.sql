DROP TABLE IF EXISTS purchaseOrders;
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS vendorInvCapture;
DROP TABLE IF EXISTS userAccess;
DROP TABLE IF EXISTS vendors;

CREATE TABLE userAccess (
	id VARCHAR(15) NOT NULL,
	pw VARCHAR(16) NOT NULL,
	access VARCHAR(50) NOT NULL,
	PRIMARY KEY (id)
);

INSERT INTO userAccess (id, pw, access) VALUES ("tgonzales", "servlet143", "superuser");
INSERT INTO userAccess (id, pw, access) VALUES ("arlyn", "queen143", "purchasing");
INSERT INTO userAccess (id, pw, access) VALUES ("seven", "eleven143", "accountspayable");
INSERT INTO userAccess (id, pw, access) VALUES ("bowwi", "youngprince143", "vendorinvcapture");

CREATE TABLE vendors (
	vendorId INTEGER(5) NOT NULL,
	subsidiary VARCHAR(50) NOT NULL,
	vendorName VARCHAR(50) NOT NULL,
	vendorAddress VARCHAR(50) NOT NULL,
	taxidssn VARCHAR(10) NOT NULL,
	paymentType VARCHAR(25) NOT NULL,
	currency VARCHAR(5) NOT NULL,
	terms VARCHAR(25) NOT NULL,
	taxable VARCHAR(3) NOT NULL,
	PRIMARY KEY(vendorid)
);

CREATE TABLE payments (
	vendorId INTEGER(5) NOT NULL,
	paymentReference INTEGER(10) NOT NULL,
	paymentStatus VARCHAR(25) NOT NULL,
	beneficiary VARCHAR(50) NOT NULL,
	bankName VARCHAR(50) NOT NULL,
	accountNumber INTEGER NOT NULL,
	iban VARCHAR(50) NOT NULL,
	accountType VARCHAR(25) NOT NULL,
	swiftCode VARCHAR(50) NOT NULL,
	bankAddressNumber INTEGER NOT NULL,
	remittanceAdd VARCHAR(50) NOT NULL,
	PRIMARY KEY(paymentReference),
	FOREIGN KEY(vendorId)REFERENCES vendors(vendorId)
);

CREATE TABLE purchaseorders (
	vendorId INTEGER(5) NOT NULL,
	poNumber INTEGER(8),
	invoiceNumber VARCHAR(25) NOT NULL,
	account VARCHAR(50) NOT NULL,
	requestor VARCHAR(50) NOT NULL,
	department VARCHAR(50) NOT NULL,
	location VARCHAR(50) NOT NULL,
	poAmount INTEGER NOT NULL,
	billTo VARCHAR(50) NOT NULL,
	shipTo VARCHAR(50) NOT NULL,
	PRIMARY KEY(poNumber),
	FOREIGN KEY(vendorId)REFERENCES vendors(vendorId)
	-- FOREIGN KEY(invoiceNumber)REFERENCES vendorInvCapture(invoiceNumber)
);

CREATE TABLE vendorInvCapture (
	invoiceNumber VARCHAR(25) NOT NULL,
	poNumber INTEGER(8) NOT NULL,
	vendorId INTEGER(5) 
	NOT NULL,
	invoiceDate VARCHAR(25) NOT NULL,
	description VARCHAR(25) NOT NULL,
	currency VARCHAR(5) NOT NULL,
	invAmount INTEGER NOT NULL,
	tax INTEGER NOT NULL,
	invAmtDue INTEGER NOT NULL,
	dueDate VARCHAR(25) NOT NULL,
	terms VARCHAR(25) NOT NULL,
	billTo VARCHAR(50) NOT NULL,
	shipTo VARCHAR(50) NOT NULL,
	paymentStatus VARCHAR(25) NOT NULL,
	paymentReference INTEGER(10) NOT NULL,
	paymentType VARCHAR(25) NOT NULL,
	paymentDate VARCHAR(25) NOT NULL,
	amountPaid INTEGER NOT NULL,
	PRIMARY KEY(invoiceNumber),
	FOREIGN KEY(poNumber) REFERENCES purchaseorders(poNumber),
	FOREIGN KEY(vendorId) REFERENCES vendors(vendorId),
	FOREIGN KEY(paymentReference) REFERENCES payments(paymentReference)
);
