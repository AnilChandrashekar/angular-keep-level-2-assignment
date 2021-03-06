<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Keep-Board</title>
</head>

<body>
	<!-- Create a form which will have text boxes for Note title, content and status along with a Add 
		 button. Handle errors like empty fields.  (Use dropdown-list for NoteStatus) -->
		  <h1> Add a note.</h1>
		 <label id="errMsg"  style="color:red;"></label>
		 <form action="add" method="post" name="noteForm" id="noteForm">
		  <table style="border: 1px solid;">
		<tr><td>**Note Title  : <input type="text" id="noteTitle" name="noteTitle"></td></tr>
		<tr><td>**Note Status : <input type="text" id="noteStatus" name="noteStatus"></td></tr>
		<tr><td>**Note Content: <textarea id="noteContent" name="noteContent" rows="2" cols="20"></textarea></td></tr>
		<tr><td> 
		<input type="button" name="noteButton" id="noteButton" value="submit" onclick="return validation();">
		</td></tr>
		 </table>
		 </form>
<hr>
<h1> Notes Table</h1>

	<!-- display all existing notes in a tabular structure with Title,Content,Status, Created Date and Action -->
	<form action="delete" method="get" name="deleteForm" id="deleteForm">
	 <table style="border: 2px solid;">
	 <tr>
         <th><c:out value="Note Id"/></th>
         <th><c:out value="Note Title"/></th>
         <th><c:out value="Note Status"/></th>
         <th><c:out value="Note Content"/></th>
         <th><c:out value="Note Created At"/></th>
         <th><c:out value="Delete"/></th>
         <th><c:out value="Update"/></th>
      </tr>
	<c:forEach items="${notes}" var="note"> 
      <tr class="">
         <td><input type="text" id="noteId" name="noteId" value="${note.noteId}"> </td>
         <td><input type="text" id="noteTitle" name="noteTitle" value="${note.noteTitle}"></td>
         <td><input type="text" id="noteStatus" name="noteStatus" value="${note.noteStatus}"></td>
         <td><input type="text" id="noteContent" name="noteContent" value="${note.noteContent}"></td>
         <td><c:out value="${note.createdAt}"/></td>
         <td><a href="delete?noteId=${note.noteId}" onclick="document.getElementById("deleteForm").submit()">delete</a></td>
         <td>
         <!-- <input type="button" name="updateButton" id="updateButton" value="update" 	formmethod="post" formaction="update"> -->
         <button type="submit" formmethod="post"  formaction="update" >update</button>
         </td>
      </tr>
    </c:forEach>
    </table>
    </form>
</body>
<script type="text/javascript">

	function validation() 
	{
		let title = document.getElementById("noteTitle").value;
		let status = document.getElementById("noteStatus").value;
		let content = document.getElementById("noteContent").value;

		if ((title === '') || (status === '') || (content === '')) {
			document.getElementById("errMsg").innerHTML = 'All fields are mandatory.';
			return false;
		} else {
			document.getElementById("noteForm").submit();
		}
	}
	function update()
	{
		document.getElementById("deleteForm").submit();
	}
</script>
</html>