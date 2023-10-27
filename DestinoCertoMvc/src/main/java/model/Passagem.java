package model;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Scanner;

import dao.PassagemDAO;
import dao.ReservaDAO;

public class Passagem {
	private int id_passagem;
    private double preco;
    private Date data_emissao;
    private int assento;
    
    private Reserva reserva;
    private Cliente cliente;
    
	public Passagem(int id_passagem, double preco, Date data_emissao, int assento, Reserva reserva, Cliente cliente) {
		super();
		this.id_passagem = id_passagem;
		this.preco = preco;
		this.data_emissao = data_emissao;
		this.assento = assento;
		this.reserva = reserva;
		this.cliente = cliente;
	}
	
	public Passagem(double preco, Date data_emissao, int assento, Reserva reserva, Cliente cliente) {
		super();
		this.preco = preco;
		this.data_emissao = data_emissao;
		this.assento = assento;
		this.reserva = reserva;
		this.cliente = cliente;
	}

	public Passagem() {
        
    }

	public Passagem(int id_passagem, double preco, Date data_emissao, int assento, Reserva reserva) {
		super();
		this.id_passagem = id_passagem;
		this.preco = preco;
		this.data_emissao = data_emissao;
		this.assento = assento;
		this.reserva = reserva;
	}

	public Passagem(double preco, Date data_emissao, int assento, Reserva reserva) {
		super();
		this.preco = preco;
		this.data_emissao = data_emissao;
		this.assento = assento;
		this.reserva = reserva;
	}



	public int getId_passagem() {
		return id_passagem;
	}

	public void setId_passagem(int id_passagem) {
		this.id_passagem = id_passagem;
	}

	public double getPreco() {
		return preco;
	}

	public Double setPreco(double preco) {
		return this.preco = preco;
	}

	public Date getData_emissao() {
		return data_emissao;
	}

	public void setData_emissao(Date data_emissao) {
		this.data_emissao = data_emissao;
	}

	public int getAssento() {
		return assento;
	}

	public void setAssento(int assento) {
		this.assento = assento;
	}

	public Reserva getReserva() {
		return reserva;
	}

	public void setReserva(Reserva reserva) {
		this.reserva = reserva;
	}
	
	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
		
	}

	public Cliente getCliente() {
		return cliente;
	}
	
	public static void gerarPassagem(Scanner scanner, PassagemDAO passagemDAO, ReservaDAO reservaDAO, int id_reserva) {

	    if (reservaDAO.reservaExists(id_reserva)) {
	        Passagem passagem = new Passagem();

	        System.out.println("Digite o preço da passagem:");
	        double preco = scanner.nextDouble();
	        scanner.nextLine();

	        System.out.println("Digite o número do assento:");
	        int assento = scanner.nextInt();
	        scanner.nextLine();

	        passagem.setAssento(assento);
	        passagem.setData_emissao(new Date());
	        passagem.setPreco(preco);
	        
	        Reserva reserva = reservaDAO.readById(id_reserva);
	        
	        Passagem passagem1 = new Passagem(preco, new Date(), assento, reserva); //ver se isso funciona
	        
	        passagemDAO.save(passagem1);

	        System.out.println("Passagem criada com sucesso!");
	    } else {
	        System.out.println("A reserva com o ID especificado não existe. Crie a reserva antes de criar a passagem.");
	    }
	}

		

	public static void VerSuaPassagem(Scanner scanner, PassagemDAO passagemDAO, int id_cliente) {

	    List<Passagem> passagens = passagemDAO.getPassagensByCliente(id_cliente);

	    if (passagens.isEmpty()) {
	        System.out.println("Você ainda não possui passagens.");
	    } else {
	        SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");

	        System.out.println(" ----------------------");
	        System.out.println("| \u001B[33mSua passagem gerada:\u001B[0m |");
	        System.out.println(" ----------------------");
	        for (Passagem passagem : passagens) {
	            System.out.println("ID da Passagem: " + passagem.getId_passagem());
	            System.out.println("Preço: " + passagem.getPreco());
	            System.out.println("Assento: " + passagem.getAssento());
	            System.out.println("Data de Emissão: " + dateFormat.format(passagem.getData_emissao()));
	            System.out.println("ID da Reserva: " + passagem.getReserva().getId_reserva());
	            
	            Reserva reserva = passagemDAO.getReservaByPassagem(passagem.getReserva().getId_reserva());
	            if (reserva != null) {
	                System.out.println("Origem: " + reserva.getOrigem());
	                System.out.println("Destino: " + reserva.getDestino());
	                System.out.println("Data de Partida: " + dateFormat.format(reserva.getData_partida()));
	                System.out.println("Data de Chegada: " + dateFormat.format(reserva.getData_chegada()));
	            }
	            
	            System.out.println("------------------------------");
	        }
	    }
	}

	
		    
}
