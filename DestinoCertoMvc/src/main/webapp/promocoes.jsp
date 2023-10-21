<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt-BR">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
  <link rel="stylesheet" href="src/styles/style.css">
  <link rel="stylesheet" href="src/styles/mediaquery.css">
  <script src="https://unpkg.com/@phosphor-icons/web"></script>
  <title>Destino Certo - Promoções</title>
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

  <main>

    <div class="position-relative overflow-hidden text-center ">
      <img class="capinha card-img-top" src="src/imagens/capa2.jpg"
        alt="Imagem de um homem parado de costas, com mochila de viagem observando as montanhas.">
      <div class="col-md-5 p-lg-3 mx-auto my-0">
        <h3 class="display-4 font-weight-normal">Explore o mundo!</h3>
        <p class="lead font-weight-normal">Nossas promoções internacionais.</p>
        <a class="btn btn-outline-secondary" href="promocoes.html#viagens">Saiba mais</a>
      </div>
    </div>

    <div class="row m-2" id="viagens">

      <div class="col-sm-6 mb-3 mb-sm-0">
        <div class="card h-100">
          <div class="card-body">
            <img class="card-img-top" src="src/imagens/uruguai.jpg" alt="Imagem de Uruguai">
            <h5 class="card-title m-0 text-center">Uruguai</h5>
            <small>a partir de:</small>
            <p class="h5 m-0 p-0 ">R$ 757</p>
            <small>Apenas Ida</small>

            <p class="card-text">O Uruguai é um destino cativante na América do Sul, conhecido por suas praias
              deslumbrantes, cidades históricas e cultura acolhedora. Explore a charmosa e querida capital, Montevidéu,
              com sua arquitetura colonial e vibrante vida noturna, ou relaxe nas belas praias de Punta del Este.
              Descubra a rica herança cultural do país através da música, dança e deliciosa culinária.</p>
            <a href="pagamento.html" class="btn btn-outline-secondary">Comprar</a>
          </div>
        </div>
      </div>

      <div class="col-sm-6">
        <div class="card h-100">
          <div class="card-body">
            <img class="card-img-top" src="src/imagens/londres.jpg" alt="Imagem de Londres">
            <h5 class="card-title m-0 text-center">Inglaterra</h5>
            <small>a partir de:</small>
            <p class="h5 m-0 p-0 ">R$ 2.304</p>
            <small>Apenas Ida</small>

            <p class="card-text">A Inglaterra é uma nação encantadora, repleta de história e cultura vibrante. Explore
              os icônicos pontos turísticos de Londres, como o Big Ben e o Buckingham Palace, mergulhe na rica história
              em Stonehenge e descubra pitorescas paisagens rurais em Cotswolds. Uma viagem para a Inglaterra é uma
              jornada inesquecível e maravilhosa para os amantes de arte e tradições milenares.</p>
            <a href="pagamento.html" class="btn btn-outline-secondary">Comprar</a>
          </div>
        </div>
      </div>
    </div>

    <div class="row m-2">
      <div class="col-sm-6 ">
        <div class="card h-100">
          <div class="card-body">
            <img class="card-img-top" src="src/imagens/argentina.jpg" alt="Imagem da Argentina">
            <h5 class="card-title m-0 text-center">Argentina</h5>
            <small>a partir de:</small>
            <p class="h5 m-0 p-0 ">R$ 985</p>
            <small>Apenas Ida</small>
            <p class="card-text">A Argentina é um país apaixonante na América do Sul, oferecendo uma mistura única de
              paisagens deslumbrantes, cultura rica e delícias gastronômicas. Explore a elegante cidade de Buenos Aires,
              famosa por seus tangos envolventes e arquitetura europeia. Deleite-se com a deliciosa carne assada e os renomados vinhos argentinos, enquanto desfruta da calorosa hospitalidade dos argentinos.</p>
            <a href="pagamento.html" class="btn btn-outline-secondary">Comprar</a>
          </div>
        </div>
      </div>
      <div class="col-sm-6">
        <div class="card h-100">
          <div class="card-body">
            <img class="card-img-top" src="src/imagens/chile.jpg" alt="Imagem do Chile">
            <h5 class="card-title m-0 text-center">Chile</h5>
            <small>a partir de:</small>
            <p class="h5 m-0 p-0 ">R$ 1.001</p>
            <small>Apenas Ida</small>
            <p class="card-text">O Chile é um país incomparável na América do Sul, abraçando uma diversidade de
              paisagens impressionantes. Descubra o incrível deserto do Atacama, o mais árido do mundo, com paisagens
              lunares e lagoas de sal. Explore majestosas montanhas dos Andes, ideais para esportes de inverno. Uma
              cultura rica e com um povo acolhedor, é uma experiência que cativa os viajantes em busca de uma incrível
              beleza natural.</p>
            <a href="pagamento.html" class="btn btn-outline-secondary">Comprar</a>
          </div>
        </div>
      </div>
    </div>
  </main>

  <footer>
    <img src="src/imagens/destinoCertoLogo.png" alt="Imagem da Logo da Destino Certo">
    <div class="compra-segura">
      <strong>COMPRA SEGURA</strong>
      <a href="pagamento.html">Pagamentos</a>
      <a href="contato.html">Fale Conosco</a>
      <a href="promocoes.html">Black Friday</a>
    </div>
    <div class="contato">
      <strong>CONTATO</strong>
      <span><i class="ph ph-phone"></i> 85 3232-3232</span>
      <span><i class="ph ph-at"></i> contato@destinocerto.com</span>
      <span><i class="ph ph-map-pin"></i> Rua 100 Destino, s/n</span>
    </div>
    <div class="redes-sociais">
      <strong>REDES SOCIAIS</strong>
      <div>
        <span>
          <a href="https://www.instagram.com/patsferrer/" target="_blank">
            <i class="ph ph-instagram-logo"></i>
          </a>
        </span>
        <span>
          <a href="#"><i class="ph ph-twitter-logo"></i></a>
        </span>
        <span>
          <a href="https://github.com/patsferrer" target="_blank"><i class="ph ph-github-logo"></i></a>
        </span>
      </div>
    </div>
  </footer>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
    crossorigin="anonymous"></script>
</body>
</html>