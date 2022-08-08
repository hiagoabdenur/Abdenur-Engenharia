public without sharing class ContentDocumentLinkSelector 
{
    public static List<ContentDocumentLink> getListAttachmentsByLinkedEntityId(List<Id> LinkedEntityIds)
    {
        List<String> stringTipos = new List<String>(); 
        stringTipos.add('png');
        stringTipos.add('jpg');
        stringTipos.add('jpeg');
        return [select id, ContentDocument.title, ContentDocumentId, LinkedEntityId from ContentDocumentLink where LinkedEntityId IN :LinkedEntityIds 
                AND ContentDocument.FileType IN :stringTipos
                ];
    }
}