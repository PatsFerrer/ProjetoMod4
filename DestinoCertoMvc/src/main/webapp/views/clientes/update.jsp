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
<title>Destino Certo - Editar Cliente</title>
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

	<div class="position-relative overflow-hidden text-center ">
      <img class="capinha card-img-top" src="src/imagens/capaCliente.jpg"
        alt="Imagem de uma pessoa olhando os telões do aeroporto.">
    </div>

	<div class="container" style="padding: 55px;">

		<div style="display: flex; justify-content: center; align-items: center; gap: 5px;">
			<i style="font-size: 40px;" class="ph ph-user-circle"></i>
			<h1 class="text-center">Atualizar Cliente</h1>
		</div>

		<div class="container">

			<form action="./cliente-update" class="needs-validation">
				<div class="row g-3">
				
					<div class="col-12">
						<input type="text" class="form-control" id="id"
							placeholder="id" name="id_cliente" value="${cliente.id_cliente}" readonly hidden>
					</div>
					
					<div class="col-12">
						<input type="text" class="form-control" id="nome"
							placeholder="Nome" name="nome" value="${cliente.nome}">
						<div class="invalid-feedback">Nome válido é obrigatório.</div>
					</div>

					<div class="col-12">
						<input type="text" class="form-control" id="email"
							placeholder="E-mail" name="email" value="${cliente.email}">
						<div class="invalid-feedback">Insira um endereço de e-mail
							válido.</div>
					</div>

					<div class="col-sm-6">
						<input type="tel" class="form-control" id="telefone"
							placeholder="Celular" name="telefone" value="${cliente.telefone}" >
						<div class="invalid-feedback">Insira um um celular válido.</div>
					</div>

					<div class="col-sm-6 mb-3">
						<input type="password" class="form-control" id="senha"
							placeholder="Nova senha" name="senha" value="${cliente.senha}">
						<div class="invalid-feedback">Insira uma senha válida.</div>
					</div>

				</div>
				<div class="d-flex justify-content-end gap-1">
					<button class=" btn btn-primary btn-lg" type="submit">Confirmar</button>
					<a href="./cliente" class=" btn btn-danger btn-lg">Cancelar</a>
				</div>
			</form>

		</div>

	</div>

	<footer>
		<img src="src/imagens/destinoCertoLogo.png"
			alt="Imagem da Logo da Destino Certo">
		<div class="compra-segura">
      		<strong>COMPRA SEGURA</strong>
      		<a href="pagamento.html">Pagamentos</a>
     		 <a href="contato.jsp">Fale Conosco</a>
    		  <a href="promocoes.jsp">Black Friday</a>
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
