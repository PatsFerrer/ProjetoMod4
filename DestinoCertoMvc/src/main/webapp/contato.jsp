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


				<!-- editar aqui, adicionar os caminhois -->
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

  <div class="position-relative overflow-hidden">
    <img class="capinha card-img-top mb-3" src="src/imagens/capa3.jpg"
      alt="Imagem de uma mo�a vestindo um kimono oriental, com um guarda-chuva, em cima de uma montanha, com uma cachoeira ao fundo.">
    <div class="text-center">
      <h2 class="display-5">INFORMA��O E CONTATO</h2>
      <p class="lead">D�vidas? Nos envie uma mensagem.</p>
    </div>

    <div class="container">
      <div class="row">
        <div class="col-md col-lg">
          <form class="needs-validation" novalidate>
            <div class="row g-3">
              <div class="col-sm-6">
                <label for="firstName" class="form-label">Nome</label>
                <input type="text" class="form-control" id="firstName" placeholder="" value="" required>
                <div class="invalid-feedback">
                  Nome v�lido � obrigat�rio.
                </div>
              </div>
              <div class="col-sm-6">
                <label for="lastName" class="form-label">Sobrenome</label>
                <input type="text" class="form-control" id="lastName" placeholder="" value="" required>
                <div class="invalid-feedback">
                  Sobrenome v�lido � obrigat�rio.
                </div>
              </div>
              <div class="col-12">
                <label for="email" class="form-label">E-mail</label>
                <input type="email" class="form-control" id="email" placeholder="nome@exemplo.com">
                <div class="invalid-feedback">
                  Insira um endere�o de e-mail v�lido.
                </div>
              </div>
              <div class="mb-3">
                <label for="exampleFormControlTextarea1" class="form-label">Mensagem</label>
                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
              </div>
            </div>
            <button class="w-100 btn btn-primary btn-lg" type="button" data-bs-toggle="modal" data-bs-target="#exampleModal">Enviar</button>
          </form>
          <hr class="my-4">
          <p class="text-center display-6">Atendimento nos dias �teis, das 9 �s 18h:</p>
          <p class="text-center lead">SAC: (85) 3232-3232</p>
          <p class="text-center lead">Whatsapp: (85) 98758-5885</p>
          <p class="text-center lead">contato@destinocerto.com</p>
        </div>
      </div>
    </div>

    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
                    aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Mensagem enviada!</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                Agora � s� aguardar. <br> Voc� receber� uma resposta no seu e-mail cadastrado.
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Ok</button>
                            </div>

                        </div>
                    </div>
                </div>

  </div>

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