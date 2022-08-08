public class Fase
{
    public static void novoOrcamento(List<Orcamento__c> orcamentos)
    {
       for(Orcamento__c linhaorcamento : orcamentos)
       {
          linhaorcamento.Fase__c = 'Início'; 
       }
    }
}