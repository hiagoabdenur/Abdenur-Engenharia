public class IdadeCerta 
{
    private List<Integer> NumerosOrdenados {get; set;}
    
    public static void receberAno(List<Integer> listaAno)
    {
        for(Integer numero : listaAno)
        {
            System.debug(Date.today().year() - numero); 
        }
    }
}