package Servicios;

import java.util.ArrayList;
import java.util.Date;


public class RutaService {
    
     private Integer id;
     private EstacionService estacionOrigen;
     private EstacionService estacionDestino;
     private String duracion;
     private int distancia;
     private int precio;
     private ArrayList<HorariosService> horarios;
             
    public RutaService() {
    }

    public RutaService(Integer id, EstacionService estacionOrigen, EstacionService estacionDestino, String duracion, int distancia, int precio) {
        this.id = id;
        this.estacionOrigen = estacionOrigen;
        this.estacionDestino = estacionDestino;
        this.duracion = duracion;
        this.distancia = distancia;
        this.precio = precio;
    }

    public ArrayList<HorariosService> getHorarios() {
        return horarios;
    }

    public void setHorarios(ArrayList<HorariosService> horarios) {
        this.horarios = horarios;
    }
     
     

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public EstacionService getEstacionOrigen() {
        return estacionOrigen;
    }

    public void setEstacionOrigen(EstacionService estacionOrigen) {
        this.estacionOrigen = estacionOrigen;
    }

    public EstacionService getEstacionDestino() {
        return estacionDestino;
    }

    public void setEstacionDestino(EstacionService estacionDestino) {
        this.estacionDestino = estacionDestino;
    }

    public String getDuracion() {
        return duracion;
    }

    public void setDuracion(String duracion) {
        this.duracion = duracion;
    }

    public int getDistancia() {
        return distancia;
    }

    public void setDistancia(int distancia) {
        this.distancia = distancia;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

     
}
