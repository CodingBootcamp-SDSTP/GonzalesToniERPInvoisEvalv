DROP TABLE IF EXISTS vendorInvCapture;
DROP TABLE IF EXISTS payments;
DROP TABLE IF EXISTS purchaseOrders;
DROP TABLE IF EXISTS vendors;
DROP TABLE IF EXISTS userAccess;

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

INSERT INTO vendors (vendorId, subsidiary, vendorName, vendorAddress, taxidssn, paymentType, currency, terms, taxable) VALUES (10001, "us", "Atlassians", "San San Francisco, CA 94103", "20-3345959", "ach", "usd", "N30", "Yes");
INSERT INTO vendors (vendorId, subsidiary, vendorName, vendorAddress, taxidssn, paymentType, currency, terms, taxable) VALUES (10002, "us", "Deltek Inc.", "509 Olive Way Seattle, WA 98101", "20-3365454", "ach", "usd", "N15", "Yes");
INSERT INTO vendors (vendorId, subsidiary, vendorName, vendorAddress, taxidssn, paymentType, currency, terms, taxable) VALUES (10003, "us", "Dell Inc.", "Round Rock, Texas‎, USA", "20-3376464", "wire", "usd", "N45", "Yes");

CREATE TABLE payments (
	vendorId INTEGER(5) NOT NULL,
	paymentReference INTEGER(10) NOT NULL,
	paymentStatus VARCHAR(25) NOT NULL,
	beneficiary VARCHAR(50) NOT NULL,
	bankName VARCHAR(50) NOT NULL,
	accountNumber INTEGER NOT NULL,
	accountType VARCHAR(25) NOT NULL,
	swiftCode VARCHAR(50) NOT NULL,
	bankAddressNumber INTEGER NOT NULL,
	remittanceAdd VARCHAR(50) NOT NULL,
	PRIMARY KEY(paymentReference),
	FOREIGN KEY(vendorId) REFERENCES vendors(vendorId)
);

INSERT INTO payments (vendorId, paymentReference, paymentStatus, beneficiary, bankName, accountNumber, accountType, swiftCode, bankAddressNumber, remittanceAdd) VALUES (10001, 10000001, "paid", "Atlassians", "bank of america", 261232, "savings acct", "BOFAUS3N", 26123289, "North Carolina 28255");
INSERT INTO payments (vendorId, paymentReference, paymentStatus, beneficiary, bankName, accountNumber, accountType, swiftCode, bankAddressNumber, remittanceAdd) VALUES (10001, 10000002, "paid", "Atlassians", "bank of america", 261232, "savings acct", "BOFAUS3N", 26123289, "North Carolina 28255");
INSERT INTO payments (vendorId, paymentReference, paymentStatus, beneficiary, bankName, accountNumber, accountType, swiftCode, bankAddressNumber, remittanceAdd) VALUES (10002, 10000003, "paid", "Deltek Inc.", "bank of america", 265262, "savings acct", "BOFAUS3N", 26526288, "Ny 10038, United States Of America");
INSERT INTO payments (vendorId, paymentReference, paymentStatus, beneficiary, bankName, accountNumber, accountType, swiftCode, bankAddressNumber, remittanceAdd) VALUES (10003, 10000004, "paid", "Dell Inc.", "bank of america", 267563, "savings acct", "BOFAUS3N", 26526288, "Ny 10038, United States Of America");
INSERT INTO payments (vendorId, paymentReference, paymentStatus, beneficiary, bankName, accountNumber, accountType, swiftCode, bankAddressNumber, remittanceAdd) VALUES (10003, 10000005, "unpaid", "Dell Inc.", "bank of america", 267563, "savings acct", "BOFAUS3N", 26526288, "Ny 10038, United States Of America");

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
	FOREIGN KEY(vendorId) REFERENCES vendors(vendorId)
	-- FOREIGN KEY(invoiceNumber)REFERENCES vendorInvCapture(invoiceNumber)
);

CREATE TABLE vendorInvCapture (
	invoiceNumber VARCHAR(25) NOT NULL,
	poNumber INTEGER(8),
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
