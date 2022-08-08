public class Teste 
{
    public static void Teste1()
    {
        List<Orcamento__c> listaOrcamento = new List<Orcamento__c>();
        
        for(Orcamento__c orc : listaOrcamento)
        {
            orc.Nome__c = 'Hiago';
        }
        
        Insert listaOrcamento;
        
        List<Integer> listaOrcamento2 = new List<Integer>{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20};
            System.debug(listaOrcamento2.size());
        
    }
}