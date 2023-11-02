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
  <link rel="stylesheet" href="src/styles/destino.css">
  <link rel="stylesheet" href="src/styles/mediaquery.css">
  <script src="https://unpkg.com/@phosphor-icons/web"></script>
  <title>Destino Certo - Destinos</title>
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
					<jsp:param name="promocoes" value="./promocoes.html" />
					<jsp:param name="contato" value="./contato.jsp" />
					<jsp:param name="reservas" value="./reserva" />
					<jsp:param name="passagens" value="./passagem" />
					<jsp:param name="clientes" value="./cliente" />
					<jsp:param name="entrar" value="./entrar.jsp" />
				</jsp:include>
				
			</div>
		</nav>
	</header>
  
  <main>
    <div class="position-relative overflow-hidden text-center ">
      <img class="capinha card-img-top" src="src/imagens/capa00.jpg"
        alt="Imagem de uma estrada longa e vazia, com céu alaranjado anoitecendo ao fundo.">
      <div class="col-md-5 p-lg-3 mx-auto my-0">
        <h3 class="display-4 font-weight-normal">Nossos destinos!</h3>
        <p class="lead font-weight-normal">Destinos nacionais mais pesquisados.</p>
        <a class="btn btn-outline-secondary" href="destinos.jsp#destinos">Saiba mais</a>
      </div>
    </div>

    <div class="album py-5 bg-light" id="destinos">
      <div class="container">
        <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
          <div class="col">
            <div class="card shadow-sm h-100">
              <img class="bd-placeholder-img card-img-top" width="100%" title="Rio de Janeiro" src="src/imagens/rio-0.webp"
                alt="Imagem do Rio de Janeiro">
              <div class="card-body">
                <h5>Rio de Janeiro</h5>
                <h3>R$ 736</h3>
                <p class="card-text">Visite a cidade maravilhosa por um preço promocional. Descubra o Rio de Janeiro,
                  uma cidade deslumbrante no Brasil, com praias famosas, montanhas icônicas e cultura vibrante.</p>
                <div class="d-flex justify-content-between align-items-center">
                  <div class="btn-group">
                    <a class="btn btn-primary"
                      href="./reserva">Reservar</a>
                  </div>
                  <small class="text-muted">Em até 12x</small>
                </div>
              </div>
            </div>
          </div>

          <div class="col">
            <div class="card shadow-sm h-100">
              <img class="bd-placeholder-img card-img-top" width="100%" title="Bonito" src="src/imagens/bonito-1.webp" alt="Imagem de Bonito">
              <div class="card-body">
                <h5>Bonito</h5>
                <h3>R$ 1.129</h3>
                <p class="card-text">Encante-se com Bonito, um paraíso natural no coração do Brasil. Com suas águas cristalinas, grutas misteriosas e rica biodiversidade, é um destino imperdível para os amantes do ecoturismo.</p>
                <div class="d-flex justify-content-between align-items-center">
                  <div class="btn-group">
                    <a class="btn btn-primary" 
                      href="./reserva">Reservar</a>
                  </div>
                  <small class="text-muted">Em até 12x</small>
                </div>
              </div>
            </div>
          </div>

          <div class="col">
            <div class="card shadow-sm h-100">
              <img class="bd-placeholder-img card-img-top" width="100%" title="Maceió" src="src/imagens/maceio-2.webp" alt="Imagem de Maceió">
              <div class="card-body">
                <h5>Maceió</h5>
                <h3>R$ 396</h3>
                <p class="card-text">Descubra a beleza de Maceió, uma cidade costeira deslumbrante no nordeste do Brasil. Suas praias paradisíacas de areias brancas e águas cristalinas convidam a relaxar e desfrutar do sol.</p>
                <div class="d-flex justify-content-between align-items-center">
                  <div class="btn-group">
                    <a class="btn btn-primary" 
                      href="./reserva">Reservar</a>
                  </div>
                  <small class="text-muted">Em até 12x</small>
                </div>
              </div>
            </div>
          </div>
     
          <div class="col">
            <div class="card shadow-sm h-100">
              <img class="bd-placeholder-img card-img-top" width="100%" title="São Paulo" src="src/imagens/sp-3.webp" alt="Imagem de São Paulo">
              <div class="card-body">
                <h5>São Paulo</h5>
                <h3>R$ 401</h3>
                <p class="card-text">Explore a metrópole de São Paulo, o coração econômico e cultural do Brasil. Com arquitetura impressionante, museus de renome, cativa os visitantes com energia única.</p>
                <div class="d-flex justify-content-between align-items-center">
                  <div class="btn-group">
                    <a class="btn btn-primary" 
                      href="./reserva">Reservar</a>
                  </div>
                  <small class="text-muted">Em até 12x</small>
                </div>
              </div>
            </div>
          </div>

          <div class="col">
            <div class="card shadow-sm h-100">
              <img class="bd-placeholder-img card-img-top" width="100%" title="Foz do Iguaçu" src="src/imagens/foziguacu-4.webp" alt="Imagem de Foz do Iguaçu">
              <div class="card-body">
                <h5>Foz do Iguaçu</h5>
                <h3>R$ 582</h3>
                <p class="card-text">Encante-se com a deslumbrante Foz do Iguaçu, um destino incrível. Conhecida por suas Cataratas do Iguaçu, uma das maravilhas do mundo, oferece uma experiência única.</p>
                <div class="d-flex justify-content-between align-items-center">
                  <div class="btn-group">
                    <a class="btn btn-primary" 
                      href="./reserva">Reservar</a>
                  </div>
                  <small class="text-muted">Em até 12x</small>
                </div>
              </div>
            </div>
          </div>

          <div class="col">
            <div class="card shadow-sm h-100">
              <img class="bd-placeholder-img card-img-top" width="100%" title="Salvador" src="src/imagens/salvador-5.webp" alt="Imagem de Salvador">
              <div class="card-body">
                <h5>Salvador</h5>
                <h3>R$ 353</h3>
                <p class="card-text">Descubra a herança cultural e histórica de Salvador, uma cidade fascinante no nordeste do Brasil. Com ruas coloridas de paralelepípedos, igrejas barrocas e vibrante vida, um tesouro cultural.</p>
                <div class="d-flex justify-content-between align-items-center">
                  <div class="btn-group">
                    <a class="btn btn-primary" 
                      href="./reserva">Reservar</a>
                  </div>
                  <small class="text-muted">Em até 12x</small>
                </div>
              </div>
            </div>
          </div>

          <div class="col">
            <div class="card shadow-sm h-100">
              <img class="bd-placeholder-img card-img-top" width="100%" title="Caxias do Sul" src="src/imagens/caxias.jpg" alt="Imagem de Caxias do Sul">
              <div class="card-body">
                <h5>Caxias do Sul</h5>
                <h3>R$ 629</h3>
                <p class="card-text">Caxias do Sul é uma cidade acolhedora no estado do Rio Grande do Sul, Brasil. Conhecida por sua rica cultura italiana, indústria metalúrgica, gastronomia deliciosa e belas paisagens na Serra Gaúcha.</p>
                <div class="d-flex justify-content-between align-items-center">
                  <div class="btn-group">
                    <a class="btn btn-primary" 
                      href="./reserva">Reservar</a>
                  </div>
                  <small class="text-muted">Em até 12x</small>
                </div>
              </div>
            </div>
          </div>

          <div class="col">
            <div class="card shadow-sm h-100">
              <img class="bd-placeholder-img card-img-top" width="100%" title="Porto Seguro" src="src/imagens/porto-seguro.jpg" alt="Imagem de Porto Seguro">
              <div class="card-body">
                <h5>Porto Seguro</h5>
                <h3>R$ 461</h3>
                <p class="card-text">Porto Seguro é um destino paradisíaco no sul da Bahia, Brasil. Suas praias deslumbrantes, vida noturna agitada, cultura histórica e festivais animados a tornam um local imperdível para turistas de todas as idades.</p>
                <div class="d-flex justify-content-between align-items-center">
                  <div class="btn-group">
                    <a class="btn btn-primary" 
                      href="./reserva">Reservar</a>
                  </div>
                  <small class="text-muted">Em até 12x</small>
                </div>
              </div>
            </div>
          </div>

          <div class="col">
            <div class="card shadow-sm h-100">
              <img class="bd-placeholder-img card-img-top" width="100%" title="Londrina" src="src/imagens/londrina.jpg" alt="Imagem de Londrina">
              <div class="card-body">
                <h5>Londrina</h5>
                <h3>R$ 626</h3>
                <p class="card-text">Cidade encantadora do estado do Paraná. Conhecida por sua infraestrutura moderna, parques arborizados, vida cultural diversificada, gastronomia rica e espírito empreendedor. Um lugar acolhedor para visitar.</p>
                <div class="d-flex justify-content-between align-items-center">
                  <div class="btn-group">
                    <a class="btn btn-primary" 
                      href="./reserva">Reservar</a>
                  </div>
                  <small class="text-muted">Em até 12x</small>
                </div>
              </div>
            </div>
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
      <a href="contato.jsp">Fale Conosco</a>
      <a href="promocoes.jsp">Black Friday</a>
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