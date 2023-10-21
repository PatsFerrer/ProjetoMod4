<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<link rel="stylesheet" href="src/styles/entrar.css">
<script src="https://unpkg.com/@phosphor-icons/web"></script>
<title>Destino Certo - Login</title>
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


				<jsp:include page="./components/menu.jsp">
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


	<main class="main-entrar background-img mb3"
		style="height: 85vh; display: flex; align-items: center;">

		<section class="container">

			<!-- caixinha -->
			<div class="container cadastro-cliente">
				<form action="../../cliente-create" class="needs-validation"
							novalidate>
					<div class="row g-3">

						<div class="col-12">
							<input type="text" class="form-control" id="email"
								placeholder="Email">
							<div class="invalid-feedback">Insira um endereço de e-mail
								válido.</div>
						</div>
						<div class="col-12 mb-3">
							<input type="password" class="form-control" id="email"
								placeholder="Senha">
							<div class="invalid-feedback">Insira uma senha válida.</div>
						</div>
					</div>
					<a href="index.html" class="w-100 btn btn-primary btn-lg mb-2"
						type="button"" >Entrar
						</button> <a href=" #">Esqueceu a senha?</a>
						<hr class="my-2">
						<button class="w-100 btn btn-primary btn-lg btn-criar"
							type="button" data-bs-toggle="modal" data-bs-target="#cadastro">Criar
							nova conta</button>
				</form>
			</div>
			<!-- caixinha -->

		</section>

	</main>

<!-- modal -->
	<div class="modal fade" id="cadastro" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-5" id="exampleModalLabel">Cadastro</h1>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body">

					<form action="./cliente-create" class="needs-validation">
						<div class="row g-3">
							<div class="col-12">
								<input type="text" class="form-control" id="nome"
									placeholder="Nome" name="nome" value="" required>
								<div class="invalid-feedback">Nome válido é obrigatório.</div>
							</div>

							<div class="col-12">
								<input type="email" class="form-control" id="email"
									placeholder="E-mail" name="email" required>
								<div class="invalid-feedback">Insira um endereço de e-mail
									válido.</div>
							</div>

							<div class="col-sm-6">
								<input type="tel" class="form-control" id="telefone"
									placeholder="Celular" name="telefone" required>
								<div class="invalid-feedback">Insira um um celular válido.
								</div>
							</div>

							<div class="col-sm-6 mb-3">
								<input type="password" class="form-control" id="senha"
									placeholder="Nova senha" name="senha" required>
								<div class="invalid-feedback">Insira uma senha válida.</div>
							</div>

						</div>
						<button class="w-100 btn btn-primary btn-lg" type="submit">Cadastre-se</button>
					</form>

				</div>

			</div>
		</div>
	</div>
	<!-- fim do modal -->



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