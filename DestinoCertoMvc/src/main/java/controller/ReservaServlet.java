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

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	ReservaDAO reservaDAO = new ReservaDAO();
	Reserva reserva = new Reserva();
	ClienteDAO clienteDAO = new ClienteDAO();
	Cliente cliente = new Cliente();

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
			
		case "/reserva-edit":
			edit(request, response);
			break;
			
		case "/reserva-update":
			update(request, response);
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
		
		RequestDispatcher rd = request.getRequestDispatcher("./views/reservas/reserva.jsp");
		rd.forward(request, response);
	}


	protected void create(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		reserva.setOrigem(request.getParameter("origem"));
		reserva.setDestino(request.getParameter("destino"));

		String clienteId = request.getParameter("id_cliente");

		try {
			int clienteIdInt = Integer.parseInt(clienteId);

			Cliente cliente = clienteDAO.readById(clienteIdInt);

			reserva.setCliente(cliente);

			String dataPartidaStr = request.getParameter("data-partida");
			String dataChegadaStr = request.getParameter("data-chegada");

			try {
				Date dataPartida = sdf.parse(dataPartidaStr);
				reserva.setData_partida(dataPartida);

				Date dataChegada = sdf.parse(dataChegadaStr);
				reserva.setData_chegada(dataChegada);

				reservaDAO.save(reserva);
				response.sendRedirect("reserva");
			} catch (ParseException e) {
				e.printStackTrace();
			}

		} catch (NumberFormatException e) {
			System.out.println(e);
		}

	}

	protected void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id_reserva"));
		reservaDAO.deleteById(id);
		response.sendRedirect("reserva");
	}
	
	
	
	protected void edit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id_reserva"));
		reserva = reservaDAO.readById(id); 
		
		reserva.setOrigem(request.getParameter("origem"));
		reserva.setDestino(request.getParameter("destino"));
		String dataPartida = request.getParameter("data-partida");
		String dataChegada = request.getParameter("data-chegada");
		
		try {
			reserva.setData_partida(sdf.parse(dataPartida));
			reserva.setData_chegada(sdf.parse(dataChegada));

			reservaDAO.update(reserva);
			response.sendRedirect("reserva");
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("./reserva");
		rd.forward(request, response);
		
		
	}
	
	
	protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	   
		reserva.setId_reserva(Integer.parseInt(request.getParameter("id_reserva")));
		reserva.setCliente(clienteDAO.readById(Integer.parseInt(request.getParameter("id_cliente"))));
		reserva.setOrigem(request.getParameter("origem"));
		reserva.setDestino(request.getParameter("destino"));

		try {
			    reserva.setData_partida(sdf.parse(request.getParameter("data-partida")));
			    reserva.setData_chegada(sdf.parse(request.getParameter("data-chegada")));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
	    reservaDAO.update(reserva);
	    response.sendRedirect("reserva");
	    
	}

}
