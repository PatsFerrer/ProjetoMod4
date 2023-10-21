package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ClienteDAO;
import model.Cliente;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
  
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    ClienteDAO clienteDAO = new ClienteDAO();

	    String email = request.getParameter("email");
	    String senha = request.getParameter("senha");

	    Cliente cliente = clienteDAO.login(email, senha);

	    if (cliente != null) {
	        // Login bem-sucedido
	        // Você pode armazenar informações do cliente na sessão se necessário
	        request.getSession().setAttribute("cliente", cliente);
	        response.sendRedirect("views/reservas/reserva-create.jsp");
	        System.out.println("sucesso");
	    } else {
	        // Login inválido
	    	response.getWriter().println("Usuário ou senha inválidos!");
	    	
	        request.setAttribute("mensagemErro", "Email ou senha inválidos");
//	        RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
//	        dispatcher.forward(request, response);
	        System.out.println("nao");
	    }
	}


}
