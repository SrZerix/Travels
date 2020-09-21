package POJOS;
// Generated 21-mar-2020 9:41:27 by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Ruta generated by hbm2java
 */
public class Ruta  implements java.io.Serializable {


     private Integer id;
     private Estacion estacionByIdOrigen;
     private Estacion estacionByIdDestino;
     private Date duracion;
     private int distancia;
     private int precio;
     private Set horarioses = new HashSet(0);

    public Ruta() {
    }

	
    public Ruta(Estacion estacionByIdOrigen, Estacion estacionByIdDestino, Date duracion, int distancia, int precio) {
        this.estacionByIdOrigen = estacionByIdOrigen;
        this.estacionByIdDestino = estacionByIdDestino;
        this.duracion = duracion;
        this.distancia = distancia;
        this.precio = precio;
    }
    public Ruta(Estacion estacionByIdOrigen, Estacion estacionByIdDestino, Date duracion, int distancia, int precio, Set horarioses) {
       this.estacionByIdOrigen = estacionByIdOrigen;
       this.estacionByIdDestino = estacionByIdDestino;
       this.duracion = duracion;
       this.distancia = distancia;
       this.precio = precio;
       this.horarioses = horarioses;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public Estacion getEstacionByIdOrigen() {
        return this.estacionByIdOrigen;
    }
    
    public void setEstacionByIdOrigen(Estacion estacionByIdOrigen) {
        this.estacionByIdOrigen = estacionByIdOrigen;
    }
    public Estacion getEstacionByIdDestino() {
        return this.estacionByIdDestino;
    }
    
    public void setEstacionByIdDestino(Estacion estacionByIdDestino) {
        this.estacionByIdDestino = estacionByIdDestino;
    }
    public Date getDuracion() {
        return this.duracion;
    }
    
    public void setDuracion(Date duracion) {
        this.duracion = duracion;
    }
    public int getDistancia() {
        return this.distancia;
    }
    
    public void setDistancia(int distancia) {
        this.distancia = distancia;
    }
    public int getPrecio() {
        return this.precio;
    }
    
    public void setPrecio(int precio) {
        this.precio = precio;
    }
    public Set getHorarioses() {
        return this.horarioses;
    }
    
    public void setHorarioses(Set horarioses) {
        this.horarioses = horarioses;
    }




}


