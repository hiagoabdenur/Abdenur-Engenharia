public class Veiculo 
{
  public String nome;
  public Integer idade;
  public String modelo;
  public Pessoa dono;
  public String cor;
  public String carroNovo;  
    
    public Veiculo(String nomeCarro, Integer idadeCarro, String modeloCarro, Pessoa donoCarro, String corCarro)
    {
        this.nome = nomeCarro;
        this.idade = idadeCarro;
        this.modelo = modeloCarro;
        this.dono = donoCarro;
        this.cor = corCarro;
    }
    
    public void mudarDeCarro(String carroNovoCor)
    {
        this.nome = carroNovoCor;
    }
    
}