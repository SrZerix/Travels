package POJOS;
// Generated 21-mar-2020 9:41:27 by Hibernate Tools 4.3.1


import java.util.HashSet;
import java.util.Set;

/**
 * Cliente generated by hbm2java
 */
public class Cliente  implements java.io.Serializable {


     private Integer id;
     private String dni;
     private String clave;
     private String nombre;
     private String apellidos;
     private String telefono;
     private String email;
     private Set tarjetabackups = new HashSet(0);
     private Set tarjetas = new HashSet(0);

    public Cliente() {
    }

	
    public Cliente(String dni, String clave, String nombre, String apellidos, String telefono, String email) {
        this.dni = dni;
        this.clave = clave;
        this.nombre = nombre;
        this.apellidos = apellidos;
        this.telefono = telefono;
        this.email = email;
    }
    public Cliente(String dni, String clave, String nombre, String apellidos, String telefono, String email, Set tarjetabackups, Set tarjetas) {
       this.dni = dni;
       this.clave = clave;
       this.nombre = nombre;
       this.apellidos = apellidos;
       this.telefono = telefono;
       this.email = email;
       this.tarjetabackups = tarjetabackups;
       this.tarjetas = tarjetas;
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
    public String getClave() {
        return this.clave;
    }
    
    public void setClave(String clave) {
        this.clave = clave;
    }
    public String getNombre() {
        return this.nombre;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public String getApellidos() {
        return this.apellidos;
    }
    
    public void setApellidos(String apellidos) {
        this.apellidos = apellidos;
    }
    public String getTelefono() {
        return this.telefono;
    }
    
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
    public String getEmail() {
        return this.email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    public Set getTarjetabackups() {
        return this.tarjetabackups;
    }
    
    public void setTarjetabackups(Set tarjetabackups) {
        this.tarjetabackups = tarjetabackups;
    }
    public Set getTarjetas() {
        return this.tarjetas;
    }
    
    public void setTarjetas(Set tarjetas) {
        this.tarjetas = tarjetas;
    }

    public void setTarjeta(Tarjeta tarjetas) {
        this.tarjetas.add(tarjetas);
    }
    
    public void setTarjetabackup(Tarjetabackup tarjetabackups) {
        this.tarjetabackups.add(tarjetabackups);
    }



}


