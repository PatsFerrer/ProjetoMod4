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

import dao.ClienteDAO;
import dao.PassagemDAO;
import dao.ReservaDAO;
import model.Cliente;
import model.Passagem;
import model.Reserva;

@WebServlet({ "/passagem", "/passagem-create", "/passagem-edit", "/passagem-update", "/passagem-delete",
		"/passagem-getCreate" })
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

}
