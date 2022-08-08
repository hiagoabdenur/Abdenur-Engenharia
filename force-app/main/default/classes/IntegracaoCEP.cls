public class IntegracaoCEP 
{
    public static Endereco buscar(String CEP)
    {
        String cepFormatado = CEP.replace('-','');
        cepFormatado = cepFormatado.replace('.', ''); 
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://viacep.com.br/ws/'+ CEP +'/json/');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        
        Endereco ende = new Endereco();
        
        if(response.getStatusCode() == 200)
        {
            
        }
        
        
        return null;
    }
}