package Servicios;


import java.util.Date;


public class ViajeService {
    
     private Integer id;
     private HorariosService horarios;
     private String dia;
     private int plazas;

    public ViajeService() {
    }

    public ViajeService(Integer id, HorariosService horarios, String dia, int plazas) {
        this.id = id;
        this.horarios = horarios;
        this.dia = dia;
        this.plazas = plazas;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public HorariosService getHorarios() {
        return horarios;
    }

    public void setHorarios(HorariosService horarios) {
        this.horarios = horarios;
    }

    public String getDia() {
        return dia;
    }

    public void setDia(String dia) {
        this.dia = dia;
    }

    public int getPlazas() {
        return plazas;
    }

    public void setPlazas(int plazas) {
        this.plazas = plazas;
    }

     
}
