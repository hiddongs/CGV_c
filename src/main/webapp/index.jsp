<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Redirect root URL to main controller
    response.sendRedirect(request.getContextPath() + "/main/main.do");
%>
