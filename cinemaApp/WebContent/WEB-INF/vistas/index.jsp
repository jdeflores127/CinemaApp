<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>CineSite | Bienvenido</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<spring:url value="/resources" var="urlPublic" />
</head>

<body>

	<!-- Fixed navbar -->
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#navbar" aria-expanded="false"
					aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">My CineSite</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="#">Acerca</a></li>
					<li><a href="#">Login</a></li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</nav>

	<div class="container theme-showcase" role="main">
		<!-- Carousel -->
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="3"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="d-block w-100" src="${urlPublic}/img/slide1.jpg"
						alt="First slide">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="${urlPublic}/img/slide2.jpg"
						alt="Second slide">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="${urlPublic}/img/slide3.jpg"
						alt="Third slide">
				</div>
				<div class="carousel-item">
					<img class="d-block w-100" src="${urlPublic}/img/slide4.jpg"
						alt="Third slide">
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
		<!-- fin caroiser -->

		<div class="row page-header">
			<div class="col-lg-12">
				<h2 class="text text-center">
					<span class="badge badge-pill badge-success">EN CARTELERA</span>
				</h2>
				<form class="form-inline" action="filtraFecha" method="post">
					<div class="form-group">
						<label for="fecha">Fecha: </label> <select id="fecha" name="fecha"
							class="form-control">
							<c:forEach items="${fechasSiguientes}" var="fecha">
								<option value="${fecha}">${fecha}</option>
							</c:forEach>
						</select>
					</div>
					<button type="submit" class="btn btn-primary">Filtrar</button>
				</form>
			</div>
		</div>

		<!-- Marketing messaging -->
		<div class="container">

			<div class="row">
				<c:forEach var="pelicula" items="${listaPeliculas}">
					<div class="col-xs-12 col-sm-6 col-md-3">
						<img class="img-rounded" src="${urlPublic}/img/${pelicula.imagen}"
							alt="Generic placeholder image" width="150" height="200">
						<h4>${pelicula.titulo}</h4>
							<span class="badge badge-pill badge-primary col-3">${pelicula.clasificacion}</span> 
							<span class="badge badge-pill badge-primary col-4">${pelicula.duracion} min</span> 
							<span class="badge badge-pill badge-primary col-7">${pelicula.genero}</span>
						<p>
							<!--<a class="btn btn-sm btn-primary" href="mostrarDetalle/${pelicula.id}" role="button">Consulta
								Horarios &raquo;</a>-->
								<a class="btn btn-sm btn-primary" href="detalle?idPelicula=${pelicula.id}&fecha=${pelicula.fechaEstreno}" role="button">Consultar Horarios</a>
						</p>
					</div>
				</c:forEach>
			</div>

			<div class="page-header">
				<h2 class="text text-center">
					<span class="label label-success">Noticias y novedades</span>
				</h2>
			</div>

			<div class="row">

				<div class="col-sm-12 blog-main">

					<div class="blog-post">
						<h3 class="blog-post-title">Julia Roberts protagonizará The
							Bookseller</h3>

						<p class="blog-post-meta">
							<span class="label label-danger">Publicado: 16-06-2017</span>
						</p>
						<p>
							La novela de Cynthia Swanson <span style="color: #0000ff;"><strong>The
									Bookseller</strong></span> ser&aacute; llevada al cine con <span
								style="color: #0000ff;">Julia Roberts (Los Pitufos: La
								aldea Escondida)</span> como protagonista.<br /> <br />La historia
							est&aacute; ambientada en los sesenta y su protagonista es una
							mujer soltera, Kitty Miller, que lleva una librer&iacute;a.
							Sue&ntilde;a con una vida alternativa en la que ha encontrado el
							amor y est&aacute; casada y con hijos, pero la l&iacute;nea que
							separa realidad y ficci&oacute;n comienza a estar demasiado
							dispersa para que la distinga.<br /> <br />Seg&uacute;n informa
							<span style="color: #ff0000;"><strong>Moviehole</strong></span>
							Roberts tambi&eacute;n producir&aacute; la pel&iacute;cula junto
							a Lisa Gillan y Marisa Yeres Hill.
						</p>

						<hr class="featurette-divider">
					</div>

					<div class="blog-post">
						<h3 class="blog-post-title">Bob Esponja: tercera película y
							temporada 12</h3>
						<p class="blog-post-meta">
							<span class="label label-danger">Publicado: 15-06-2017</span>
						</p>

						<p>
							<strong><span style="color: #ff0000;">Nickelodeon
									y productor de SpongeBob Square Pants confirman temporada 12 de
									52 episodios y tercera pel&iacute;cula pr&oacute;ximamente. </span></strong>
						</p>
						<p>
							<strong>&iexcl;Calamardo est&aacute; enojado!Bob
								Esponja: tercera pel&iacute;cula y temporada 12</strong>
						</p>
						<p>Nickelodeon y productor de SpongeBob Square Pants confirman
							temporada 12 de 52 episodios y tercera pel&iacute;cula
							pr&oacute;ximamente. &iexcl;Calamardo est&aacute; enojado!.</p>
						<p>A lado de cierta Pi&ntilde;a (debajo del mar), Calamardo
							debe estar de muy mal humor, pues hay Bob Esponja para rato...
							&iexcl;y por partida doble!. Por un lado, Vincent Waller (The Ren
							&amp; Stimpy Show), artista, productor, escritor y supervisor
							creativo de SpongeBob Squarepants anunci&oacute; con un divertido
							dibujo desde su cuenta de Twitter que, antes de que se estrene
							siquiera la temporada 11 de la serie animada, se ha confirmado ya
							la n&uacute;mero 12, &iexcl;que constar&aacute; de 52 episodios
							(recuerden que cada emisi&oacute;n consta de 2 aventuras)!</p>

						<hr class="featurette-divider">
					</div>

				</div>
			</div>

		</div>

		<!-- FOOTER -->
		<footer>
			<p class="pull-right">
				<a href="#">Back to top</a>
			</p>
			<p>
				&copy; 2017 My CineSite, Inc. &middot; <a href="#">Privacy</a>
				&middot; <a href="#">Terms</a>
			</p>
		</footer>

	</div>
	<!-- /container -->

	<!-- Bootstrap core JavaScript
    ================================================== -->
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
