<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Creacion de Noticias</title>    

    <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
	
	<spring:url value="/resources" var="urlPublic" />
  	<script type="text/javascript" src="${urlPublic}/js/script-file.js"></script>
  </head>

  <body onload="InicializaDatePicker()">

    <!-- Fixed navbar -->
    <nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">My CineSite</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li><a href="#">Acerca</a></li>
            <li><a href="#">Login</a></li>            
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </nav>

    <div class="container theme-showcase" role="main">

      <h3 class="blog-title"><span class="label label-success">Datos de la Pelicula</span></h3>

      <form:form action="capturaPelicula" method="post" modelAttribute="pelicula">
        <div class="row">         
          <div class="col-sm-6">
            <div class="form-group">
              <label for="titulo">Titulo</label>             
              <form:input type="text" class="form-control" path="titulo" id="titulo" required="required" />
            </div>
          </div>
          <div class="col-sm-3">
            <div class="form-group">
              <label for="genero">Genero</label>             
              <form:select id="genero" path="genero" class="form-control" >
				<form:option id="optionTerror" value="Terror">Terror</form:option>
				<form:option id="optionComedia" value="Comedia">Comedia</form:option>                
              </form:select>  
            </div>
          </div>
          <div class="col-sm-3">
            <div class="form-group">
              <label for="duracion">Duracion</label>             
              	<form:input type="text" class="form-control" path="duracion" id="duracion" required="required"/>  
            </div>
          </div>
        </div>
        <div class="row">
			<div class="col-sm-3">
				<div class="form-group">
					<label for="clasificacion">Clasificacion de la pelicula</label> 
					<form:select
						id="clasificacion" path="clasificacion" class="form-control">
						<form:option id="optionB15" value="A">A</form:option>
						<form:option id="optionPG" value="B">B</form:option>
						<form:option id="optionR" value="C">C</form:option>
					</form:select>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-3">
				<label for="fechaEstreno">Fecha de estreno</label> 
				<form:input type="text" class="form-control datepicker" path="fechaEstreno" id="fechaEstreno"/>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-3">
	            <div class="form-group">
	              <label for="director">director</label>             
	              	<form:input type="text" class="form-control" path="detalle.director" id="director" required="required"/>  
	            </div>
          	</div>
          	<div class="col-sm-3">
	            <div class="form-group">
	              <label for="actores">actores</label>             
	              	<form:input type="text" class="form-control" path="detalle.actores" id="actores" required="required"/>  
	            </div>
          	</div>
          	<div class="col-sm-3">
	            <div class="form-group">
	              <label for="sinopsis">sinopsis</label>             
	              	<form:input type="text" class="form-control" path="detalle.sinopsis" id="sinopsis" required="required"/>  
	            </div>
          	</div>
		</div>
		
		
		<button type="submit" class="btn btn-danger" >Guardar</button>
		
      </form:form> 
	  <spring:hasBindErrors name="pelicula">
	  	<div class="alert alert-danger" role="alert">Se presentaron los siguientes errores</div>
	  	<ul>
	  		<c:forEach var="error" items="${errors.allErrors}">
	  			<li><spring:message message="${error}"/></li>
	  		</c:forEach>
	  	</ul>
	  </spring:hasBindErrors>		
      <hr class="featurette-divider">

      <!-- FOOTER -->
      <footer>        
        <p class="pull-right"><a href="#">Back to top</a></p>
        <p>&copy; 2017 My CineSite, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
      </footer>

    </div> <!-- /container -->

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
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
    <script src="${urlPublic}/tinymce/tinymce.min.js"></script>
    <script>
      tinymce.init({
          selector: '#detalle',
          plugins: "textcolor, table lists code",
          toolbar: " undo redo | bold italic | alignleft aligncenter alignright alignjustify \n\
                    | bullist numlist outdent indent | forecolor backcolor table code"
      });
    </script>
  </body>
</html>