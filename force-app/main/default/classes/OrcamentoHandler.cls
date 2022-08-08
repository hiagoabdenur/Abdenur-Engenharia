public class OrcamentoHandler 
{
    public static void verificarContatoOrc(List<Orcamento__c> orcs)
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
    
    public static void notificarUsuarios(Set<String> idsDosUsuariosQueVaoReceberANotificacao, id idDoOrcamento) 
    {
        
        // Get the Id for our custom notification type
        CustomNotificationType tipoDeNotificacao = [SELECT Id, DeveloperName FROM CustomNotificationType WHERE DeveloperName='OramentoCriado'];
        
        // Create a new custom notification
        Messaging.CustomNotification notificacao = new Messaging.CustomNotification();
        
        // Set the contents for the notification
        notificacao.setTitle('Orçamento Criado!');
        notificacao.setBody('Um novo Orçamento Foi Criado!');
        
        // Set the notification type and target
        notificacao.setNotificationTypeId(tipoDeNotificacao.Id);
        notificacao.setTargetId(idDoOrcamento);
        
        
        // Actually send the notification
        try {
            notificacao.send(idsDosUsuariosQueVaoReceberANotificacao);
        }
        catch (Exception e) {
            System.debug('Problem sending notification: ' + e.getMessage());
        }
    }
    
    public static void sedEmail(List<Orcamento__c> listOrc)
    {
        List<Messaging.SingleEmailMessage> emailList = new List<Messaging.SingleEmailMessage>();
        EmailTemplate emailTemp = [SELECT Id, Subject, Description, HtmlValue, DeveloperName, Body from EmailTemplate WHERE DeveloperName  = 'IniciandoOcamento'];
        List<String> email = new List<String>{listOrc[0].Email__c};
        system.debug(email);
        
        for(Orcamento__c orc : listOrc)
        {
            orc.Fase__c = 'Início'; 
        }
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setTemplateId(emailTemp.Id);
        mail.setToAddresses(email);
        mail.setSubject(emailTemp.Subject);
        mail.setplaintextbody(emailTemp.body);
        mail.setTargetObjectId(listOrc[0].Id);
        mail.setWhatId(listOrc[0].Id);
        emailList.add(mail);
        system.debug(listOrc[0].Fase__c == 'Início');
        
        if(!emailList.isEmpty() && listOrc[0].Fase__c == 'Início')
        {
            Messaging.sendEmail(emailList);
        }	   
    } 
}