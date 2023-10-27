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

		// Recupere o ID do cliente da solicitação
		String clienteId = request.getParameter("id_cliente");


		// Converta o ID do cliente para um inteiro
		try {
			int clienteIdInt = Integer.parseInt(clienteId);

			// Agora, você precisa recuperar o objeto Cliente com base no ID
			Cliente cliente = clienteDAO.readById(clienteIdInt);

			// Defina o cliente na reserva
			reserva.setCliente(cliente);

			// Restante do seu código para definir as datas e salvar a reserva
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
	
	
//	protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//	    // Recupere o ID da reserva da solicitação
//	    String reservaId = request.getParameter("id_reserva");
//
//	    if (reservaId != null && !reservaId.isEmpty()) {
//	        try {
//	            int reservaIdInt = Integer.parseInt(reservaId);
//
//	            // Agora, você precisa recuperar o objeto Reserva com base no ID
//	            Reserva reserva = reservaDAO.readById(reservaIdInt);
//
//	            // Recupere o ID do cliente da solicitação
//	            String clienteId = request.getParameter("id_cliente");
//
//	            if (clienteId != null && !clienteId.isEmpty()) {
//	                try {
//	                    int clienteIdInt = Integer.parseInt(clienteId);
//
//	                    // Agora, você precisa recuperar o objeto Cliente com base no ID
//	                    Cliente cliente = clienteDAO.readById(clienteIdInt);
//
//	                    // Restante do seu código para definir as datas e salvar a reserva
//	                    String dataPartidaStr = request.getParameter("data-ida");
//	                    String dataChegadaStr = request.getParameter("data-volta");
//
//	                    SimpleDateFormat sdfDataPartida = new SimpleDateFormat("yyyy-MM-dd");
//	                    SimpleDateFormat sdfDataChegada = new SimpleDateFormat("yyyy-MM-dd");
//
//	                    try {
//	                        Date dataPartida = sdfDataPartida.parse(dataPartidaStr);
//	                        Date dataChegada = sdfDataChegada.parse(dataChegadaStr);
//
//	                        // Agora, você pode configurar os detalhes da reserva
//	                        reserva.setOrigem(request.getParameter("origem"));
//	                        reserva.setDestino(request.getParameter("destino"));
//	                        reserva.setCliente(cliente);
//	                        reserva.setData_partida(dataPartida);
//	                        reserva.setData_chegada(dataChegada);
//
//	                        // Salve a reserva atualizada no banco de dados
//	                        reservaDAO.update(reserva);
//
//	                        // Redirecione para a página correta após a atualização
//	                        response.sendRedirect("reserva");
//
//	                    } catch (ParseException e) {
//	                        e.printStackTrace();
//	                    }
//
//	                } catch (NumberFormatException e) {
//	                    // Lidar com o caso em que o ID do cliente não é um número válido
//	                    // Por exemplo, redirecione para uma página de erro ou exiba uma mensagem de erro.
//	                }
//	            } else {
//	                // Lidar com o caso em que o parâmetro "id_cliente" está vazio ou nulo
//	                // Isso pode envolver redirecionar para uma página de erro ou exibir uma mensagem de erro.
//	            }
//	        } catch (NumberFormatException e) {
//	            // Lidar com o caso em que o ID da reserva não é um número válido
//	            // Por exemplo, redirecione para uma página de erro ou exiba uma mensagem de erro.
//	        }
//	    } else {
//	        // Lidar com o caso em que o parâmetro "id" está vazio ou nulo
//	        // Isso pode envolver redirecionar para uma página de erro ou exibir uma mensagem de erro.
//	    }
//	}
	
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




	
	
	//do cris
	
//	protected void update(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		
//		reserva.setId_reserva(Integer.parseInt(request.getParameter("id"))); //ver se aqui é id_reserva
//		
//		reserva.setOrigem(request.getParameter("origem"));
//		reserva.setDestino(request.getParameter("destino"));
//
//		// Recupere o ID do cliente da solicitação
//		String clienteId = request.getParameter("id_cliente");
//
//		// Verifique se o ID do cliente não é nulo
//
//		// Converta o ID do cliente para um inteiro
//		try {
//			int clienteIdInt = Integer.parseInt(clienteId);
//
//			// Agora, você precisa recuperar o objeto Cliente com base no ID
//			Cliente cliente = clienteDAO.readById(clienteIdInt);
//
//			// Defina o cliente na reserva
//			reserva.setCliente(cliente);
//
//			// Restante do seu código para definir as datas e salvar a reserva
//			String dataPartidaStr = request.getParameter("data-ida");
//			String dataChegadaStr = request.getParameter("data-volta");
//
//			SimpleDateFormat sdfDataPartida = new SimpleDateFormat("yyyy-MM-dd");
//			SimpleDateFormat sdfDataChegada = new SimpleDateFormat("yyyy-MM-dd");
//
//			try {
//				Date dataPartida = sdfDataPartida.parse(dataPartidaStr);
//				reserva.setData_partida(dataPartida);
//
//				Date dataChegada = sdfDataChegada.parse(dataChegadaStr);
//				reserva.setData_chegada(dataChegada);
//
//				reservaDAO.update(reserva);
//				response.sendRedirect("reserva");
//			} catch (ParseException e) {
//				e.printStackTrace();
//			}
//
//		} catch (NumberFormatException e) {
//			// Lidar com o caso em que o ID do cliente não é um número válido
//			// Por exemplo, redirecione para uma página de erro ou exiba uma mensagem de
//			// erro.
//		}
//		
//	}

	
	
	
	
	
}
