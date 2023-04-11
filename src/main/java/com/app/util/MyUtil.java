package com.app.util;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;


public class MyUtil {

	//@Autowired private IEmployeeService employeeService;

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
		
		
		 
		
}
