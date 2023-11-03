<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="jstl"%>


<!DOCTYPE html>
<html lang="pt-BR">

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
<title>Destino Certo - Contato</title>
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
					<jsp:param name="passagens" value="./passagem" />
					<jsp:param name="clientes" value="./cliente" />
					<jsp:param name="entrar" value="./entrar.jsp" />
				</jsp:include>

			</div>
		</nav>
	</header>
	
	<div class="min-vh-100 d-flex flex-column ">
	<div class="position-relative overflow-hidden text-center ">
      <img class="capinha card-img-top" src="src/imagens/capa3.jpg"
        alt="Imagem de uma pessoa sentada no aeroporto olhando um avião decolar.">
    </div>

				
	<div class="container" style="padding: 10px;">


		<div class="text-center">
			<h2 class="display-5">TODOS OS CONTATOS</h2>
		</div>

		<div class="container">
			<div class="overflow-x-auto">
				<table class="table table-striped">

					<thead>
						<tr>
							<th scope="col">Id</th>
							<th scope="col">Nome</th>
							<th scope="col">Email</th>
							<th scope="col">Mensagem</th>
							<th scope="col">Ações</th>
						</tr>
					</thead>

					<tbody>
						<jstl:forEach items="${listaContatos}" var="c">
							<tr>
								<td>${c.id_contato}</td>
								<td>${c.nome}</td>
								<td>${c.email}</td>
								<td>${c.mensagem}</td>

								<td><a href="contato-delete?id_contato=${c.id_contato}"
									onclick="return confirm('Deseja excluir a mensagem de ${c.nome}?')"
									class="btn btn-danger mb-1">Excluir</a></td>

							</tr>
						</jstl:forEach>

					</tbody>
				</table>
			</div>
		</div>

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