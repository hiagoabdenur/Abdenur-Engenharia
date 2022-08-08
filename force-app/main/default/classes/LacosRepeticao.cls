public class LacosRepeticao 
{
    public static void lacoFor(Integer n1, Integer n2)
    {
         Integer numeroPar = 0;
         Integer numeroImpar = 0;
        
            for(Integer numero1 = n1; numero1<n2; numero1++)
            {
               
            }
        
        if(math.mod(n1,2) == 0)
        {
           numeroPar++;
        }
        else
        {
            numeroImpar++;
        }
        
        system.debug(numeroPar + ' Par');
        system.debug(numeroImpar + ' Impar');
        
 
    }
}