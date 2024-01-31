package com.app.util;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.app.controller.HomeRestController;
import com.app.empapplyforms.EmpGPFAdvanceApplyForm;
import com.app.entity.Employee;
import com.app.entity.Employee_Family;
import com.app.model.EmployeeCompleteDetailsModel;
import com.app.repo.EmpGPFAdvanceApplyFormRepo;
import com.app.repo.EmployeeRepo;
import com.app.repo.Employee_Family_Repo;
import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;
import com.itextpdf.layout.element.Text;

@Component
public class MyUtil {

	@Autowired private EmployeeRepo employeeRepo;
	@Autowired private Employee_Family_Repo employee_Family_Repo;
	
	public String getFamilyMemberName(Integer id) {
		System.out.println("getFamilyMemberName=>id=>"+id);
		String familyMemberName = null;
		Employee_Family employee_Family = employee_Family_Repo.findById(id).get();
		familyMemberName = employee_Family.getPer_name();
		return familyMemberName;
	}
	
	public String getEmpName(String empCode) {
		System.out.println("empCode=>"+empCode);
		String empName = null;
		Employee emps = employeeRepo.findById(empCode).get();
		empName = emps.getName();
		return empName;
	}
	
	public static int hit_counter() throws SQLException {
		int hit = 0;
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		String sql = "";

		try {
			con = DBConnection.getConn();
			sql = "select nextval('public.hit_counter')";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if (rs.next()) {
				hit = rs.getInt(1);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (con != null) {
				con.close();
			}
		}

		return hit;

	}

	public static String putOptions(String tab, String code, String name) throws SQLException {
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement psmt = null;
		//String regex = "[A-Za-z]{35,}";
		//String pattern = "\\d{1,10}";
		String check_table = "^([a-z_]){1,25}+$";

		try {
			if (tab == null || code == null || name == null) {
				return null;
			}
			if (conn == null) {
				conn = DBConnection.getConn();
			}
			if (code.matches(check_table) && name.matches(check_table) && tab.matches(check_table)) {
				psmt = conn.prepareStatement(
						"select distinct " + code + "," + name + " from " + tab + " order by " + code);
			}
			rs = psmt.executeQuery();
			String val = "<option value='' selected>--select--</option>";
			for (; rs.next(); val = val + "<option value='" + rs.getString(1) + "' >" + rs.getString(2) + "</option>")
				;
			return val;
		} catch (Exception exception) {
			if (rs != null) {
				rs.close();
				rs = null;
			}
			if (psmt != null) {
				psmt.close();
				psmt = null;
			}
		} finally {
			if (rs != null) {
				rs.close();
				rs = null;
			}
			if (psmt != null) {
				psmt.close();
				psmt = null;
			}

		}
		return null;
	}

	public static String getOptionValue(String tab, String code, String name, String val) throws SQLException {
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement psmt = null;
		try {
			if (conn == null) {
				conn = DBConnection.getConn();
			}
			if (tab == null || code == null || name == null || val == null) {
				return null;
			}
			String qry = "select " + name + " from " + tab + " where " + code + " = ? ";
			psmt = conn.prepareStatement(qry);
			if (val.matches("[0-9]+")) {
				qry = "select " + name + " from " + tab + " where " + code + "::integer = ? ";
				psmt = conn.prepareStatement(qry);
				psmt.setInt(1, Integer.parseInt(val));
			} else {
				psmt.setString(1, val);
			}
			rs = psmt.executeQuery();
			String returnval = "";
			if (rs.next()) {
				returnval = rs.getString(1);
			}
			if (code.equals("trno")) {
				returnval = returnval.substring(0, 10);
			}
			return returnval;
		} catch (Exception exception) {
			return null;
		} finally {
			try {
				if (rs != null) {
					rs.close();
					rs = null;
				}
				if (psmt != null) {
					psmt.close();
					psmt = null;
				}
				if (conn != null) {
					// DbUtils.closeQuietly(conn);
					conn.close();
				}
			} catch (Exception ex) {
			}

		}
	}

	private static final String[] tensNames = { "", " Ten", " Twenty", " Thirty", " Forty", " Fifty", " Sixty",
			" Seventy", " Eighty", " Ninety" };

	private static final String[] numNames = { "", " One", " Two", " Three", " Four", " Five", " Six", " Seven",
			" Eight", " Nine", " Ten", " Eleven", " Twelve", " Thirteen", " Fourteen", " Fifteen", " Sixteen",
			" Seventeen", " Eighteen", " Nineteen" };

	private static String convertLessThanOneThousand(int number) {
		String soFar;

		if (number % 100 < 20) {
			soFar = numNames[number % 100];
			number /= 100;
		} else {
			soFar = numNames[number % 10];
			number /= 10;

			soFar = tensNames[number % 10] + soFar;
			number /= 10;
		}
		if (number == 0)
			return soFar;
		return numNames[number] + " Hundred" + soFar;
	}

	public static String convert(long number) {
		// 0 to 999 999 999 999
		if (number == 0) {
			return "zero";
		}

		String snumber = Long.toString(number);

		// pad with "0"
		String mask = "000000000000";
		DecimalFormat df = new DecimalFormat(mask);
		snumber = df.format(number);

		// XXXnnnnnnnnn
		int billions = Integer.parseInt(snumber.substring(0, 3));
		// nnnXXXnnnnnn
		int millions = Integer.parseInt(snumber.substring(3, 6));
		// nnnnnnXXXnnn
		int hundredThousands = Integer.parseInt(snumber.substring(6, 9));
		// nnnnnnnnnXXX
		int thousands = Integer.parseInt(snumber.substring(9, 12));

		String tradBillions;
		switch (billions) {
		case 0:
			tradBillions = "";
			break;
		case 1:
			tradBillions = convertLessThanOneThousand(billions) + " billion ";
			break;
		default:
			tradBillions = convertLessThanOneThousand(billions) + " billion ";
		}
		String result = tradBillions;

		String tradMillions;
		switch (millions) {
		case 0:
			tradMillions = "";
			break;
		case 1:
			tradMillions = convertLessThanOneThousand(millions) + " million ";
			break;
		default:
			tradMillions = convertLessThanOneThousand(millions) + " million ";
		}
		result = result + tradMillions;

		String tradHundredThousands;
		switch (hundredThousands) {
		case 0:
			tradHundredThousands = "";
			break;
		case 1:
			tradHundredThousands = "One Thousand ";
			break;
		default:
			tradHundredThousands = convertLessThanOneThousand(hundredThousands) + " Thousand ";
		}
		result = result + tradHundredThousands;

		String tradThousand;
		tradThousand = convertLessThanOneThousand(thousands);
		result = result + tradThousand;

		// remove extra spaces!
		return result.replaceAll("^\\s+", "").replaceAll("\\b\\s{2,}\\b", " ");
	}
	
	 //filter bad
	   public  static String filterBad(String str)
	    {
	           str=str==null?"":str;
	           str=str.replaceAll("delete","");
	           str=str.replaceAll("select","");
	           str=str.replaceAll("update","");
	           str=str.replaceAll("drop","");
	           str=str.replaceAll("alter","");
	           str=str.replaceAll("insert","");
	           str=str.replaceAll("create","");
	           str=str.replaceAll("grant","");
	           str=str.replaceAll("revoke","");
	           str=str.replaceAll("truncate","");
	           str=str.replaceAll("alert","");
	           str=str.replaceAll("script","");
	           str=str.replaceAll("'","");
	           str=str.replaceAll("\"","");
	           str=str.replaceAll(">","");
	           str=str.replaceAll("<","");
	           str=str.replaceAll("&","");
	           str=str.replaceAll("%","");
	           str=str.replaceAll("limit","");
	           str=str.replaceAll(";","");
	           //str=str.replaceAll("","");
	           str=str.replaceAll("=","");
            return str;
	       }
		public static Date addDays(Date date, int days) {
			GregorianCalendar cal = new GregorianCalendar();
			cal.setTime(date);
			cal.add(Calendar.DATE, days);
					
			return cal.getTime();
		}
		
		public static String getAddressValue(String tab, String code, String name, String val) throws SQLException {
			Connection conn=null;
	        ResultSet rs=null;
	        PreparedStatement psmt=null;
			try {
	            if (conn == null) {
	                conn =  DBConnection.getConn();
	             }
	            if (tab == null || code == null || name == null || val == null) {
	                return null;
	            } 
	            String qry = "select "+name+" from "+tab+" where "+code+"=?";
	            psmt = conn.prepareStatement(qry);
	            psmt.setString(1, MyUtil.filterBad(val));
	            rs = psmt.executeQuery();
	            String returnval = "";
	            if (rs.next()) {
	                returnval = rs.getString(1);
	            }else{
	            	returnval="NA";
	            }
	            if (code.equals("trno")) {
	                returnval = returnval.substring(0, 10);
	            }
	            return returnval;
	        } catch (Exception exception) {
	            return null;
	        }
	        finally {
	            try {
	                if (rs != null) {
	                    rs.close();
	                    rs=null;
	                }
	                if (psmt != null) {
	                    psmt.close();
	                    psmt=null;
	                }
	                if (conn != null) {
	   	}
	            } catch (Exception ex) {
	            }

	        }
	    }

		
		//===============getting one field on 27-12-17

		public static String GetFieldName(String tablename,String fieldname,String where_condition) {
			System.out.println("getfieldnamefunction----->executing");
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			Connection con = null;
			String status ="NA";
			try{
			con = DBConnection.getConn();
			pstmt = con.prepareStatement("SELECT  "+fieldname+" as fieldname  FROM "+tablename+"  where "+where_condition);
			System.out.println("query is--"+pstmt);
			rs = pstmt.executeQuery();	
		   	if (rs.next()) {
		   		
		   		status=rs.getString("fieldname");
		   		if(status==null){
		   			status="NA";	
		   		}
			
			}
			}catch (Exception e) {
				
					} finally {
				try {
					if (rs != null)
						rs.close();
					if (pstmt != null)
						pstmt.close();
					 

				} catch (Exception e) {

				}
			}
			System.out.println("status"+status);
			return status;
			
		}
		
		public static String removeLastChar(String s,int lenght) {
		    return (s == null || s.length() == 0)
		      ? null
		      : (s.substring(0, s.length() - 1));
		}
		
		public static String ChDate(String s1) {
	        String day, month, year, date;
	        year = s1.substring(0, 4);
	        month = s1.substring(5, 7);
	        day = s1.substring(8, 10);
	        date = day + '-' + month + '-' + year;
	        return date;
	    }
		
		//Calculating age based on dob
		public static int calculateAge(LocalDate dob) {
			// creating an instance of the LocalDate class and invoking the now() method
			// now() method obtains the current date from the system clock in the default
			// time zone
			LocalDate curDate = LocalDate.now();
			// calculates the amount of time between two dates and returns the years
			if ((dob != null) && (curDate != null)) {
				return Period.between(dob, curDate).getYears();
			} else {
				return 0;
			}
		}
		
		public static List<String> generateFinancialYears() {
	        List<String> years = new ArrayList<>();
	        Calendar now = Calendar.getInstance();
	        int currentYear = now.get(Calendar.YEAR);
	        for (int i = currentYear; i >= currentYear - 15; i--) {
	            String financialYear = i + "-" + (i + 1);
	            years.add(financialYear);
	        }
	        return years;
	    }
		
		public static String dateConvert1(String inputDate ) {
			DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDate date = LocalDate.parse(inputDate , inputFormatter);
			DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
			String outputDate = date.format(outputFormatter);

	        System.out.println("Input Date (yyyy-MM-dd): " + inputDate);
	        System.out.println("Output Date (dd-MM-yyyy): " + outputDate);
	        
	        return outputDate;
		}
		
		
		
		
		
		
		
		@Autowired EmpGPFAdvanceApplyFormRepo empGPFAdvanceApplyFormRepo;
		@Autowired HomeRestController homeRestController;
		
		public final  String hindifont="C:\\Users\\swamy\\Desktop\\APBOCWWB\\Krishna-MxYY.ttf";
		
		
		public void empGPFAdvancePdf(String id) throws IOException {
			
			EmpGPFAdvanceApplyForm bean = empGPFAdvanceApplyFormRepo.findById(Long.valueOf(id)).get();
			EmployeeCompleteDetailsModel emp = homeRestController
					.getEmpDetails(String.valueOf(empGPFAdvanceApplyFormRepo.findById(Long.valueOf(id)).get().getEmpCode()));
			
			String filePath="C:\\Users\\swamy\\Desktop\\APBOCWWB\\hinditext.pdf";
			
			PdfWriter pdfWriter=new PdfWriter(filePath);
			PdfDocument pdfDocument=new PdfDocument(pdfWriter);
			pdfDocument.addNewPage();
			
			Document document=new Document(pdfDocument);
			
			PdfFont hindiFont=PdfFontFactory.createFont(hindifont, true);
			
			//rupaye
			Paragraph rupaye=new Paragraph();   rupaye.add(new Text("#i;s").setFont(hindiFont)).setFontSize(8);
			
			//GOVERNMENT OF INDIA
			Paragraph p=new Paragraph();
			p.add("Hkkjr ljdkj ").setFont(hindiFont);
			p.setTextAlignment(com.itextpdf.layout.property.TextAlignment.CENTER);
			p.setFontSize(12);
			Paragraph p2=new Paragraph();
			p2.add(" / GOVERNMENT OF INDIA");
			p2.setTextAlignment(com.itextpdf.layout.property.TextAlignment.CENTER);
			p2.setFontSize(10);
			Paragraph govtOfIndia=new Paragraph(); govtOfIndia.add(p); govtOfIndia.add(p2); govtOfIndia.setTextAlignment(com.itextpdf.layout.property.TextAlignment.CENTER); 
			document.add(govtOfIndia);
			
			
			//NATIONAL INFORMATICS CENTRE
			Paragraph p3=new Paragraph();
			p3.add("jk\"Vªh; lwpuk foKku dsaæ").setFont(hindiFont);
			p3.setTextAlignment(com.itextpdf.layout.property.TextAlignment.CENTER);
			p3.setFontSize(12);
			Paragraph p4=new Paragraph();
			p4.add(" / NATIONAL INFORMATICS CENTRE");
			p4.setTextAlignment(com.itextpdf.layout.property.TextAlignment.CENTER);
			p4.setFontSize(10);
			Paragraph nic=new Paragraph(); nic.add(p3); nic.add(p4); nic.setTextAlignment(com.itextpdf.layout.property.TextAlignment.CENTER); 
			document.add(nic);
			
			//APPLICATION FOR ADVANCE FROM GPF FUND
			Paragraph afafgf1=new Paragraph();
			afafgf1.add("lkekU; Hkfo\"; fuf/k esa ls vfxze ds fy, vkosnu ").setFont(hindiFont);
			afafgf1.setTextAlignment(com.itextpdf.layout.property.TextAlignment.CENTER);
			afafgf1.setFontSize(12);
			Paragraph afafgf2=new Paragraph();
			afafgf2.add(" / APPLICATION FOR ADVANCE FROM GPF FUND");
			afafgf2.setTextAlignment(com.itextpdf.layout.property.TextAlignment.CENTER);
			afafgf2.setFontSize(10);
			Paragraph afafgf=new Paragraph(); afafgf.add(afafgf1); afafgf.add(afafgf2); afafgf.setTextAlignment(com.itextpdf.layout.property.TextAlignment.CENTER); 
			document.add(afafgf);
			
			
			Paragraph p6=new Paragraph(); p6.add(new Text("1.")).setFontSize(10); p6.add(new Text("uke").setFont(hindiFont)); p6.add(" / Name").setFontSize(8);
			Paragraph p7=new Paragraph(); p7.add(new Text(" : "+emp.getName())).setFontSize(8).setPaddingLeft(200);
			Paragraph p8=new Paragraph(); p8.add(p6); p8.add(p7);
			document.add(p8);
			
			Paragraph designation1=new Paragraph(); designation1.add(new Text("2.")).setFontSize(10); designation1.add(new Text("inuke").setFont(hindiFont)); designation1.add(" / Designation").setFontSize(8);
			Paragraph designation2=new Paragraph(); designation2.add(new Text(" : "+emp.getDesignation())).setFontSize(8).setPaddingLeft(200);
			Paragraph designation=new Paragraph(); designation.add(designation1); designation.add(designation2);
			document.add(designation);
			
			Paragraph accNo1=new Paragraph(); accNo1.add(new Text("3.")).setFontSize(10); accNo1.add(new Text("ysdk lSaD;q").setFont(hindiFont)); accNo1.add(" / Account No.").setFontSize(8);
			Paragraph accNo2=new Paragraph(); accNo2.add(new Text(" : MIT / NIC / GPF / "+bean.getEmpCode()+" (Emp Code)")).setFontSize(8).setPaddingLeft(200);
			Paragraph accNo=new Paragraph(); accNo.add(accNo1); accNo.add(accNo2);
			document.add(accNo);
			
			Paragraph pay1=new Paragraph(); pay1.add(new Text("4.")).setFontSize(10); pay1.add(new Text(" osru").setFont(hindiFont)); pay1.add(" / Pay").setFontSize(8);
			Paragraph pay2=new Paragraph(); pay2.add(new Text(" : "+emp.getBasic_pay())).setFontSize(8).setPaddingLeft(200);
			Paragraph pay=new Paragraph(); pay.add(pay1); pay.add(pay2);
			document.add(pay);
			
			Paragraph five1=new Paragraph(); five1.add(new Text("5.")).setFontSize(10); five1.add(new Text("vkosnu dh rkfjd dks va'knkrk ds [kkrs esa 'kki /kujkf'k fups nh x;h gs %").setFont(hindiFont)); 
			document.add(five1);
			Paragraph five2=new Paragraph(); five2.add(new Text(" Balance at the credit of the subscriber on the date of application as below.")).setFontSize(8).setPaddingLeft(10).setMarginTop(-5);
			document.add(five2);
			
			Paragraph five11h=new Paragraph(); five11h.add(new Text("i.")).setFontSize(20); five11h.add(new Text("o\"kZ ds fooj.k ds vuqlkj vafre 'ks\"k").setFont(hindiFont)).setFontSize(12).setPaddingLeft(20);
			Paragraph five11hv=new Paragraph(); five11hv.add(new Text(": .........................")).setFontSize(10).setPaddingLeft(180);
			Paragraph five11hvc=new Paragraph(); five11hvc.add(five11h); five11hvc.add(five11hv); five11hvc.add(rupaye);
			document.add(five11hvc);
			
			Paragraph five11e1=new Paragraph(); five11e1.add(new Text("Closing balance as per statement for the year "+bean.getFinancialYear())).setFontSize(10).setPaddingLeft(20).setMarginTop(-5); 
			Paragraph five11e2=new Paragraph(); five11e2.add(new Text(": Rs. "+bean.getClosingBalance()+" /-")).setFontSize(10).setPaddingLeft(180).setMarginTop(-50);
			Paragraph five11ec=new Paragraph(); five11ec.add(five11e1); five11ec.add(five11e2);  
			document.add(five11ec);
			
 
			
			
			
			document.close();
			System.out.println("pdf created...");
		}
		
		 
		
}
