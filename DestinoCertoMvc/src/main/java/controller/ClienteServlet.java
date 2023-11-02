package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ClienteDAO;
import model.Cliente;

@WebServlet(urlPatterns = { "/cliente", "/cliente-create", "/cliente-edit", "/cliente-update", "/cliente-delete" })
public class ClienteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Cliente cliente = new Cliente();
	ClienteDAO clienteDAO = new ClienteDAO();

	public ClienteServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getServletPath();

		switch (action) {

		case "/cliente":
			read(request, response);
			break;

		case "/cliente-create":
			create(request, response);
			break;
			
		case "/cliente-edit":
			edit(request, response);
			break;
			
		case "/cliente-update":
			update(request, response);
			break;

		case "/cliente-delete":
			delete(request, response);
			break;

		default:
			response.sendRedirect("/index.jsp");
			break;
		}

	}

	protected void read(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Cliente> lista = clienteDAO.getClientes();

		request.setAttribute("listaClientes", lista);

		RequestDispatcher rd = request.getRequestDispatcher("./views/clientes/index.jsp");
		rd.forward(request, response);
	}

	protected void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int id = Integer.parseInt(request.getParameter("id_cliente"));
		clienteDAO.deleteById(id);

		response.sendRedirect("cliente");
	}

	protected void create(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		cliente.setNome(request.getParameter("nome"));
		cliente.setEmail(request.getParameter("email"));
		cliente.setTelefone(request.getParameter("telefone"));
		cliente.setSenha(request.getParameter("senha"));

		clienteDAO.save(cliente);
		response.sendRedirect("cliente");
	}
	
	protected void edit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id_cliente")); //verificar
		cliente = clienteDAO.readById(id);
		
		request.setAttribute("cliente", cliente);
		
		RequestDispatcher rd = request.getRequestDispatcher("./views/clientes/update.jsp");
		rd.forward(request, response);
	}
	
	protected void update(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		cliente.setId_cliente(Integer.parseInt(request.getParameter("id_cliente")));
		cliente.setNome(request.getParameter("nome"));
		cliente.setEmail(request.getParameter("email"));
		cliente.setTelefone(request.getParameter("telefone"));
		cliente.setSenha(request.getParameter("senha"));

		clienteDAO.update(cliente);
		response.sendRedirect("cliente");
		
	}

}