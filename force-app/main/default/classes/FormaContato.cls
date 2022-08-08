public class FormaContato 
{
    public static void verificarContato(List<Orcamento__c> orcs)
    {
        for(Orcamento__c orc : orcs)
        {
            if(orc.Celular__c == null && orc.Email__c == null)
            {
                orc.addError('Celular__c','Informar o número de contato');
                orc.addError('Email__c','Infomar um Email valido');
            }
        }
    }
}