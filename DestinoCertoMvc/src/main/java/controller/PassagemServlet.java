package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itextpdf.awt.geom.Rectangle;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.FontFactory;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

import dao.ClienteDAO;
import dao.PassagemDAO;
import dao.ReservaDAO;
import model.Cliente;
import model.Passagem;
import model.Reserva;

@WebServlet({ "/passagem", "/passagem-create", "/passagem-edit", "/passagem-update", "/passagem-delete",
		"/passagem-getCreate", "/report" })
public class PassagemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public PassagemServlet() {
		super();
	}

	Passagem passagem = new Passagem();
	PassagemDAO passagemDAO = new PassagemDAO();
	Reserva reserva = new Reserva();
	Cliente cliente = new Cliente();
	ClienteDAO clienteDAO = new ClienteDAO();
	ReservaDAO reservaDAO = new ReservaDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getServletPath();

		switch (action) {

		case "/passagem":
			read(request, response);
			break;

		case "/passagem-create":
			create(request, response);
			break;

		case "/passagem-edit":
			edit(request, response);
			break;

		case "/passagem-delete":
			delete(request, response);
			break;

		case "/passagem-getCreate":
			getCreate(request, response);
			break;

		case "/passagem-update":
			update(request, response);

			break;

		case "/report":
			gerarPassagem(request, response);

			break;

		default:
			response.sendRedirect("/index.jsp");
			break;
		}
	}

	protected void create(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Cliente cliente = clienteDAO.readById(Integer.parseInt(request.getParameter("id_cliente")));
		Reserva reserva = reservaDAO.readById(Integer.parseInt(request.getParameter("id_reserva")));

		Double preco = passagem.setPreco(Double.parseDouble(request.getParameter("preco")));

		int assento = Integer.parseInt(request.getParameter("assento"));

		passagem = new Passagem(preco, new Date(), assento, reserva, cliente);

		passagemDAO.save(passagem);
		response.sendRedirect("passagem");

	}

	protected void getCreate(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//		List<Cliente> listaClientes = clienteDAO.getClientes();
//		request.setAttribute("listaClientes", listaClientes);
//		
//		List<Reserva> listaReservas = reservaDAO.getReservas();
//		request.setAttribute("listaReservas", listaReservas);

		reserva = reservaDAO.readById(Integer.parseInt(request.getParameter("id_reserva")));
		request.setAttribute("reserva", reserva);

		RequestDispatcher rd = request.getRequestDispatcher("./views/passagens/passagem.jsp");
		rd.forward(request, response);

	}

	protected void read(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// fiz uma view nesse método listasTpodasPassagens
		List<Passagem> lista = passagemDAO.listarTodasPassagens();

		// fk aqui?

		request.setAttribute("listaPassagens", lista);

		RequestDispatcher rd = request.getRequestDispatcher("./views/passagens/index.jsp");
		rd.forward(request, response);
	}

	protected void edit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id_passagem")); // verificar esse id

		passagem = passagemDAO.readById(id);

		request.setAttribute("passagem", passagem);

		List<Cliente> listaClientes = clienteDAO.getClientes();
		request.setAttribute("listaClientes", listaClientes);

		List<Reserva> listaReservas = reservaDAO.getReservas();
		request.setAttribute("listaReservas", listaReservas);

		RequestDispatcher rd = request.getRequestDispatcher("./views/passagens/index.jsp");
		rd.forward(request, response);
	}

	protected void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		passagem.setId_passagem(Integer.parseInt(request.getParameter("id_passagem")));
		passagem.setPreco(Double.parseDouble(request.getParameter("preco")));
		passagem.setAssento(Integer.parseInt(request.getParameter("assento")));

