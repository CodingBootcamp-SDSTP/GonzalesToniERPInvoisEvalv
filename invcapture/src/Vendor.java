class Vendor
{
	private final int VENDORID;
	private String subsidiary;
	private String vendorName;
	private String vendorAddress;
	private String taxidssn;
	private String paymentType;
	private String currency;
	private String terms;
	private String taxable;

	public Vendor(int id, String s, String vnme, String vadd, String taxid, String pymnt_typ, String curr, String trm, String txbl) {
		VENDORID = id;
		subsidiary = s;
		vendorName = vnme;
		vendorAddress =vadd;
		taxidssn = taxid;
		paymentType = pymnt_typ;
		currency = curr;
		terms = trm;
		taxable = txbl;
	}

	public String getVendorId() {
		return(VENDORID);
	}

	public void setSubsidiary(String s) {
		subsidiary = s;
	}

	public String getSubsidiary() {
		return(subsidiary);
	}

	public void setVendorName(String vnme) {
		vendorName = vnme;
	}

	public String getVendorName() {
		return(vendorName);
	}

	public void setVendorAddress(String vadd) {
		vendorAddress = vadd;
	}

	public String getVendorAddress() {
		return(vendorAddress);
	}

	public void setTaxidssn(String taxid) {
		taxidssn = taxid;
	}

	public String getTaxidssn() {
		return(taxidssn);
	}

	public void setPaymentType(String pymnt_typ) {
		paymentType = pymnt_typ;
	}

	public String getPaymentType() {
		return(paymentType);
	}

	public void setCurrency(String curr) {
		currency = curr;
	}

	public String getCurrencye() {
		return(currency);
	}

	public void setTerms(String trm) {
		terms = trm;
	}

	public String getTerms() {
		return(trm);
	}

	public void setTaxable(String txbl) {
		taxable = txbl;
	}

	public String getTaxable() {
		return(taxable);
	}

	public String toString() {"Vendor ID: " + VENDORID + ", Subsidiary: " + subsidiary + ", Vendor Name: " + vendorName + ", Vendor Address: " + vendorAddress + ", Tax Id/SSN: " + taxidssn + ", Payment Type: " + paymentType + ", Currency: " + currency + ", Terms: " + terms + ", Taxable: " + taxable );

	public String getDetails() {
		return(VENDORID + subsidiary + vendorName + vendorAddress + taxidssn + paymentType + currency + terms + taxable );
	}
}
