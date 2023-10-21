<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<html lang="pt-br">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">
<link rel="stylesheet" href="../../src/styles/style.css">
<link rel="stylesheet" href="../../src/styles/mediaquery.css">
<script src="https://unpkg.com/@phosphor-icons/web"></script>
<title>Destino Certo - Reserva</title>
</head>

<body>

	<header>
		<nav class="navbar navbar-expand-md navbar-dark">
			<div class="container-fluid">
				<a class="navbar-brand" href="index.jsp"> <img
					src="../../src/imagens/destinoCertoLogo.png"
					alt="Imagem da Logo Destino Certo">
				</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNav"
					aria-controls="navbarNav" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

		
				<jsp:include page="../../components/menu.jsp">
					<jsp:param name="home" value="../../index.jsp" />
					<jsp:param name="reservas" value="./reserva" />
					<jsp:param name="clientes" value="./cliente" />
					<jsp:param name="entrar" value="../../entrar.jsp" />
				</jsp:include>

			</div>
		</nav>
	</header>

	<!-- colocar uma capa maneira aqui-->

	<div class="container" style="padding: 30px;">
		<h1>Bem-vindo(a), ${cliente.nome}</h1>
		<h1>Bem-vindo(a), <c:out value="${cliente.nome}" /></h1>
		
		<!--		 colocar  nome doi cliente aqui -->
		<div
			style="display: flex; justify-content: center; align-items: center; gap: 5px;">

			<i class="ph ph-ticket" style="font-size: 40px;"></i>
			<h1 class="text-center">Complete sua Reserva</h1>
		</div>

		<form action="../../reserva-create">
			<!--verifiar aqui-->
			<div class="row">

				<div class="col col-6 col-sm-6">
					<label for="origem" class="col-form-label"><small>De
							onde está saindo?</small></label>
					<div class="col-auto">
						<input type="text" id="origem" class="form-control" name="origem"
							aria-describedby="origem" required>
					</div>
				</div>

				<div class="col col-6 col-sm-6">
					<label for="destino" class="col-form-label"><small>Para
							onde você vai?</small></label>
					<div class="col-auto">
						<input type="text" id="destino" class="form-control"
							name="destino" aria-describedby="destino" required>
					</div>
				</div>
				<div class="col col-12 col-sm-6">
					<label for="id_cliente" class="col-form-label"><small>ID
							do Cliente</small></label>
					<div class="col-auto">
						<input type="number" id="id_cliente" class="form-control"
							name="id_cliente" aria-describedby="id_cliente" required>
					</div>
				</div>

				<div class="col-3 col col-12 col-sm-4">
					<label for="data-ida" class="col-form-label"><small>Escolha
							as datas</small></label>
					<div class="col mb-1">
						<input type="date" id="data-ida" class="form-control"
							name="data-ida" aria-describedby="data-ida" required>
					</div>

					<div class="col mb-1">
						<input type="date" id="data-volta" class="form-control"
							name="data-volta" aria-describedby="data-volta" required>
					</div>
				</div>

			</div>

			<div class="d-grid mt-1 gap-3">
				<!-- botão levar  pra RESERVA-CREATE - fazer pagina HTML dela e depois JSP-->
				<button type="submit" class="btn btn-primary">Criar
					Reservar</button>
					
<!-- 					fazer um botao tipo 'cadastre-se para criar uma reserva?' -->

				<a href="" class="btn btn-primary">Cadastre-se</a>
			</div>

		</form>


<!-- 		<a href="/cadastro">Voltar para o cadastro</a> -->
	</div>

	<footer>
		<img src="../../src/imagens/destinoCertoLogo.png"
			alt="Imagem da Logo da Destino Certo">
		<div class="compra-segura">
			<strong>COMPRA SEGURA</strong> <a href="pagamento.html">Pagamentos</a>
			<a href="contato.html">Fale Conosco</a> <a href="promocoes.html">Black
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