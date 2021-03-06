package POJOS;
// Generated 21-mar-2020 9:41:27 by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Compra generated by hbm2java
 */
public class Compra  implements java.io.Serializable {


     private Integer id;
     private Tarjeta tarjeta;
     private Viajes viajes;
     private Date fechaPago;
     private double importeCompra;
     private int numViajeros;
     private String localizador;
     private Set ocupacions = new HashSet(0);

    public Compra() {
    }

	
    public Compra(Tarjeta tarjeta, Viajes viajes, Date fechaPago, double importeCompra, int numViajeros, String localizador) {
        this.tarjeta = tarjeta;
        this.viajes = viajes;
        this.fechaPago = fechaPago;
        this.importeCompra = importeCompra;
        this.numViajeros = numViajeros;
        this.localizador = localizador;
    }
    public Compra(Tarjeta tarjeta, Viajes viajes, Date fechaPago, double importeCompra, int numViajeros, String localizador, Set ocupacions) {
       this.tarjeta = tarjeta;
       this.viajes = viajes;
       this.fechaPago = fechaPago;
       this.importeCompra = importeCompra;
       this.numViajeros = numViajeros;
       this.localizador = localizador;
       this.ocupacions = ocupacions;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public Tarjeta getTarjeta() {
        return this.tarjeta;
    }
    
    public void setTarjeta(Tarjeta tarjeta) {
        this.tarjeta = tarjeta;
    }
    public Viajes getViajes() {
        return this.viajes;
    }
    
    public void setViajes(Viajes viajes) {
        this.viajes = viajes;
    }
    public Date getFechaPago() {
        return this.fechaPago;
    }
    
    public void setFechaPago(Date fechaPago) {
        this.fechaPago = fechaPago;
    }
    public double getImporteCompra() {
        return this.importeCompra;
    }
    
    public void setImporteCompra(double importeCompra) {
        this.importeCompra = importeCompra;
    }
    public int getNumViajeros() {
        return this.numViajeros;
    }
    
    public void setNumViajeros(int numViajeros) {
        this.numViajeros = numViajeros;
    }
    public String getLocalizador() {
        return this.localizador;
    }
    
    public void setLocalizador(String localizador) {
        this.localizador = localizador;
    }
    public Set getOcupacions() {
        return this.ocupacions;
    }
    
    public void setOcupacions(Set ocupacions) {
        this.ocupacions = ocupacions;
    }

    public void setOcupacion(Ocupacion ocupacions) {
        this.ocupacions.add(ocupacions);
    }



}


