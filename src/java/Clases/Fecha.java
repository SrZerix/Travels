package Clases;


import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;


public class Fecha {
    
    public Date toDate(String fechaTarjeta) throws ParseException{

    try{
        SimpleDateFormat formatt = new SimpleDateFormat("MM/yyyy");

        Date fechaFinal = formatt.parse(fechaTarjeta);
        
        return fechaFinal;

    }catch(Exception ex){
    
     SimpleDateFormat formatt = new SimpleDateFormat("yyyy-MM");

     Date fechaFinal = formatt.parse(fechaTarjeta);
    
     return fechaFinal;    
    }
            
}
        
public String toString(Date date){

DateFormat dateFormat = new SimpleDateFormat("dd-mm-yyyy");  

String fecha = dateFormat.format(date);

return fecha;

}
    
    

public String inversa(Date date){

     SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

        String fecha = formatter.format(date);

        String anio = fecha.substring(0, 4);

        String mes = fecha.substring(5, 7);

        String dia = fecha.substring(8, 10);

        String fechaInversa = dia+"-"+mes+"-"+anio;

    return fechaInversa;
}

}
