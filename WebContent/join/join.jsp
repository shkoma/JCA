<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   
<%@ page import="jca.utils.DBConnection" %>
<%@ page import="java.sql.*" %>
<%@page import="org.json.simple.*" %>

<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	response.setContentType("application/json");
/*	
	String id = request.getParameter("userid").toString();
	String pw = request.getParameter("password").toString();
	String mail = request.getParameter("email").toString();
*/

	String id = "younar5";
	String pw = "hihi";
	String mail = "hello";
	
	Connection conn = null;
	PreparedStatement ps = null;
	Statement stmt=null;
	int result = 0;

	JSONObject json = new JSONObject();
	
	try{
		conn = DBConnection.getConnection();
		
		String sql = "insert into user (id, pw, mail) values (?, ?, ?);";
		
		ps = conn.prepareStatement(sql);
		
		ps.setString(1, id);
		ps.setString(2, pw);
		ps.setString(3, mail);

		result = ps.executeUpdate();
		
		// 가입 성공
		if(result > 0) {
			json.put("status",1);
		} 
		// 가입 실패
		else {
			json.put("status",0);
		}
		
		
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		DBConnection.close(ps, conn);
	}
	out.write(json.toString());
%>
