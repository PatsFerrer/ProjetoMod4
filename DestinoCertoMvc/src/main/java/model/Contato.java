package model;

import java.util.Scanner;

import dao.ContatoDAO;

public class Contato {

    private String nome;
    private String email;
    private String mensagem;

    public Contato() {

    }

    public Contato(String nome, String email, String mensagem) {
        this.nome = nome;
        this.email = email;
        this.mensagem = mensagem;
    }

	public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMensagem() {
        return mensagem;
    }

    public void setMensagem(String mensagem) {
        this.mensagem = mensagem;
    }
    
       
    public static void entrarEmContato(Scanner scanner, ContatoDAO contatoDAO) {
        System.out.println("Digite seu nome:");
        String nome = scanner.nextLine();

        System.out.println("Digite seu email:");
        String email = scanner.nextLine();

        System.out.println("Digite sua mensagem:");
        String mensagem = scanner.nextLine();

        try {
            Contato contato = new Contato(nome, email, mensagem);

            contatoDAO.save(contato);

            System.out.println("Mensagem enviada com sucesso!");
            
        } catch (Exception e) {
        	
            e.printStackTrace();
            System.out.println("Ocorreu um erro ao processar o contato.");
        }
    }  
}