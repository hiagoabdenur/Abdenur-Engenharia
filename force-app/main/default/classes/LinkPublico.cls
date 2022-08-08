public without sharing class LinkPublico 
{
    public static void criar()
    {
        List<ContentDistribution> linksPublicos = new List<ContentDistribution>();
        
        Set<Id> ids = new Set<Id>();
        for(ContentDocumentLink link : (List<ContentDocumentLink>) Trigger.New)
        {
            ids.add(link.ContentDocumentId);
        }
        List<ContentDocument> documentos = [SELECT Id, Title, LatestPublishedVersionId FROM ContentDocument WHERE Id IN :ids];
        
        for(ContentDocument documento : documentos)
        {
            ContentDistribution cd = new ContentDistribution();
            cd.Name = documento.Title;
            cd.ContentVersionId = documento.LatestPublishedVersionId;
            cd.PreferencesAllowViewInBrowser= true;
            cd.PreferencesLinkLatestVersion=true;
            cd.PreferencesNotifyOnVisit=false;
            cd.PreferencesPasswordRequired=false;
            cd.PreferencesAllowOriginalDownload= true;
            linksPublicos.add(cd);
        }
        INSERT linksPublicos;
    }
}