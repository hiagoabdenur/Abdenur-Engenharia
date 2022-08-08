@isTest
public class FormaContatoTeste
{
    @isTest static void criarOrcamentoTest()
    {
        Orcamento__c orc = new Orcamento__c();
        
        try
        {
            insert orc;
        }
        catch(dmlexception x)
        {
            system.assert(x.getDmlMessage(0)=='Informar o número de contato');
        }
    }
    
}