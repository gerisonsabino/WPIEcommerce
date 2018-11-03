package classes;

import java.sql.Date;
import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Currency;
import java.util.Locale;

public class Util 
{
    public static String toShortDateString(Date data)
    {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        
        return sdf.format(data);
    }
    
    public static String toStringCurrency(Double valor) 
    {
        Double currencyAmount = new Double(valor);
        
        Locale locale = new Locale("pt", "BR");
        Currency currentCurrency = Currency.getInstance(locale);
        NumberFormat currencyFormatter = new java.text.DecimalFormat("###,###,##0.00");
        NumberFormat.getCurrencyInstance(locale);

        return currentCurrency.getSymbol() + " " + currencyFormatter.format(currencyAmount);
    }
}
