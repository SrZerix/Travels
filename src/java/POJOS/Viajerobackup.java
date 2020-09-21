package POJOS;
// Generated 21-mar-2020 9:41:27 by Hibernate Tools 4.3.1


import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Viajerobackup generated by hbm2java
 */
public class Viajerobackup  implements java.io.Serializable {


     private Integer id;
     private String dni;
     private String nombre;
     private String apellido;
     private Date fechaBaja;
     private Set ocupacionbackups = new HashSet(0);

    public Viajerobackup() {
    }

	
    public Viajerobackup(String dni, String nombre, String apellido, Date fechaBaja) {
        this.dni = dni;
        this.nombre = nombre;
        this.apellido = apellido;
        this.fechaBaja = fechaBaja;
    }
    public Viajerobackup(String dni, String nombre, String apellido, Date fechaBaja, Set ocupacionbackups) {
       this.dni = dni;
       this.nombre = nombre;
       this.apellido = apellido;
       this.fechaBaja = fechaBaja;
       this.ocupacionbackups = ocupacionbackups;
    }
   
    public Integer getId() {
        return this.id;
    }
    
    public void setId(Integer id) {
        this.id = id;
    }
    public String getDni() {
        return this.dni;
    }
    
    public void setDni(String dni) {
        this.dni = dni;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getApellido() {
        return this.apellido;
    }
    
    public void setApellido(String apellido) {
        this.apellido = apellido;
    }
    public Date getFechaBaja() {
        return this.fechaBaja;
    }
    
    public void setFechaBaja(Date fechaBaja) {
        this.fechaBaja = fechaBaja;
    }
    public Set getOcupacionbackups() {
        return this.ocupacionbackups;
    }
    
    public void setOcupacionbackups(Set ocupacionbackups) {
        this.ocupacionbackups = ocupacionbackups;
    }




}

