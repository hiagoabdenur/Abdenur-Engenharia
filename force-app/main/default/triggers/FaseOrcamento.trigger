trigger FaseOrcamento on Orcamento__c (before insert, after insert) 
{
   if(trigger.isbefore)//antes
    {
       //Orcamento.orcamentoFase(trigger.new);
       FormaContato.VerificarContato(trigger.new);
    } 
    else
    {
        CustomNotificationFromApex.notificarUsuarios(new Set<String>{'0055Y00000FqTszQAF'},trigger.new[0].id);
    }
}