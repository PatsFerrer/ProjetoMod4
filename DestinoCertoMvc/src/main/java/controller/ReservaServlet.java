package controller;

import java.io.IOException;
import java.text.ParseException;
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
import dao.ReservaDAO;
import model.Cliente;
import model.Reserva;

@WebServlet(urlPatterns = { "/reserva", "/reserva-create", "/reserva-edit", "/reserva-update", "/reserva-delete" })
public class ReservaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	ReservaDAO reservaDAO = new ReservaDAO();
	Reserva reserva = new Reserva();
	ClienteDAO clienteDAO = new ClienteDAO();

	public ReservaServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getServletPath();

		switch (action) {
		case "/reserva":
			read(request, response);
			break;

		case "/reserva-create":
			create(request, response);
			break;

		case "/reserva-delete":
			delete(request, response);
			break;

		default:
			response.sendRedirect("index.jsp");
			break;
		}
	}

	protected void read(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		List<Reserva> lista = reservaDAO.getReservas();

		request.setAttribute("listaReservas", lista);

		RequestDispatcher rd = request.getRequestDispatcher("./src/views/reserva.jsp");
		rd.forward(request, response);
	}

//	protected void create(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	    
//	    reserva.setOrigem(request.getParameter("origem"));
//	    reserva.setDestino(request.getParameter("destino"));
//	    reserva.setCliente(request.getParameter("id_cliente"));
//	    
//	    String dataPartidaStr = request.getParameter("data-ida");
//	    String dataChegadaStr = request.getParameter("data-volta");
//	    
//	    SimpleDateFormat sdfDataPartida = new SimpleDateFormat("yyyy-MM-dd");
//	    SimpleDateFormat sdfDataChegada = new SimpleDateFormat("yyyy-MM-dd");
//	    
//	    try {
//	    	Date dataPartida = sdfDataPartida.parse(dataPartidaStr);
//	        reserva.setData_partida(dataPartida);
//	        
//	        Date dataChegada = sdfDataChegada.parse(dataChegadaStr);
//	        reserva.setData_chegada(dataChegada);
//	    } catch (ParseException e) {
//	    	 e.printStackTrace();
//	    }
//	    
//	    reservaDAO.save(reserva);
//	    response.sendRedirect("reserva");
//	}

	protected void create(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		reserva.setOrigem(request.getParameter("origem"));
		reserva.setDestino(request.getParameter("destino"));

		// Recupere o ID do cliente da solicitação
		String clienteId = request.getParameter("id_cliente");

		// Verifique se o ID do cliente não é nulo

		// Converta o ID do cliente para um inteiro
		try {
			int clienteIdInt = Integer.parseInt(clienteId);

			// Agora, você precisa recuperar o objeto Cliente com base no ID
			Cliente cliente = clienteDAO.readById(clienteIdInt);

			// Defina o cliente na reserva
			reserva.setCliente(cliente);

			// Restante do seu código para definir as datas e salvar a reserva
			String dataPartidaStr = request.getParameter("data-ida");
			String dataChegadaStr = request.getParameter("data-volta");

			SimpleDateFormat sdfDataPartida = new SimpleDateFormat("yyyy-MM-dd");
			SimpleDateFormat sdfDataChegada = new SimpleDateFormat("yyyy-MM-dd");

			try {
				Date dataPartida = sdfDataPartida.parse(dataPartidaStr);
				reserva.setData_partida(dataPartida);

				Date dataChegada = sdfDataChegada.parse(dataChegadaStr);
				reserva.setData_chegada(dataChegada);

				reservaDAO.save(reserva);
				response.sendRedirect("reserva");
			} catch (ParseException e) {
				e.printStackTrace();
			}

		} catch (NumberFormatException e) {
			// Lidar com o caso em que o ID do cliente não é um número válido
			// Por exemplo, redirecione para uma página de erro ou exiba uma mensagem de
			// erro.
		}

	}

	protected void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id_reserva"));
		reservaDAO.deleteById(id);
		response.sendRedirect("reserva");
	}

}
