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
<link rel="stylesheet" href="src/styles/style.css">
<link rel="stylesheet" href="src/styles/mediaquery.css">
<script src="https://unpkg.com/@phosphor-icons/web"></script>
<title>Destino Certo - Reservas</title>
</head>

<body>

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
					<jsp:param name="clientes" value="./cliente" />
					<jsp:param name="entrar" value="./entrar.jsp" />
				</jsp:include>

			</div>
		</nav>
	</header>

	<!-- colocar uma capa maneira aqui-->

	<div class="container" style="padding: 30px;">
		<%-- 		<h1>Bem-vindo, ${cliente.nome}</h1> --%>
		<%-- colocar  nome doi cliente aqui --%>
		<div
			style="display: flex; justify-content: center; align-items: center; gap: 5px;">

			<i class="ph ph-ticket" style="font-size: 40px;"></i>
			<div class="container"
				style="display: flex; align-items: center; justify-content: space-between;">
				<h1 class="text-center">Reservas</h1>
				<a class="btn btn-primary ml-auto" data-bs-toggle="modal" href=""
					class="btn btn-primary" data-bs-target="#cadastro"> Criar
					Reserva </a>
			</div>
		</div>

		<table class="table table-striped">

			<thead>
				<tr>
					<th scope="col">id</th>
					<th scope="col">Origem</th>
					<th scope="col">Destino</th>
					<th scope="col">Data de Partida</th>
					<th scope="col">Data de Chegada</th>
					<!-- 					<th scope="col">Cliente</th> id ou nome do cliente aqui?  -->
					<th scope="col">Ações</th>
				</tr>
			</thead>

			<tbody>
				<jstl:forEach items="${listaReservas}" var="r">
					<tr>
						<td>${r.id_reserva}</td>
						<td>${r.origem}</td>
						<td>${r.destino}</td>
						<td>${r.data_partida}</td>
						<td>${r.data_chegada}</td>
						<%-- 						<td>${r.id_cliente}</td> --%>

						<td><a data-bs-toggle="modal"
							href="reserva-edit?id_reserva=${r.id_reserva}"
							class="btn btn-primary">Editar</a> <!-- 							 <button class=" btn btn-primary btn-criar" type="button" data-bs-toggle="modal" -->
							<!--             data-bs-target="#cadastro">Edt teste</button> -->

							<a href="reserva-delete?id_reserva=${r.id_reserva}"
							onclick="return confirm('Deseja Excluir a Reserva ${r.id_reserva}?')"
							class="btn btn-danger">Excluir</a></td>

					</tr>
				</jstl:forEach>

			</tbody>
		</table>








		<!-- modal -->
		<div class="modal fade" id="cadastro" tabindex="-1"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header">
						<h1 class="modal-title fs-5" id="exampleModalLabel">Criar
							Reserva</h1>
						<button type="button" class="btn-close" data-bs-dismiss="modal"
							aria-label="Close"></button>
					</div>

					<div class="modal-body">

						<form action="./reserva-create" class="needs-validation"
							novalidate>

							<div class="row ">


								<div class="col-12">

									<label for="origem" class="col-form-label"><small>De
											onde está saindo?</small></label>
									<div class="col-auto">
										<input type="text" id="origem" class="form-control"
											name="origem" aria-describedby="origem"
											value="${reserva.origem}">
									</div>

								</div>

								<div class="col-12">

									<label for="destino" class="col-form-label"><small>Para
											onde você vai?</small></label>
									<div class="col-auto">
										<input type="text" id="destino" class="form-control"
											name="destino" aria-describedby="destino"
											value="${reserva.destino}">
									</div>

								</div>

								<div class="col-12">
									<label for="id_cliente" class="col-form-label"><small>ID
											do Cliente</small></label>
									<div class="col-auto">
										<input type="number" id="id_cliente" class="form-control"
											name="id_cliente" aria-describedby="id_cliente" required>
									</div>
								</div>

								<label for="data-ida" class="col-form-label"><small>Escolha
										as datas</small></label>
								<div class="col-sm-6">

									<div class="col mb-1">
										<input type="date" id="data-ida" class="form-control"
											name="data-ida" aria-describedby="data-ida"
											value="${reserva.data_partida}">
									</div>

								</div>

								<div class="col-sm-6 mb-3">

									<div class="col mb-1">
										<input type="date" id="data-volta" class="form-control"
											name="data-volta" aria-describedby="data-volta"
											value="${reserva.data_chegada}">
									</div>

								</div>

							</div>
							<input type="submit" class="w-100 btn btn-primary btn-lg"
								value="Reservar">
							<!-- 							<a href="./" class="w-100 btn btn-primary btn-lg" type="button" -->
							<!-- 								data-bs-toggle="modal" data-bs-target="#bemVindo">Confirmar -->
							<!-- 								alteração</a> -->
							<!-- 							<button class="w-100 btn btn-primary btn-lg" type="button" -->
							<!-- 								data-bs-toggle="modal" data-bs-target="#bemVindo">Confirmar -->
							<!-- 								alteração</button> -->
						</form>

					</div>

				</div>
			</div>
		</div>
		<!-- fim do modal -->





		<a href="/cadastro">Voltar para o cadastro</a>
	</div>

	<footer>
		<img src="src/imagens/destinoCertoLogo.png"
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