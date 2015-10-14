<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- 
	JSP file for tablibs 
    It is good practice to have one file for all taglibs and just include it in different files which need taglibs,
    to import this taglib.jsp in another jsp file we need to use command:
 <%-- <%@ include file="../layout/taglib.jsp"%> --%>
 -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
