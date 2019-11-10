<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Mostrar index</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<spring:url value="/resources" var="recursos"/>
</head>
<body>
	<table class="table">
		<thead class="thead-dark">
			<th>poster</th>
			<th>indice</th>
			<th>titulo</th>
			<th>duracion</th>
			<th>clasificacion</th>
			<th>genero</th>
			<th>fecha de estreno</th>
			<th>estatus</th>
		</thead>
		
		<c:forEach var="pelicula" items="${peliculasList }" varStatus="contador">
			<tr>
				<td><img src="${recursos}/img/${pelicula.imagen }" height="100" weight="100"/></td>
				<td><c:out value="${contador.count }" /></td>
				<td><c:out value="${pelicula.titulo }" /></td>
				<td><c:out value="${pelicula.duracion }" /></td>
				<td><c:out value="${pelicula.clasificacion }" /></td>
				<td><c:out value="${pelicula.genero }" /></td>
				<td><fmt:formatDate pattern="dd-mm-yyyy" value="${pelicula.fechaEstreno}" /></td>
					<c:choose>
						<c:when test="${pelicula.status=='Activo'}">
							<td class="alert alert-success"><c:out value="Activo"/></td>
						</c:when>
						<c:otherwise>
							<td class="alert alert-danger"><c:out value="Inactivo"/></td>					
						</c:otherwise>
					</c:choose>
			</tr>
		</c:forEach>
	</table>
	<!-- Bootstrap -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
</body>
</html>