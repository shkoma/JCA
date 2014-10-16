<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="jca.utils.DBConnection" %>
<%@ page import="java.sql.*" %>
<%@page import="org.json.simple.*" %>

<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	response.setContentType("application/json");
	
	String userid = request.getParameter("userid").toString();
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	JSONObject json = new JSONObject();
	
	try{
		conn = DBConnection.getConnection();
		String sql = "select * from user where id=?;";
		ps = conn.prepareStatement(sql);
		ps.setString(1, userid);
		
		rs = ps.executeQuery();
		
		if(rs.next()){
			json.put("status", 0);
			// 아이디 존재
		}
		else{
			json.put("status", 1);
			// 중복 아이디 없음
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		DBConnection.close(rs, ps, conn);
	}
	
	out.write(json.toString());
%>