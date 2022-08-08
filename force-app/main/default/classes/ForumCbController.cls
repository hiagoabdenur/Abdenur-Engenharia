public class ForumCbController 
{
	@AuraEnabled 
    public static ViaCepIntegration.Endereco buscarEndereco(String CEP)
    {
        return ViaCepIntegration.buscarCep(CEP);
    }
}