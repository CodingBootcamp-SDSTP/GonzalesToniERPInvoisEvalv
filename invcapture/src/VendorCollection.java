import java.util.ArrayList;

class VendorCollection
{
	ArrayList<Vendor> vendors;

	public VendorCollection() {
		vendors = new ArrayList<Vendor>();
	}

	public void addVendor(Vendor vendor) {
		vendors.add(vendor);
	}

	public void removeVendor(Vendor vendor) {
		vendors.remove(vendor);
	}

	public ArrayList<Vendors> getAllVendors() {
		return(vendors);
	}

	public Vendor getVendorByIndex(int n) {
		return(vendors.get(n));
	}
}