//		coloquei FK reserva
		passagem.setCliente(clienteDAO.readById(Integer.parseInt(request.getParameter("cliente"))));
		passagem.setReserva(reservaDAO.readById(Integer.parseInt(request.getParameter("reserva"))));

		String dataEmissaoStr = request.getParameter("data_emissao");

		SimpleDateFormat sdfDataEmissao = new SimpleDateFormat("yyyy-MM-dd");
		try {
			Date dataEmissao = sdfDataEmissao.parse(dataEmissaoStr);
			passagem.setData_emissao(dataEmissao);

		} catch (Exception e) {
		}

		passagemDAO.update(passagem);
		response.sendRedirect("passagem");

	}

	protected void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id_passagem"));

		passagemDAO.removeById(id);

		response.sendRedirect("passagem");
	}

	// Gerar passagem em PDF
	protected void gerarPassagem(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    int passagemId = Integer.parseInt(request.getParameter("id_passagem")); // Obtenha o ID da passagem

	    Document documento = new Document();

	    try {
	        // Configurar o tipo de conteúdo
	        response.setContentType("application/pdf");

	        // Definir o nome do documento
	        response.addHeader("Content-Disposition", "inline; filename=passagem.pdf");

	        // Criar o documento
	        PdfWriter.getInstance(documento, response.getOutputStream());

	        // Abrir o documento para gerar o conteúdo
	        documento.open();

	        // Adicionar um logotipo ou imagem
	        Image logo = Image.getInstance(getServletContext().getRealPath("src/imagens/destinoCertoLogo.png"));

	        logo.setAlignment(Element.ALIGN_CENTER);
	        logo.scaleAbsolute(100, 50); // Ajuste o tamanho da imagem conforme necessário
	        documento.add(logo);

	        // Adicionar um título
	        Font titleFont = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 24, BaseColor.BLACK);
	        Paragraph title = new Paragraph("Passagem Aérea", titleFont);
	        title.setAlignment(Element.ALIGN_CENTER);
	        title.setSpacingAfter(10);
	        documento.add(title);

	        // Configurar a fonte para o texto
	        Font font = FontFactory.getFont(FontFactory.HELVETICA_BOLD, 12, BaseColor.BLACK);

	        // Crie uma tabela para o layout personalizado
	        PdfPTable tabela = new PdfPTable(2); // 2 colunas
	        tabela.setWidthPercentage(100);

	        // Adicione bordas à tabela
	        tabela.getDefaultCell().setBorder(PdfPCell.BOX);

	        // Configure a cor de fundo das células do título
	        tabela.getDefaultCell().setBackgroundColor(BaseColor.GRAY);

	        // Defina a fonte para o título
	        tabela.getDefaultCell().setHorizontalAlignment(Element.ALIGN_CENTER);
	        tabela.getDefaultCell().setColspan(2);

	        // Buscar a passagem com o ID especificado
	        Passagem passagem = passagemDAO.readPassagemById(passagemId);

	        // Célula 1 - Cliente
	        PdfPCell cellCliente = new PdfPCell(new Phrase("Cliente: " + passagem.getCliente().getNome(), font));
	        cellCliente.setBorder(PdfPCell.NO_BORDER);

	        // Célula 2 - Data de Emissão
	        PdfPCell cellDataEmissao = new PdfPCell(new Phrase("Data de Emissão: " + passagem.getData_emissao(), font));
	        cellDataEmissao.setBorder(PdfPCell.NO_BORDER);

	        // Célula 3 - Preço
	        PdfPCell cellPreco = new PdfPCell(new Phrase("Preço: R$" + passagem.getPreco(), font));
	        cellPreco.setBorder(PdfPCell.NO_BORDER);

	        // Célula 4 - Data de Partida
	        PdfPCell cellDataPartida = new PdfPCell(
	                new Phrase("Data de Partida: " + passagem.getReserva().getData_partida(), font));
	        cellDataPartida.setBorder(PdfPCell.NO_BORDER);

	        // Célula 5 - Data de Retorno
	        PdfPCell cellDataRetorno = new PdfPCell(
	                new Phrase("Data de Retorno: " + passagem.getReserva().getData_chegada(), font));
	        cellDataRetorno.setBorder(PdfPCell.NO_BORDER);

	        // Célula 6 - Origem
	        PdfPCell cellOrigem = new PdfPCell(new Phrase("Origem: " + passagem.getReserva().getOrigem(), font));
	        cellOrigem.setBorder(PdfPCell.NO_BORDER);

	        // Célula 7 - Destino
	        PdfPCell cellDestino = new PdfPCell(new Phrase("Destino: " + passagem.getReserva().getDestino(), font));
	        cellDestino.setBorder(PdfPCell.NO_BORDER);

	        // Célula 8 - Assento
	        PdfPCell cellAssento = new PdfPCell(new Phrase("Assento: " + passagem.getAssento(), font));
	        cellAssento.setBorder(PdfPCell.NO_BORDER);

	        // Adicione as células à tabela na ordem desejada
	        tabela.addCell(cellCliente);
	        tabela.addCell(cellDataPartida);
	        tabela.addCell(cellOrigem);
	        tabela.addCell(cellDataRetorno);
	        tabela.addCell(cellDestino);
	        tabela.addCell(cellAssento);
	        tabela.addCell(cellDataEmissao);
	        tabela.addCell(cellPreco);

	        // Adicione a tabela ao documento
	        documento.add(tabela);

	        documento.close();

	    } catch (Exception e) {
	        e.printStackTrace();
	        documento.close();
	    }
	}

	
	

}
