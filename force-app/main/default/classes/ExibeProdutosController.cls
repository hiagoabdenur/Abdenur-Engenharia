public without sharing class ExibeProdutosController 
{    
    @AuraEnabled(cacheable=true)
    public static List<ProdutoLwcWrapper> getProdutos()
    {
        List<ProdutoLwcWrapper> produtosImagens = new List<ProdutoLwcWrapper>();

        List<Product2> produtos = Product2Selector.buscarProdutos();
        
        List<Id> idsProdutos = new List<Id>();
        Set<Id> idsProdutosSet = new Set<Id>();
        
        for(Product2 produto : produtos)
        {
            idsProdutosSet.add(produto.id);
        }
        
        idsProdutos.addAll(idsProdutosSet);
        
        if(idsProdutos.size() != 0) {
            produtosImagens = ProdutoLwcWrapper.montarProdutoLwcWrapper(produtos, ContentDocumentLinkSelector.getListAttachmentsByLinkedEntityId(idsProdutos)); 
        }
        else {
            produtosImagens = ProdutoLwcWrapper.montarProdutoLwcWrapper(produtos, null);
        }
        system.debug(produtosImagens);
        //retorna a lista de armários 
        return produtosImagens;
    }
}