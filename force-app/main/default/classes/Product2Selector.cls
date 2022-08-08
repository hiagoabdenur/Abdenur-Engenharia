public class Product2Selector 
{
    public static List<Product2> buscarProdutos()
    {
        return [SELECT Id, name FROM Product2];
    }
}