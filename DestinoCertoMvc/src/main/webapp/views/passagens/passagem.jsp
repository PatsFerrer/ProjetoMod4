<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>

<html lang="pt-br">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<link rel="stylesheet" href="./src/styles/style.css">
<link rel="stylesheet" href="./src/styles/mediaquery.css">
<script src="https://unpkg.com/@phosphor-icons/web"></script>
<title>Destino Certo - Passagem</title>
</head>

<body class="min-vh-100 d-flex flex-column justify-content-between">

	<header>
		<nav class="navbar navbar-expand-md navbar-dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="index.jsp"> <img
					src="src/imagens/destinoCertoLogo.png"
					alt="Imagem da Logo Destino Certo">
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNav"
					aria-controls="navbarNav" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<jsp:include page="../../components/menu.jsp">
					<jsp:param name="home" value="./index.jsp" />
					<jsp:param name="destinos" value="./destinos.jsp" />
					<jsp:param name="promocoes" value="./promocoes.jsp" />
					<jsp:param name="contato" value="./contato.jsp" />
					<jsp:param name="reservas" value="./reserva" />
					<jsp:param name="passagens" value="./passagem" />
					<jsp:param name="clientes" value="./cliente" />
					<jsp:param name="entrar" value="./entrar.jsp" />
				</jsp:include>

			</div>
		</nav>
	</header>

	<div class="container" style="padding: 30px;">

		<div
			style="display: flex; justify-content: center; align-items: center; gap: 5px;">
			<i style="font-size: 40px;" class="ph ph-ticket"></i>
			<h1 class="text-center">Gerar Passagem</h1>
		</div>


		<div class="container">

			<form action="./passagem-create" class="needs-validation">
				<div class="row gap">

					<div class="col-12">
					<label for="origem" class="col-form-label"><small>Origem</small></label>
						<input readonly type="text" class="form-control" id="origem"
							placeholder="origem" name="origem"
							value="${reserva.origem}">
					</div>
					
					<div class="col-12">
					<label for="origem" class="col-form-label"><small>Destino</small></label>
						<input type="text" class="form-control" id="destino"
							placeholder="destino" name="destino"
							value="${reserva.destino}">
					</div>
					

					<div hidden class="col-12">
					<label for="id_reserva" class="col-form-label"><small>Reserva</small></label>
						<input type="text" class="form-control" id="id_reserva"
							placeholder="id_reserva" name="id_reserva"
							value="${reserva.id_reserva}">
					</div>
					
					<div hidden class="col-12">
					<label for="id_cliente" class="col-form-label"><small>Cliente</small></label>
						<input type="text" class="form-control" id="id_cliente"
							placeholder="id_cliente" name="id_cliente"
							value="${reserva.cliente.id_cliente}">
					</div>
					
<%-- 					<%= request.getParameter("id_reserva")%> --%>
					<div class="col-12">
					<label for="preco" class="col-form-label"><small>Preço</small></label>
						<input type="text" class="form-control" id="preco"
							placeholder="Valor da Passagem" name="preco"
							value="${passagem.preco}">
					</div>

					<div class="col-12">
					<label for="preco" class="col-form-label"><small>Assento</small></label>
						<input type="text" class="form-control" id="email"
							placeholder="Assento" name="assento" value="${p.assento}">
						
					</div>


				</div>
				<div class="d-flex justify-content-end gap-1 pt-3">
					<button class=" btn btn-primary btn-lg" type="submit">Gerar</button>
					<a href="./reserva" class=" btn btn-danger btn-lg">Cancelar</a>
				</div>
			</form>

		</div>


	</div>
	

	<footer>
		<img src="src/imagens/destinoCertoLogo.png"
			alt="Imagem da Logo da Destino Certo">
		<div class="compra-segura">
			<strong>COMPRA SEGURA</strong> <a href="pagamento.html">Pagamentos</a>
			<a href="contato.jsp">Fale Conosco</a> <a href="promocoes.jsp">Black
				Friday</a>
		</div>
		<div class="contato">
			<strong>CONTATO</strong> <span><i class="ph ph-phone"></i> 85
				3232-3232</span> <span><i class="ph ph-at"></i>
				contato@destinocerto.com</span> <span><i class="ph ph-map-pin"></i>
				Rua 100 Destino, s/n</span>
		</div>
		<div class="redes-sociais">
			<strong>REDES SOCIAIS</strong>
			<div>
				<span> <a href="https://www.instagram.com/patsferrer/"
					target="_blank"> <i class="ph ph-instagram-logo"></i>
				</a>
				</span> <span> <a href="#"><i class="ph ph-twitter-logo"></i></a>
				</span> <span> <a href="https://github.com/patsferrer"
					target="_blank"><i class="ph ph-github-logo"></i></a>
				</span>
			</div>
		</div>
	</footer>



	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
		crossorigin="anonymous"></script>


</body>

</html>