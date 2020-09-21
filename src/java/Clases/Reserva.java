package Clases;

import POJOS.Cliente;
import POJOS.Compra;
import POJOS.Ruta;
import POJOS.Viajes;
import java.util.ArrayList;
import java.util.Date;


public class Reserva {
    
    private Date fechaCompra;
    
    private Date fechaViaje;
    
    private int numViajeros;
    
    private Ruta objRuta;
    
    private Viajes viaje;
    
    private Cliente cliente;
    
    private ArrayList<ViajeroAsiento> viajeros;
    
    private ArrayList asientosOcupados;
    
    private Compra compra;


    public Reserva() {
    }

    public Reserva(Date fechaCompra, Date fechaViaje, int numViajeros, Ruta objRuta) {
        this.fechaCompra = fechaCompra;
        this.fechaViaje = fechaViaje;
        this.numViajeros = numViajeros;
        this.objRuta = objRuta;
    }

    public ArrayList getAsientosOcupados() {
        return asientosOcupados;
    }

    public void setAsientosOcupados(ArrayList asientosOcupados) {
        this.asientosOcupados = asientosOcupados;
    }
    
    

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Compra getCompra() {
        return compra;
    }

    public void setCompra(Compra compra) {
        this.compra = compra;
    }
    
    
    

    public ArrayList<ViajeroAsiento> getViajeros() {
        return viajeros;
    }

    public void setViajeros(ArrayList<ViajeroAsiento> viajeros) {
        this.viajeros = viajeros;
    }

    
    public void addViajero(ViajeroAsiento viajero){
        this.viajeros.add(viajero);
    }
    

    public Date getFechaCompra() {
        return fechaCompra;
    }

    public void setFechaCompra(Date fechaCompra) {
        this.fechaCompra = fechaCompra;
    }

    public Date getFechaViaje() {
        return fechaViaje;
    }

    public void setFechaViaje(Date fechaViaje) {
        this.fechaViaje = fechaViaje;
    }

    public int getNumViajeros() {
        return numViajeros;
    }

    public void setNumViajeros(int numViajeros) {
        this.numViajeros = numViajeros;
    }

    public Viajes getViaje() {
        return viaje;
    }

    public void setViaje(Viajes viaje) {
        this.viaje = viaje;
    }
    
    public Ruta getObjRuta() {
        return objRuta;
    }

    public void setObjRuta(Ruta objRuta) {
        this.objRuta = objRuta;
    }
    
    public double getImporteTotal(){
        int importeTotal = this.getObjRuta().getPrecio() * this.getNumViajeros();
        
        double importeFinal = importeTotal;
        
        return importeFinal;
    }
    
    

}
