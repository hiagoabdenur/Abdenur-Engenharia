trigger ContentDocumentLink on ContentDocumentLink (after insert, before insert) 
{
    if(Trigger.isAfter)
    {
        LinkPublico.criar();   
    }
    else if (Trigger.isBefore)
    {
        for(ContentDocumentLink documento : (List<ContentDocumentLink>) Trigger.new)
        {
            documento.Visibility = 'AllUsers';
        }
    }
}