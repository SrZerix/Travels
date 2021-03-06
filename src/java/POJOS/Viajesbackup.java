package POJOS;
// Generated 21-mar-2020 9:41:27 by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Viajesbackup generated by hbm2java
 */
public class Viajesbackup  implements java.io.Serializable {


     private Integer id;
     private Horarios horarios;
     private Date dia;
     private int plazas;
     private Date fechaBaja;
     private Set comprabackups = new HashSet(0);

    public Viajesbackup() {
    }

	
    public Viajesbackup(Horarios horarios, Date dia, int plazas, Date fechaBaja) {
        this.horarios = horarios;
        this.dia = dia;
        this.plazas = plazas;
        this.fechaBaja = fechaBaja;
    }
    public Viajesbackup(Horarios horarios, Date dia, int plazas, Date fechaBaja, Set comprabackups) {
       this.horarios = horarios;
       this.dia = dia;
       this.plazas = plazas;
       this.fechaBaja = fechaBaja;
       this.comprabackups = comprabackups;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public Horarios getHorarios() {
        return this.horarios;
    }
    
    public void setHorarios(Horarios horarios) {
        this.horarios = horarios;
    }
    public Date getDia() {
        return this.dia;
    }
    
    public void setDia(Date dia) {
        this.dia = dia;
    }
    public int getPlazas() {
        return this.plazas;
    }
    
    public void setPlazas(int plazas) {
        this.plazas = plazas;
    }
    public Date getFechaBaja() {
        return this.fechaBaja;
    }
    
    public void setFechaBaja(Date fechaBaja) {
        this.fechaBaja = fechaBaja;
    }
    public Set getComprabackups() {
        return this.comprabackups;
    }
    
    public void setComprabackups(Set comprabackups) {
        this.comprabackups = comprabackups;
    }

    public void setComprabackup(Comprabackup comprabackups) {
        this.comprabackups.add(comprabackups);
    }



}


