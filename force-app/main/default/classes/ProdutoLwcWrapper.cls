//classe toda modifica por Sérgio
public without sharing class ProdutoLwcWrapper {
    @AuraEnabled
    public Product2 produto;
    @AuraEnabled
    public List<String> listaImagens;
    @AuraEnabled
    public String capa;
    
    public Static List<ProdutoLwcWrapper> montarProdutoLwcWrapper(List<Product2> produtos, List<ContentDocumentLink> documentos)
    {
        List<ProdutoLwcWrapper> produtosLwc = new List<ProdutoLwcWrapper>();
        
        Set<id> ids = new Set<Id>();
        
        for(ContentDocumentLink documento : documentos)
        {
            ids.add(documento.ContentDocumentId);
        }
        
        Map<Id, ContentDocument> documentosMap = new Map<Id, ContentDocument>([SELECT Id, Title, (SELECT ContentDownloadUrl FROM ContentDistributions LIMIT 1) FROM ContentDocument WHERE Id IN :ids]);
        
        for(Product2 produto : produtos)
        {
            ProdutoLwcWrapper produtoLwc = new ProdutoLwcWrapper();
            produtoLwc.produto = produto;
            List<ContentDocumentLink> imagensDesseProduto = new List<ContentDocumentLink>();
            
            for(ContentDocumentLink documento : documentos)
            {
                if(documento.LinkedEntityId == produto.id)
                {
                    imagensDesseProduto.add(documento);
                }
            }
            
            if(!imagensDesseProduto.isEmpty())
            {
                produtoLwc.listaImagens = new List<String>();
                produtoLwc.capa = documentosMap.get(imagensDesseProduto[0].ContentDocumentId).ContentDistributions[0].ContentDownloadUrl;
                
                for(ContentDocumentLink cd: imagensDesseProduto) 
                {
                    if(cd.ContentDocument.title.toLowerCase() == 'capa' )
                    {
                        produtoLwc.capa = documentosMap.get(cd.ContentDocumentId).ContentDistributions[0].ContentDownloadUrl;
                        break;
                    }
                }
                for(ContentDocumentLink cd: imagensDesseProduto) 
                {
                    produtoLwc.listaImagens.add(documentosMap.get(cd.ContentDocumentId).ContentDistributions[0].ContentDownloadUrl);
                }   
            }
            produtosLwc.add(produtoLwc);        
        }
        return produtosLwc;
    }
}