package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ContatoDAO;
import model.Contato;

@WebServlet(urlPatterns = { "/contato", "/contato-read", "/contato-delete"})
public class ContatoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	Contato contato = new Contato();
	ContatoDAO contatoDAO = new ContatoDAO();

	public ContatoServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getServletPath();

		switch (action) {

		case "/contato":
			create(request, response);
			break;
			
		case "/contato-read":
			read(request, response);
			break;
			
		case "/contato-delete":
			delete(request, response);
			break;

		default:
			response.sendRedirect("/index.jsp");
			break;
		}
	}

	protected void create(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		contato.setNome(request.getParameter("nome"));
		contato.setEmail(request.getParameter("email"));
		contato.setMensagem(request.getParameter("mensagem"));

		contatoDAO.save(contato);

		request.setAttribute("mensagem", "Mensagem enviada com sucesso");
		
		response.sendRedirect("contato-read");

	}
	
	protected void read(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Contato> lista = contatoDAO.getContatos();

		request.setAttribute("listaContatos", lista);

		RequestDispatcher rd = request.getRequestDispatcher("./views/contatos/index.jsp");
		rd.forward(request, response);
	}
	
	protected void delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int id = Integer.parseInt(request.getParameter("id_contato"));
		contatoDAO.delete(id);
		response.sendRedirect("contato-read");
	}
	

}
