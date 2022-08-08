public class OrcamentoTriggerHandler
{    
    public void OnBeforeInsert(List<Orcamento__c> newList)
    {
       OrcamentoHandler.verificarContatoOrc(newList);
       OrcamentoHandler.sedEmail(newList);
        
    }
    
    public void OnBeforeUpdate(Map<Id, Orcamento__c> newMap, Map<Id, Orcamento__c> OldMap)
    {
        
    }
    
    public void OnBeforeDelete(List<Orcamento__c> newList)
    {
        
    }
    
    public void OnAfterInsert(List<Orcamento__c> newList)
    {
        List<User> Usuarios = [SELECT Id, UserName FROM User WHERE Username = 'abdenur.engenharia@gmail.com'];
        Set<String> SetUserId = new Set<String>{Usuarios[0].id};
        OrcamentoHandler.notificarUsuarios(SetUserId, newList[0].id);
    }
    
    public void OnAfterUpdate(List<Orcamento__c> newList)
    {
        
    }
    
    public void OnAfterDelete(List<Orcamento__c> newList)
    {
        
    }
}