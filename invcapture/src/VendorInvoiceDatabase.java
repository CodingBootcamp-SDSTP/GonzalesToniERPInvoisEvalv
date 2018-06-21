import java.util.ArrayList;
import java.io.FileReader;
import java.io.BufferedReader;
import java.io.FileWriter;
import java.io.BufferedWriter;
import java.util.HashMap;
import java.sql.*;

public class VendorInvoiceDatabase
{
	private VendorCollection vendors;

	public VendorInvoiceDatabase() {
		vendors = new VendorCollection();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn =
			DriverManager.getConnection("jdbc:mysql://localhost/invoicedb?user=servlet&password=serlet123&setConnectionerTimezone=UTC&useSSL=false");
			if(conn != null) {
				System.out.println("Not a null..");
			}
			else {
				System.out.println("Null");
			}
			readFromDB(conn);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

	public VendorCollection getVendorCollection() {
		return(vendors);
	}

	public Vendor getVendorById(String id) {
		return(vendors.getVendorByIndex(id));
	}

	public ArrayList<Object> search(String s) {
		ArrayList<Object> ao = new ArrayList<Object>();
		ArrayList<Vendor> vs = vendors.search(s);
		ao.addAll(vs);
		return(ao);
	}

public boolean readFromDB(Connection conn) {
	Statement stmt = null;
	Result rs = null;
	try {
		stmt = conn.createStatement();
		rs = stmt.executeQuery("SELECT * FROM vendors;");
		while(rs.next()) {
			String[] str = {
				rs.getString("VENDORID"),
				rs.getString("subsidiary"),
				rs.getString("vendorName"),
				rs.getString("vendorAddress"),
				rs.getString("taxidssn"),
				rs.getString("paymentType"),
				rs.getString("currency"),
				rs.getString("terms"),
				rs.getString("taxable"),
			};
			System.out.println(rs.getString("VENDORID"));
			createObject(str);
		}
	}
	catch(Exception e) {
		e.printStackTrace();
	}
	finally {
		try { if(stmt!=null) {stmt=null;}} catch(Exception e) {};
		try { if(rs!=null) {rs=null;}} catch(Exception e) {};
	}
	return(true);
}

	public boolean readFromFile(String filename) {
		boolean f = false;
		try {
			FileReader file = new FileReader(filename);
			BufferedReader fbr = new BufferedReader(file);
			String fileLine;
			while((fileLine = fbr.readLine()) != null) {
				createObject(fileLine);
			}
			f = true;
			fbr.close();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return(f);
	}

	public void createObject(String... details) {
		int len = details.length - 1;
		String d = details[len].toLowerCase();
		if("vendors".equals(d)) {
			Vendor v = new Vendor(Integer.parseInt(details[0]), details[1], details[2], details[3], details[4], details[5], details[6], details[7], details[8]);
			persons.addVendor(v);
		}
	}

	public boolean writeToFile(String filename) {
		boolean f = false;
		try {
			FileWriter fWriter = new FileWriter(filename);
			BufferedWriter fbw = new BufferedWriter(fWriter);
			fbw.write(getCollectionContent());
			fbw.close();
			f = true;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return(f);
	}

	public String getCollectionContent() {
		ArrayList<Vendor> v = vendors.getAllVendors();
		StringBuffer sb = new StringBuffer("");
		for(int i=0; i<v.size(); i++) {
			Vendor vendors = v.get(i);
			sb.append(vendor.getDetails() + "\n");
		}
		return(sb.toString());
	}
}
