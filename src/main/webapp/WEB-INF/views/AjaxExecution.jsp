<%@page import="com.app.util.MyUtil"%>
<%@page import="com.app.util.DBConnection"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="org.apache.commons.lang.StringEscapeUtils"%>
<%@page import="org.owasp.esapi.StringUtilities"%>
<%@page import="org.owasp.esapi.ESAPI"%>
<%@page import="java.sql.*"%>
<%response.setHeader("X-XSS-Protection", "1; mode=block");
response.addHeader("Access-Control-Allow-Methods", "GET, POST");
response.setHeader("Content-Security-Policy", "default-src  http:; script-src 'self' 'unsafe-inline' 'unsafe-eval'  http:; style-src http:  'unsafe-inline'; img-src 'self' data: http:; connect-src http:  ws:;");
response.setHeader("Cache-Control", "no-cache");
response.setHeader("Cache-Control", "no-store");
response.setHeader("Pragma", "no-cache");
response.addHeader("X-Frame-Options", "DENY");
response.setDateHeader("Expires", 0); 
%>
<%
    String table = "";
    Connection con =  DBConnection.getConn();
    PreparedStatement st =null;
    String emp_cd=null;
    String type = request.getParameter("type");
    String role_id=""+session.getAttribute("role_id");
    System.out.println("type---->"+type);
    ResultSet rs = null;
    String sql=null;
    String ts=null;
    ResultSet rs1=null;
    String Msg="";
    String zone_cd="";
    String region_cd="";
    String firm_no="";
    int firmno=0;
    String regex = "^[a-zA-Z]+$";
    String pattern = "\\d{1,10}";
    if(type.matches(regex)){
    if(type.equals("employeedetails")){
    	emp_cd=request.getParameter("param");
    	if(!emp_cd.matches(pattern)){
    	}
    	else if(emp_cd.matches(pattern)){
   sql="select old_area, old_addl,u_det,emp_cd,mob_sms,req_dt,frm_dt,to_dt, app_dt,Role_ID,cir_cd,addl_role ,alloc_dt,Remarks  from FDCA_Powers where emp_cd=?";
    st=con.prepareStatement(sql);
    if(emp_cd.matches(pattern)){
    st.setString(1, StringEscapeUtils.escapeHtml(MyUtil.filterBad(emp_cd)));
    }
    rs=st.executeQuery();
    
  %>
  <% while(rs.next()){
	  %>
	 <font color="blue"><b>(<%=StringEscapeUtils.escapeHtml(rs.getString("old_area"))%>)&nbsp;&nbsp;(<%=StringEscapeUtils.escapeHtml(rs.getString("u_det"))%>)-&nbsp;&nbsp; <%=ESAPI.encoder().encodeForHTML(MyUtil.getAddressValue("fdca_circle", "cir_cd", "cir_nm",rs.getString("cir_cd")))%>
	 </b></font>
	  
 <% 
  }%> 
  <%} }
    else if(type.equals("date")){%>
    	<%String date =request.getParameter("reg_date");
    	 Date date1=new SimpleDateFormat("dd-MM-yyyy").parse(date);
    	 DateFormat dateFormat=new SimpleDateFormat("dd-MM-yyyy");
    	 Calendar c = Calendar.getInstance();
         c.setTime(date1);
         c.add(1, 5);
         String license_validity_date = dateFormat.format(c.getTime());
         Date date4 = new SimpleDateFormat("dd-MM-yyyy").parse(license_validity_date);
         final Date renewal_from_date = MyUtil.addDays(date4, -1);
         String renewal_fromdate = dateFormat.format(renewal_from_date);
         %>
         <%=StringEscapeUtils.escapeHtml(renewal_fromdate.trim())%>
   <%  }
    else if(type.equals("firmdetails")){
    	firm_no=request.getParameter("param");
    	try{
    		firmno=Integer.parseInt(firm_no);
    	}
    	catch(NumberFormatException e){
    		
    	}
    	
    	if(!firm_no.matches(pattern)){
    	}
    	else if(firm_no.matches(pattern)){
   sql="select firm_nm from fdca_firm where firm_no=?";
    st=con.prepareStatement(sql);
    if(firm_no.matches(pattern)){
    st.setInt(1, firmno);
    }
    rs=st.executeQuery();
    
  %>
  <% while(rs.next()){
	  %><%=StringEscapeUtils.escapeHtml(rs.getString("firm_nm").trim())%>
	  
 <% 
  }%> 
  <%}}
    else if (type.equals("area")){
  String circle_code=request.getParameter("circ_name");
  circle_code=request.getParameter("param");
  if(!circle_code.matches(pattern)){
  }
  else if(circle_code.matches(pattern)){
  sql="select area_cd,area_name from fdca_area_master where cir_cd =? order by area_name";
  st=con.prepareStatement(sql);
  if(circle_code.matches(pattern)){
  st.setString(1, StringEscapeUtils.escapeHtml(MyUtil.filterBad(circle_code)));
  }
  rs=st.executeQuery();
  %>
  <option value="">---Select---</option>
  <%
  while(rs.next()){
  %>
  <option value="<%=(rs.getString("area_cd"))%>"><%=(rs.getString("area_name"))%></option>
  <%} }
    }
    
    else if (type.equals("familynames")){
  String circle_code=request.getParameter("param");  
  circle_code=request.getParameter("param");
  if(!circle_code.matches(pattern)){
  }
  else if(circle_code.matches(pattern)){
  sql="select name from employee_family where emp_code =?";
  st=con.prepareStatement(sql);
  if(circle_code.matches(pattern)){
  st.setString(1, StringEscapeUtils.escapeHtml(MyUtil.filterBad(circle_code)));
  }
  rs=st.executeQuery();
  %>
  <option value="">---Select---</option>
  <option value="self">Self</option>
  <%
  while(rs.next()){
  %>
  <option value="<%=(rs.getString("name"))%>"><%=(rs.getString("name"))%></option>
  <%} }
    }
    
    else if(type.equals("dist")){
    	String circle_code=request.getParameter("circ_name");
    	String area_code=request.getParameter("area_name");
    	if(circle_code==null){
  	    circle_code=request.getParameter("distcode");
  	    area_code=request.getParameter("param");
  	  }
     sql="select dist_cd,dist_name from fdca_dist_mast where zone_cd=? and region_cd=?";
  	  st=con.prepareStatement(sql);
  	  if(circle_code.matches(pattern)){
  	  st.setString(1,StringEscapeUtils.escapeHtml( MyUtil.filterBad(circle_code)));
  	  }
  	  if(area_code.matches(pattern)){
  	  st.setString(2, StringEscapeUtils.escapeHtml( MyUtil.filterBad(area_code)));
  	  }
  	  
  	  rs=st.executeQuery();
  	  %>
  	  <option value="">---Select---</option>
  	  <%
  	  while(rs.next()){
  			 %>
  	  <option value="<%=StringEscapeUtils.escapeHtml(rs.getString("dist_cd"))%>"><%=StringEscapeUtils.escapeHtml(rs.getString("dist_name"))%></option>
  	  
  	  <%}
    }
    
    
    else if (type.equals("region")){
    	  String circle_code=request.getParameter("dist_name");
    	  circle_code=request.getParameter("param");
    	  if(!circle_code.matches(pattern)){
    	  }
    	  else if(circle_code.matches(pattern)){
    	  sql="select region_cd,region_name from fdca_region_mast where zone_cd=?";
    	  st=con.prepareStatement(sql);
    	  if(circle_code.matches(pattern)){
    	  st.setString(1, StringEscapeUtils.escapeHtml( MyUtil.filterBad(circle_code)));
    	  }
    	  rs=st.executeQuery();
    	  %>
    	  <option value="">---Select---</option>
    	  <%
    	  while(rs.next()){
    	  %>
    	  <option value="<%=StringEscapeUtils.escapeHtml(rs.getString("region_cd"))%>"><%=StringEscapeUtils.escapeHtml(rs.getString("region_name"))%></option>
    	  <%} }
    	    }
    else if (type.equals("area1")){
    	  String circle_code=request.getParameter("circ_name");
    	  circle_code=request.getParameter("param");
    	  if(!circle_code.matches(pattern)){
    	  }
    	  else if(circle_code.matches(pattern)){
    	  sql="select area_cd,area_name from fdca_area_master where cir_cd =? order by area_name";
    	  st=con.prepareStatement(sql);
    	  if(circle_code.matches(pattern)){
    	  st.setString(1, StringEscapeUtils.escapeHtml( MyUtil.filterBad(circle_code)));
    	  }
    	  rs=st.executeQuery();
    	  %>
    	  <option value="">---Select---</option>
    	  <%
    	  while(rs.next()){
    	  %>
    	  <option value="<%=StringEscapeUtils.escapeHtml(rs.getString("area_cd"))%>"><%=StringEscapeUtils.escapeHtml(rs.getString("area_name"))%></option>
    	  <%} }
    	    }
   else if (type.equals("user")){
    	  String circle_code=request.getParameter("dist_cd");
    	  if(!circle_code.matches(pattern)){
    		}
    	  else if(circle_code.matches(pattern)){
    	  sql="select emp_cd,u_det from fdca_usermaster where cir_cd =?";
    	  st=con.prepareStatement(sql);
    	  if(circle_code.matches(pattern)){
    	  st.setString(1, StringEscapeUtils.escapeHtml( MyUtil.filterBad(circle_code)));
    	  }
    	  rs=st.executeQuery();
    	  %>
    	  <option value="">---Select---</option>
    	  <%
    	  while(rs.next()){
    	  %>
    	  <option value="<%=StringEscapeUtils.escapeHtml(rs.getString("emp_cd"))%>"><%=StringEscapeUtils.escapeHtml(rs.getString("u_det"))%></option>
    	  <%} }}
    
      else if (type.equals("userexist")){
  	  String circle_code=request.getParameter("dist_cd");
  	 if(!circle_code.matches(pattern)){
		  
	  }
	  else if(circle_code.matches(pattern)){
  	  sql="select distinct emp_cd,u_det from fdca_view_users where cir_cd =?";
  	  st=con.prepareStatement(sql);
  	  st.setString(1, StringEscapeUtils.escapeHtml( MyUtil.filterBad(circle_code)));
  	  rs=st.executeQuery();
  	  %>
  	  <option value="">---Select---</option>
  	  <%
  	  while(rs.next()){
  			 %>
  	  
  	  <option value="<%=StringEscapeUtils.escapeHtml(rs.getString("emp_cd"))%>"><%=StringEscapeUtils.escapeHtml(rs.getString("u_det"))%></option>
  	  <%} }}
    
      else if (type.equals("loaddd")){
    sql="select distinct emp_cd,u_det from fdca_usermaster where  role_id=?";
  	  st=con.prepareStatement(sql);
  	st.setString(1, "D.D");
  	  rs=st.executeQuery();
  	  %>
  	  <option value="">---Select---</option>
  	  <%
  	  while(rs.next()){
  			 %>
  	  
  	  <option value="<%=StringEscapeUtils.escapeHtml(rs.getString("emp_cd"))%>"><%=StringEscapeUtils.escapeHtml(rs.getString("u_det"))%></option>
  	  <%} }
     else if (type.equals("circle")){
     String circle_code=request.getParameter("dist_name");
     if(!circle_code.matches(pattern)){
    		}
    	  else if(circle_code.matches(pattern)){
    	  sql="select cir_cd,cir_nm from fdca_circle where cir_cd =?";
    	  st=con.prepareStatement(sql);
    	  if(circle_code.matches(pattern)){
    	  st.setString(1, StringEscapeUtils.escapeHtml( MyUtil.filterBad(circle_code)));
    	  }
    	  rs=st.executeQuery();
    	  %>
    	  <option value="">---Select---</option>
    	  <%
    	  while(rs.next()){
    			 %>
    	  
    	  <option value="<%=StringEscapeUtils.escapeHtml(rs.getString("cir_cd"))%>"><%=StringEscapeUtils.escapeHtml(rs.getString("cir_nm"))%></option>
    	  <%} }}}
    else if (type.equals("jur_cd")){
    	String circle_code=request.getParameter("circ_name");
    	String area_code=request.getParameter("area_name");
    	if(circle_code==null||circle_code.equals("")){
  	    circle_code=request.getParameter("distcode");
  	    area_code=request.getParameter("param");
  	  }
   	 sql="select jur_cd,jur_name from fdca_jurisdiction_mast where cir_cd=? and area_cd=? and rec_status='A' order by jur_name";
  	  st=con.prepareStatement(sql);
  	   if(circle_code.matches(pattern)){ 
  	  st.setString(1, StringEscapeUtils.escapeHtml( MyUtil.filterBad(circle_code)));
  	   } else{
  		 st.setString(1,null);  
  	   }
  	  st.setString(2, StringEscapeUtils.escapeHtml( MyUtil.filterBad(area_code.trim())));
  	  rs=st.executeQuery();
  	 %>
  	  <option value="">---Select---</option>
  	  <%
  	  while(rs.next()){
  			 %>
  	  <option value="<%=StringEscapeUtils.escapeHtml(rs.getString("jur_cd"))%>"><%=StringEscapeUtils.escapeHtml(rs.getString("jur_name"))%></option>
  	  
  	  <%} }else if (type.equals("user_id")){
        	String circle_code=request.getParameter("param");
          	String area_code=request.getParameter("area_name");
          	String role=request.getParameter("role");
          	String user_type=request.getParameter("user_type");
          	 String userid="";
          	 String message="";
          	 String inchargecon="";
          String wherecon="";
          	if(circle_code==null || area_code==""){
          		circle_code="error";
          	}
          	
          	
          	if(role==null || role==""){
          		role="error";
          	}
          	if(user_type.equals("R")){
          		inchargecon="and incharge_empcode is not null";	
          	}
      if(role.equals("2")){
      	if(area_code==null || area_code==""){
      		area_code="error";
      	}else{
      		wherecon="and area_code='"+area_code+"'";
      	}	
          	}else{
          		area_code="ok";
          	}
          	if(circle_code.equals("error")||role.equals("error")||area_code.equals("error")){
          		
          	}else{    	
         	 sql="select user_id,incharge_empcode ,emp_code from fdca_userid_mst where cir_code=? and role=? "+wherecon+" "+inchargecon+"";
        	  st=con.prepareStatement(sql);
        	  st.setString(1, circle_code);
        	  st.setInt(2, Integer.parseInt(role.trim()));
        	  rs=st.executeQuery();
        	  if(rs.next()){
        		   userid=rs.getString("user_id");
        		  String empcode=MyUtil.GetFieldName("fdca_userid_mst", "emp_code", "user_id='"+userid+"'");
        		  String inch=rs.getString("incharge_empcode");
        		  String inchmesg="";
        		  if(inch!=null){
        			  inchmesg="and"+inch+" as In-charge";
        		  }
        		  if(empcode.equalsIgnoreCase("NA")){
        			  message="has not allocated to any user";  
        		  }else{
        			  message="is allocated to employee code:-<b>"+empcode+"</b> as Regular  "+inchmesg+"";  
        		  }
        			 %>
        	 <font color="red" style="font-size: 16px">User ID:-<b><%=rs.getString("user_id") %></b>&nbsp; <%=message %></font>
        	  
        	  <%}else{
        		%>
        		 <font color="red" style="font-size: 16px">No In-charge allocated</font>
        		<%  
        	  } 
          }
          	}else if (type.equals("emp_name")){
          	String emp_code=request.getParameter("param").trim(); 
    		  String user_name="";
    		  String message="";
    		  String userid=null;
    		  String usertype="";
    		  String multusers="";String val=" ";
          	if(emp_code==null || emp_code==""){
          		emp_code="error";
          	}
          	
          	if(emp_code.equals("error")){
          		
          	}else{    	
         	 sql="select u_det from fdca_usermaster where emp_cd=? ";
        	  st=con.prepareStatement(sql);
        	  st.setString(1, emp_code);
        	  rs=st.executeQuery();
        	  if(rs.next()){
        		  user_name=rs.getString("u_det");
       	String	sql2="select user_id,case when user_type='O' then 'Regular' when user_type='I' then 'Incharge' else 'NA' end as user_type from fdca_userid_mst where emp_code=?";
      	  st=con.prepareStatement(sql2);
       		st.setString(1, emp_code);
       		rs=st.executeQuery();
       		if(rs.next()){
       			userid=rs.getString("user_id");
     		   usertype=rs.getString("user_type");
     	 val ="<b>"+userid+"</b> as "+usertype+" ,";
     	multusers=multusers+val;
    	  while(rs.next()){
    		   userid=rs.getString("user_id");
    		   usertype=rs.getString("user_type");
    	 val ="<b>"+userid+"</b> as "+usertype+" ,";
    	multusers=multusers+val;
    	  }
       		}
       		  if(userid==null){
       			  message="has not allocated to any user ID";  
       		  }else{
       			  message="is allocated to user ID:-"+MyUtil.removeLastChar(multusers,1)+"";  
       		  }
       			 %>
       	 <font color="red" style="font-size: 16px"><b><%=user_name%></b>&nbsp; <%=message %></font>
       	  
       	  <%}else{
       		%>
          	 <font color="red" style="font-size: 16px">Employee code not Registered</font>
          	  
          	  <%  
       	  } 
          }}
      else{
  %>
  <h1>Invalid</h1>
  <%}%>