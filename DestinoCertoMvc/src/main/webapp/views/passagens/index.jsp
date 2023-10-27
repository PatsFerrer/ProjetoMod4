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
<title>Destino Certo - Passagens</title>
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


				<!-- editar aqui, adicionar os caminhois -->
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

		<div
			style="display: flex; justify-content: center; align-items: center; gap: 5px;">



			<i style="font-size: 40px;" class="ph ph-ticket"></i>

			<div class="container"
				style="display: flex; align-items: center; justify-content: space-between;">
				<h1 class="text-center">Passagens</h1>


<!-- tirar esse botao? -->
				<a class="btn btn-primary ml-auto" data-bs-toggle="modal" href="" data-bs-target="#cadastro"> TIRAR Gerar
					Passagem </a>
			</div>
		</div>

		<table class="table table-striped">

			<thead>
				<tr>
					<th scope="col">Id</th>
					<th scope="col">Cliente</th>
					<th scope="col">Data Emissão</th> <!-- talvez eu tire isso -->
					<th scope="col">Preço</th>
					<th scope="col">Data Partida</th>
					<th scope="col">Data Retorno</th>
					<th scope="col">Origem</th>
					<th scope="col">Destino</th>
					<th scope="col">Assento</th>
					<th scope="col">ID Reserva FK</th>
					<!-- 					<th scope="col">Cliente</th> id ou nome do cliente aqui?  -->
					<th scope="col">Ações</th>
				</tr>
			</thead>

			<tbody>
				<jstl:forEach items="${listaPassagens}" var="p">
					<tr>
						<td>${p.id_passagem}</td>
						<td>${p.cliente.nome}</td>
						<td>${p.data_emissao}</td>
						<td>${p.preco}</td>
						<td>${p.reserva.data_partida}</td>
						<td>${p.reserva.data_chegada}</td>
						<td>${p.reserva.origem}</td>
						<td>${p.reserva.destino}</td>
						<td>${p.assento}</td>
						<td>${p.reserva.id_reserva}</td>

						<td><a data-bs-toggle="modal"
							href="passagem-edit?id_passagem=${r.id_passagem}"
							class="btn btn-primary">Imprimir</a>
							<!-- 							 <button class=" btn btn-primary btn-criar" type="button" data-bs-toggle="modal" -->
							<!--             data-bs-target="#cadastro">Edt teste</button> -->

							<a href="passagem-delete?id_passagem=${p.id_passagem}"
							onclick="return confirm('Deseja Excluir a Passagem de ID ${p.id_passagem} de ${p.cliente.nome}?')"
							class="btn btn-danger">Excluir</a>




					</tr>
				</jstl:forEach>

			</tbody>
		</table>







<!-- acho melhor tirar esse modal -->
		<!-- modal -->
<!-- 		<div class="modal fade" id="cadastro" tabindex="-1" -->
<!-- 			aria-labelledby="exampleModalLabel" aria-hidden="true"> -->
<!-- 			<div class="modal-dialog modal-dialog-centered"> -->
<!-- 				<div class="modal-content"> -->
<!-- 					<div class="modal-header"> -->
<!-- 						<h1 class="modal-title fs-5" id="exampleModalLabel">Passagem</h1> -->
<!-- 						<button type="button" class="btn-close" data-bs-dismiss="modal" -->
<!-- 							aria-label="Close"></button> -->
<!-- 					</div> -->

<!-- 					<div class="modal-body"> -->

<!-- 						<form action="./cliente-create" class="needs-validation"> -->
<!-- 							<div class="row g-3"> -->
<!-- 								<div class="col-12"> -->
<!-- 									<input type="text" class="form-control" id="nome" -->
<!-- 										placeholder="Nome" name="nome" value="" required> -->
<!-- 									<div class="invalid-feedback">Nome válido é obrigatório.</div> -->
<!-- 								</div> -->

<!-- 								<div class="col-12"> -->
<!-- 									<input type="email" class="form-control" id="email" -->
<!-- 										placeholder="E-mail" name="email" required> -->
<!-- 									<div class="invalid-feedback">Insira um endereço de -->
<!-- 										e-mail válido.</div> -->
<!-- 								</div> -->

<!-- 								<div class="col-sm-6"> -->
<!-- 									<input type="tel" class="form-control" id="telefone" -->
<!-- 										placeholder="Celular" name="telefone" required> -->
<!-- 									<div class="invalid-feedback">Insira um um celular -->
<!-- 										válido.</div> -->
<!-- 								</div> -->

<!-- 								<div class="col-sm-6 mb-3"> -->
<!-- 									<input type="password" class="form-control" id="senha" -->
<!-- 										placeholder="Nova senha" name="senha" required> -->
<!-- 									<div class="invalid-feedback">Insira uma senha válida.</div> -->
<!-- 								</div> -->

<!-- 							</div> -->
<!-- 							<button class="w-100 btn btn-primary btn-lg" type="submit">Cadastrar</button> -->
<!-- 						</form> -->

<!-- 					</div> -->

<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
		<!-- fim do modal -->



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