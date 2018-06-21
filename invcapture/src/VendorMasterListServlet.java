import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.ArrayList;

public class VendorMasterListServlet extends HttpServlet
{
	VendorCollection vendors;

	public void init() throws ServletException {
			// VendorInvoiceDatabase vid = new VendorInvoiceDatabase();
			// vendors = vid.getVendorCollection();
	}

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/xml");
		PrintWriter out = res.getWriter();
		out.println(exportToXML());
	}

	public String exportToXML() {
		StringBuilder sb = new StringBuilder("<vendors>");
		ArrayList<Vendor> merchants = vendors.getAllVendors();
		for(Vendor v : merchants) {
			sb.append("<vendor>");
				sb.append("<VENDORID>" + v.getVENDORID() + "</VENDORID>");
				sb.append("<subsidiary>" + v.getSubsidiary() + "</subsidiary>");sb.append("<vendorName>" + v.geVendorName() + "</vendorName>");sb.append("<vendorAddress>" + v.getVendorAddress() + "</vendorAddress>"); sb.append("<taxidssn>" + v.getTaxidssn() + "</taxidssn>");
				sb.append("<paymentType>" + v.getPaymentType() + "</paymentType>");
				sb.append("<currency>" + v.getCurrency() + "</currency>");
				sb.append("<terms>" + v.getTerms() + "</terms>");
				sb.append("<taxable>" + v.getTaxable() + "</taxable>");
			sb.append("</vendor>");
		}
		sb.append("</vendors>");
		return(sb.toString());
	}

	public void destroy() {
		vendors = null;
	}
}