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
<script src="https://unpkg.com/@phosphor-icons/web"></script>
<title>Destino Certo - Home</title>
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
					<jsp:param name="passagens" value="./passagem" />
					<jsp:param name="clientes" value="./cliente" />
					<jsp:param name="entrar" value="./entrar.jsp" />
				</jsp:include>
				

			</div>
		</nav>
	</header>


	<div id="carouselExampleCaptions" class="carousel slide carousel-fade">

		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="0" class="active" aria-current="true"
				aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="1" aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleCaptions"
				data-bs-slide-to="2" aria-label="Slide 3"></button>
		</div>

		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="src/imagens/capa1.jpg" class="d-block w-100"
					alt="Imagem de tr�s pessoas viajando com mochilas nas costas, elas est�o paradas e bebendo �gua.">
				<div class="carousel-caption d-none d-md-block">
					<h5>Explore lugares inesquec�veis</h5>
					<p>Economize muito com as melhores ofertas de viagens.</p>
				</div>
			</div>

			<div class="carousel-item">
				<img src="src/imagens/capa01.jpg" class="d-block w-100"
					alt="Imagem de uma estrada com montanhas congeladas � esquerda e um lago � direita numa noite com c�u alaranjado.">
				<div class="carousel-caption d-none d-md-block">
					<h5>Aventuras incr�veis come�am aqui</h5>
					<p>Viagens que despertam a sua alma e enriquecem a sua mente.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="src/imagens/capa4.jpg" class="d-block w-100"
					alt="Imagem de um homem caminhando pelo campo de mochila nas costas, com um avi�o voando ao fundo.">
				<div class="carousel-caption d-none d-md-block">
					<h5>Descubra o encanto do mundo</h5>
					<p>Viagens que criam mem�rias duradouras.</p>
				</div>
			</div>
		</div>

		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleCaptions" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>

		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleCaptions" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>

	</div>

	<main>
		<section class="container my-4">
			<h1 class="display-4 font-weight-normal text-center">Busque o
				seu Destino Certo!</h1>
		</section>

		<div class="album py-5 bg-light">
			<div class="container">
				<div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
					<div class="col">
						<div class="card shadow-sm h-100">
							<img class="bd-placeholder-img card-img-top" width="100%"
								title="Recife" src="src/imagens/recife-pe.jpg"
								alt="Imagem do Recife">
							<div class="card-body">
								<h5>Recife</h5>
								<small>Apenas Ida</small>
								<h3>R$ 256</h3>
								<p class="card-text">Encantadora cidade costeira no nordeste
									do Brasil, oferecendo praias deslumbrantes, rica heran�a
									colonial, cultura diversificada, m�sica animada e uma cena
									gastron�mica deliciosa.</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<a class="btn btn-primary" href="./reserva">Reservar</a>
									</div>
									<small class="text-muted">Em at� 12x</small>
								</div>
							</div>
						</div>
					</div>

					<div class="col">
						<div class="card shadow-sm h-100">
							<img class="bd-placeholder-img card-img-top" width="100%"
								title="Natal" src="src/imagens/bonito-1.webp"
								alt="Imagem de Natal">
							<div class="card-body">
								<h5>Natal</h5>
								<small>Apenas Ida</small>
								<h3>R$ 328</h3>
								<p class="card-text">Natal � uma acolhedora cidade no
									nordeste do Brasil, conhecida por suas praias paradis�acas,
									dunas de areia, cultura folcl�rica, del�cias culin�rias t�picas
									e festivais animados.</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<a class="btn btn-primary" href="./reserva">Reservar</a>
									</div>
									<small class="text-muted">Em at� 12x</small>
								</div>
							</div>
						</div>
					</div>

					<div class="col">
						<div class="card shadow-sm h-100">
							<img class="bd-placeholder-img card-img-top" width="100%"
								title="Curitiba" src="src/imagens/curitibaa.jpg"
								alt="Imagem de Curitiba">
							<div class="card-body">
								<h5>Curitiba</h5>
								<small>Apenas Ida</small>
								<h3>R$ 358</h3>
								<p class="card-text">Curitiba, capital do Paran�, � uma
									cidade brasileira moderna e bem planejada. Conhecida por seus
									parques exuberantes, arquitetura inovadora, cultura rica,
									gastronomia diversificada e povo acolhedor.</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<a class="btn btn-primary" href="./reserva">Reservar</a>
									</div>
									<small class="text-muted">Em at� 12x</small>
								</div>
							</div>
						</div>
					</div>

					<div class="col">
						<div class="card shadow-sm h-100">
							<img class="bd-placeholder-img card-img-top" width="100%"
								title="Belo Horizonte" src="src/imagens/belo-horizonte.jpg"
								alt="Imagem de Belo Horizonte">
							<div class="card-body">
								<h5>Belo Horizonte</h5>
								<small>Apenas Ida</small>
								<h3>R$ 339</h3>
								<p class="card-text">Belo Horizonte, capital de Minas
									Gerais, encanta com sua arquitetura moderna, cultura rica e
									culin�ria deliciosa, destacando-se pelos bares e botecos
									t�picos da regi�o. Cidade vibrante e acolhedora.</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<a class="btn btn-primary" href="./reserva">Reservar</a>
									</div>
									<small class="text-muted">Em at� 12x</small>
								</div>
							</div>
						</div>
					</div>
					<div class="col">
						<div class="card shadow-sm h-100">
							<img class="bd-placeholder-img card-img-top" width="100%"
								title="Bel�m" src="src/imagens/belem.jpg" alt="Imagem de Bel�m">
							<div class="card-body">
								<h5>Bel�m</h5>
								<small>Apenas Ida</small>
								<h3>R$ 370</h3>
								<p class="card-text">Bel�m, situada na Amaz�nia brasileira,
									� uma cidade repleta de exotismo e beleza natural. Conhecida
									por sua rica hist�ria, gastronomia amaz�nica, mercados
									coloridos e festivais culturais envolventes.</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<a class="btn btn-primary" href="./reserva">Reservar</a>
									</div>
									<small class="text-muted">Em at� 12x</small>
								</div>
							</div>
						</div>
					</div>

					<div class="col">
						<div class="card shadow-sm h-100">
							<img class="bd-placeholder-img card-img-top" width="100%"
								title="Fernando de Noronha"
								src="src/imagens/fernandodenoronha.jpg"
								alt="Imagem de Fernando de Noronha">
							<div class="card-body">
								<h5>Fernando de Noronha</h5>
								<small>Apenas Ida</small>
								<h3>R$ 596</h3>
								<p class="card-text">Noronha � um para�so tropical no
									Brasil, famoso por suas praias de areias douradas, �guas
									cristalinas, vida marinha exuberante e preserva��o ambiental.
									Destino perfeito para mergulho.</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<a class="btn btn-primary" href="./reserva">Reservar</a>
									</div>
									<small class="text-muted">Em at� 12x</small>
								</div>
							</div>
						</div>
					</div>

					<div class="col">
						<div class="card shadow-sm h-100">
							<img class="bd-placeholder-img card-img-top" width="100%"
								title="Jericoacoara" src="src/imagens/jericoacoara.jpg"
								alt="Imagem do Jericoacoara">
							<div class="card-body">
								<h5>Jericoacoara</h5>
								<small>Apenas Ida</small>
								<h3>R$ 459</h3>
								<p class="card-text">Jericoacoara � um para�so escondido no
									nordeste do Brasil, com dunas imponentes, praias intocadas e
									lagoas de �guas cristalinas. Um destino paradis�aco para os
									amantes de natureza, esportes aqu�ticos e tranquilidade.</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<a class="btn btn-primary" href="./reserva">Reservar</a>
									</div>
									<small class="text-muted">Em at� 12x</small>
								</div>
							</div>
						</div>
					</div>

					<div class="col">
						<div class="card shadow-sm h-100">
							<img class="bd-placeholder-img card-img-top" width="100%"
								title="Alagoas" src="src/imagens/alagoas.jpg"
								alt="Imagem do Alagoas">
							<div class="card-body">
								<h5>Alagoas</h5>
								<small>Apenas Ida</small>
								<h3>R$ 396</h3>
								<p class="card-text">Alagoas � um estado encantador no
									nordeste do Brasil, conhecido por suas praias deslumbrantes de
									�guas mornas e coqueirais, recifes de corais, gastronomia rica
									e cultura folcl�rica cativante. Um destino tropical imperd�vel.</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<a class="btn btn-primary" href="./reserva">Reservar</a>
									</div>
									<small class="text-muted">Em at� 12x</small>
								</div>
							</div>
						</div>
					</div>

					<div class="col">
						<div class="card shadow-sm h-100">
							<img class="bd-placeholder-img card-img-top" width="100%"
								title="Imperatriz" src="src/imagens/imperatriz.jpg"
								alt="Imagem do Imperatriz">
							<div class="card-body">
								<h5>Imperatriz</h5>
								<small>Apenas Ida</small>
								<h3>R$ 422</h3>
								<p class="card-text">Imperatriz � uma cidade acolhedora no
									estado do Maranh�o, Brasil. Destaca-se por sua rica cultura,
									festivais animados, culin�ria t�pica, parques arborizados e
									proximidade com belezas naturais como rios e cachoeiras.</p>
								<div class="d-flex justify-content-between align-items-center">
									<div class="btn-group">
										<a class="btn btn-primary" href="./reserva">Reservar</a>
									</div>
									<small class="text-muted">Em at� 12x</small>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</main>

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