public class ViaCepIntegration 
{
    public static Endereco buscarCep(String CEP)
    {
        CEP = CEP.replace('-', '');
        CEP = CEP.replace('.', '');        
        Endereco ende = new Endereco();
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://viacep.com.br/ws/'+ CEP +'/json/');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        if (response.getStatusCode() == 200) 
        {
            ende = (Endereco) JSON.deserialize(response.getBody(), Endereco.class);
        }
        else
        {
            throw new ViaCepIntegrationException('Não encontrei o CEP');
        }
        
        return ende;
    }
    
    public class ViaCepIntegrationException extends Exception {}
    
    public class Endereco
    {
      @auraEnabled
      public String CEP {get; set;}
      @auraEnabled
      public String Logradouro {get; set;}
      @auraEnabled
      public String Complemento {get; set;}
      @auraEnabled
      public String Bairro {get; set;}
      @auraEnabled
      public String Localidade {get; set;}
      @auraEnabled
      public String UF {get; set;}
      @auraEnabled
      public String IBGE {get; set;}
      @auraEnabled
      public String Gia {get; set;}
      @auraEnabled
      public String DDD {get; set;}
      @auraEnabled
      public String Siafi {get; set;}
    }
}