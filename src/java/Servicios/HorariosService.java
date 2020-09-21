package Servicios;

import java.util.ArrayList;
import java.util.Date;


public class HorariosService {

     private Integer id;
     private RutaService ruta;
     private String horaSalida;
     private String horaLlegada;
     private String tipo;
     private ArrayList<ViajeService> viajes;

    public HorariosService() {
    }

    public HorariosService(Integer id, RutaService ruta, String horaSalida, String horaLlegada, String tipo) {
        this.id = id;
        this.ruta = ruta;
        this.horaSalida = horaSalida;
        this.horaLlegada = horaLlegada;
        this.tipo = tipo;
    }

    public ArrayList<ViajeService> getViajes() {
        return viajes;
    }

    public void setViajes(ArrayList<ViajeService> viajes) {
        this.viajes = viajes;
    }

    
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public RutaService getRuta() {
        return ruta;
    }

    public void setRuta(RutaService ruta) {
        this.ruta = ruta;
    }

    public String getHoraSalida() {
        return horaSalida;
    }

    public void setHoraSalida(String horaSalida) {
        this.horaSalida = horaSalida;
    }

    public String getHoraLlegada() {
        return horaLlegada;
    }

    public void setHoraLlegada(String horaLlegada) {
        this.horaLlegada = horaLlegada;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

     
}
