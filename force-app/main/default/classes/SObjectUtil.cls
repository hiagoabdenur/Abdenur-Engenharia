global class SObjectUtil 
{
   @InvocableMethod(label='Inserir Objeto')
    global static List<string>inserirSObject()
    {
        /*List<string> mensagens = new List<String>();
        try
        {
            insert objetos;
            mensagens.add(objetos[0].Id);
        }
        catch(dmlexception ex)
        {
              mensagens.add(ex.getDmlMessage(0));
        }*/
            return new List<String>();   
    }
}