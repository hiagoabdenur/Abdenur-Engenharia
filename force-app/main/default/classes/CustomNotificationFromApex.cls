public without sharing class CustomNotificationFromApex 
{
 
    public static void notificarUsuarios(Set<String> idsDosUsuariosQueVaoReceberANotificacao, String idDoOrcamento) 
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
}