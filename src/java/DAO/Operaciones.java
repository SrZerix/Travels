package DAO;

import POJOS.Cliente;
import POJOS.Compra;
import POJOS.Comprabackup;
import POJOS.Estacion;
import POJOS.Horarios;
import POJOS.Ocupacion;
import POJOS.Ocupacionbackup;
import POJOS.Parametros;
import POJOS.Ruta;
import POJOS.Tarjeta;
import POJOS.Tarjetabackup;
import POJOS.Viajero;
import POJOS.Viajerobackup;
import POJOS.Viajes;
import POJOS.Viajesbackup;
import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Iterator;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;


public class Operaciones {
    
    public Operaciones() {
    }
    
    public ArrayList listEstaciones(SessionFactory SessionBuilder){
        
        Session sesion=SessionBuilder.openSession();
        
        String ordenHQL="from Estacion";
        
        Query q=sesion.createQuery(ordenHQL);
        
        ArrayList<Estacion> ArrayEstaciones = (ArrayList)q.list();
        
        sesion.close();
        
        return ArrayEstaciones;
        
    } 
    
      public ArrayList listDestinos(int id, SessionFactory SessionBuilder){
        
        Session sesion=SessionBuilder.openSession();
        
        String ordenHQL="from Estacion where id != :vid";
        
        Query q=sesion.createQuery(ordenHQL);
        
        q.setParameter("vid",id);
        
        ArrayList<Estacion> ArrayEstaciones = (ArrayList)q.list();
        
        sesion.close();
        
        return ArrayEstaciones;
        
    } 
      
      public Ruta buscarRuta(int idOrigen, int idDestino, SessionFactory SessionBuilder){
      
        Session sesion=SessionBuilder.openSession();
      
        String ordenHQL="from Ruta where idOrigen = :vidOrigen AND idDestino = :vidDestino";
        
        Query q=sesion.createQuery(ordenHQL);
        
        q.setParameter("vidOrigen",idOrigen);
        
        q.setParameter("vidDestino",idDestino);
        
        Ruta ruta=(Ruta)q.uniqueResult();
        
        Hibernate.initialize(ruta.getEstacionByIdDestino());
        Hibernate.initialize(ruta.getEstacionByIdOrigen());
        Hibernate.initialize(ruta.getHorarioses());
        
        Iterator iterHorarios = ruta.getHorarioses().iterator();
        
        while(iterHorarios.hasNext()){
            Horarios horario = (Horarios)iterHorarios.next();
            Hibernate.initialize(horario.getViajeses());
        }
        
        sesion.close();
        
        return ruta;
      }
      
        public Viajes buscarViaje(int idViaje, SessionFactory SessionBuilder){
      
        Session sesion=SessionBuilder.openSession();
      
        String ordenHQL="from Viajes where id = :vidViaje";
        
        Query q=sesion.createQuery(ordenHQL);
        
        q.setParameter("vidViaje",idViaje);
        
        Viajes viaje=(Viajes)q.uniqueResult();
        
        Hibernate.initialize(viaje.getHorarios());        
        Hibernate.initialize(viaje.getCompras()); 
        
       Iterator iterCompras = viaje.getCompras().iterator();
        
        while(iterCompras.hasNext()){
            Compra compras = (Compra)iterCompras.next();
            Hibernate.initialize(compras.getOcupacions());
            }
        
        sesion.close();
        
        return viaje;
      }
        
        public Viajero buscarViajero(String dniViajero, SessionFactory SessionBuilder){
      
        Session sesion=SessionBuilder.openSession();
      
        String ordenHQL="from Viajero where dni = :vidViajero";
        
        Query q=sesion.createQuery(ordenHQL);
        
        q.setParameter("vidViajero",dniViajero);
        
        Viajero viajero=(Viajero)q.uniqueResult();
        
        Hibernate.initialize(viajero.getOcupacions());
        
       Iterator iterOcupacion = viajero.getOcupacions().iterator();
        
        while(iterOcupacion.hasNext()){
            Compra compras = (Compra)iterOcupacion.next();
            Hibernate.initialize(compras.getOcupacions());
        } 
        
        sesion.close();
        
        return viajero;
      }  
 
     public void insertarCliente(Cliente cliente, SessionFactory SessionBuilder){
         
        Session sesion=SessionBuilder.openSession();

        Transaction Tx=null;
        
        try{
            Tx=sesion.beginTransaction();
            
            sesion.saveOrUpdate(cliente);
            
            Tx.commit();
            
        }catch(HibernateException HE){
        
        HE.printStackTrace();
        
        if(Tx!=null){      
            Tx.rollback();
        } throw HE;
            }
         finally{
         sesion.close();
        }
     }
     
        public void insertarCompra(Compra compra, SessionFactory SessionBuilder){
         
        Session sesion=SessionBuilder.openSession();

        Transaction Tx=null;
        
        try{
            Tx=sesion.beginTransaction();
            
            sesion.saveOrUpdate(compra);
            
            Tx.commit();
            
        }catch(HibernateException HE){
        
        HE.printStackTrace();
        
        if(Tx!=null){      
            Tx.rollback();
        } throw HE;
            }
         finally{
         sesion.close();
        }
     }
        
        public ArrayList buscarCompras(int idVIaje, SessionFactory SessionBuilder){
      
        Session sesion=SessionBuilder.openSession();
      
        String ordenHQL="from Compra where idViaje = :vidViaje";
        
        Query q=sesion.createQuery(ordenHQL);
        
        q.setParameter("vidViaje",idVIaje);
        
        ArrayList<Compra> compra = (ArrayList)q.list();
        
       Iterator iterCompra = compra.iterator();
       
       while(iterCompra.hasNext()){
           
           Compra compraI = (Compra)iterCompra.next();
        
        Hibernate.initialize(compraI.getOcupacions());
        
       }
        
        sesion.close();
        
        return compra;
      }  

        public int buscarViajero(Viajero viajero, SessionFactory SessionBuilder){
      
        Session sesion=SessionBuilder.openSession();
        
        String nif = viajero.getDni();
      
        String ordenHQL="from Viajero where dni = :vNif";
        
        Query q=sesion.createQuery(ordenHQL);
        
        q.setParameter("vNif",nif);
        
        try{
        
        Viajero viajeroB=(Viajero)q.uniqueResult();
        
        int ID = viajeroB.getId();
        
        Hibernate.initialize(viajeroB.getOcupacions());
        
        sesion.close();
       
        return ID;
       
        }catch(Exception ex){
                
        sesion.close(); 
        
            return -1;
        }
        
      }  

        public Cliente buscarCliente(String user, SessionFactory SessionBuilder){
      
        Session sesion=SessionBuilder.openSession();
      
        String ordenHQL="from Cliente where dni = :user or email = :email";
        
        Query q=sesion.createQuery(ordenHQL);
        
        q.setParameter("user",user);
        
        q.setParameter("email",user);
 
        Cliente cliente=(Cliente)q.uniqueResult();
        
        Hibernate.initialize(cliente.getTarjetas());
        
       Iterator iterTarjetas = cliente.getTarjetas().iterator();
        
        while(iterTarjetas.hasNext()){
            Tarjeta tarjeta = (Tarjeta)iterTarjetas.next();
            Hibernate.initialize(tarjeta.getCompras());
        }
        
        Hibernate.initialize(cliente.getTarjetabackups());
        
        Iterator iterTarjetasbackup = cliente.getTarjetabackups().iterator();
        
        while(iterTarjetasbackup.hasNext()){
            Tarjetabackup tarjetaBackup = (Tarjetabackup)iterTarjetasbackup.next();
            Hibernate.initialize(tarjetaBackup.getComprabackups());
        }  
        
        sesion.close();
        
        return cliente;
      }  
        
        public void insertarTarjeta(Tarjeta tarjeta, SessionFactory SessionBuilder){
         
        Session sesion=SessionBuilder.openSession();

        Transaction Tx=null;
        
        try{
            Tx=sesion.beginTransaction();
            
            sesion.saveOrUpdate(tarjeta);
            
            Tx.commit();
            
        }catch(HibernateException HE){
        
        HE.printStackTrace();
        
        if(Tx!=null){      
            Tx.rollback();
        } throw HE;
            }
         finally{
         sesion.close();
        }
     }
      
        
      public Parametros admin(SessionFactory SessionBuilder){
      
        Session sesion=SessionBuilder.openSession();
        
        String ordenHQL="from Parametros where id = 2";
        
        Query q=sesion.createQuery(ordenHQL);
        
        Parametros parametros = (Parametros)q.uniqueResult();
        
        sesion.close();
        
        return parametros;
      
      } 
      
            
      public ArrayList rutas(SessionFactory SessionBuilder){
      
        Session sesion=SessionBuilder.openSession();
      
        String ordenHQL="from Ruta";
        
        Query q=sesion.createQuery(ordenHQL);
        
        ArrayList<Ruta> ruta = (ArrayList)q.list();
        
        for(int i=0; i < ruta.size(); i++){

            Hibernate.initialize(ruta.get(i).getEstacionByIdDestino());
            Hibernate.initialize(ruta.get(i).getEstacionByIdOrigen());
            Hibernate.initialize(ruta.get(i).getHorarioses());

            Iterator iterHorarios = ruta.get(i).getHorarioses().iterator();

            while(iterHorarios.hasNext()){
                Horarios horario = (Horarios)iterHorarios.next();
                Hibernate.initialize(horario.getViajeses());
            }
            
        }
        
        sesion.close();
        
        return ruta;
      }
      
      public Viajes searchViaje(int id, SessionFactory SessionBuilder){
          
        Session sesion=SessionBuilder.openSession();
        
        String ordenHQL="from Viajes where id = :vid";
        
        Query q=sesion.createQuery(ordenHQL);
        
        q.setParameter("vid",id);

        Viajes viaje = (Viajes)q.uniqueResult();
        
        Hibernate.initialize(viaje.getHorarios());
        
        Hibernate.initialize(viaje.getHorarios().getRuta());

        Hibernate.initialize(viaje.getHorarios().getRuta().getEstacionByIdDestino());
        
        Hibernate.initialize(viaje.getHorarios().getRuta().getEstacionByIdOrigen());

        Hibernate.initialize(viaje.getCompras());

        Iterator iterCompra = viaje.getCompras().iterator();
        
            while(iterCompra.hasNext()){
                
               Compra compra = (Compra)iterCompra.next();

               Hibernate.initialize(compra.getTarjeta());
               
               Hibernate.initialize(compra.getTarjeta().getCliente());
               
               Hibernate.initialize(compra.getOcupacions());
               
               Iterator iterOcupacion = compra.getOcupacions().iterator();
               
               while(iterOcupacion.hasNext()){
                   
                   Ocupacion ocupacion = (Ocupacion)iterOcupacion.next();
                   
                   Hibernate.initialize(ocupacion.getViajero());
               }
            }
        
        sesion.close();
        
        return viaje;
          
      }
      
      public void guardarBackup(Viajes viaje, LocalDate ahora, SessionFactory SessionBuilder){
               
        Session sesion=SessionBuilder.openSession();
        
        Date nowTime = Date.valueOf(ahora);
        
        Transaction Tx=null;
        
        boolean testigo = true;
        
        boolean testigoTwo = false;
        
        int idTarjeta = 0;
        
        
        ArrayList<Viajerobackup> viajeros = new ArrayList();
        
        String ordenHQL=("FROM Viajerobackup b WHERE b.dni IN (SELECT v.dni FROM Viajero v) order by dni");
        
        Query q=sesion.createQuery(ordenHQL);
        
        viajeros = (ArrayList<Viajerobackup>) q.list();
        
        try{
            Tx=sesion.beginTransaction();
            
                Viajesbackup viajeBackup = new Viajesbackup();

                viajeBackup.setPlazas(viaje.getPlazas());

                viajeBackup.setDia(viaje.getDia());

                viajeBackup.setHorarios(viaje.getHorarios());
                
                viajeBackup.setFechaBaja(nowTime);
                
                Iterator iterCompra = viaje.getCompras().iterator();
                
                while(iterCompra.hasNext()){
                    
                    Compra compra = (Compra)iterCompra.next();
                    
                    if(compra.getTarjeta().getId() == idTarjeta){testigoTwo = true;}
                    
                    Comprabackup compraBackup = new Comprabackup();
                    
                        compraBackup.setNumViajeros(compra.getNumViajeros());
                        
                        compraBackup.setImporteCompra(compra.getImporteCompra());
                        
                        compraBackup.setFechaPago(compra.getFechaPago());

                        compraBackup.setLocalizador(compra.getLocalizador());
                        
                        compraBackup.setViajesbackup(viajeBackup);
                        
                        compraBackup.setFechaBaja(nowTime);
                          
                        //CANNOT ADD OR UPDATE CHILD ROW
                        Tarjetabackup tarjetaBackup = new Tarjetabackup();
          
                       if(testigoTwo == false){               

                            tarjetaBackup.setCliente(compra.getTarjeta().getCliente());
                            
                            tarjetaBackup.setNum(compra.getTarjeta().getNum());
                            
                            tarjetaBackup.setCaducidad(compra.getTarjeta().getCaducidad());

                            tarjetaBackup.setCvv(compra.getTarjeta().getCvv());
                            
                            tarjetaBackup.setTipo(compra.getTarjeta().getTipo());

                            tarjetaBackup.setFechaBaja(nowTime);
                            
                            idTarjeta = compra.getTarjeta().getId();
                          
                            tarjetaBackup.setId(idTarjeta);
                            
                       }else{

                            tarjetaBackup.setCliente(compra.getTarjeta().getCliente());
                            
                            tarjetaBackup.setNum(compra.getTarjeta().getNum());
                            
                            tarjetaBackup.setCaducidad(compra.getTarjeta().getCaducidad());

                            tarjetaBackup.setCvv(compra.getTarjeta().getCvv());
                            
                            tarjetaBackup.setTipo(compra.getTarjeta().getTipo());
                            
                            tarjetaBackup.setFechaBaja(nowTime);
                            
                            tarjetaBackup.setId(idTarjeta);
 
                        }

                        compraBackup.setTarjetabackup(tarjetaBackup);
                        
                    Iterator iterOcupacion = compra.getOcupacions().iterator();
                    
                    while(iterOcupacion.hasNext()){
                                                
                        Ocupacion ocupacion = (Ocupacion)iterOcupacion.next();
                        
                        Ocupacionbackup ocupacionBackup = new Ocupacionbackup();
                        
                            ocupacionBackup.setImporte(ocupacion.getImporte());
                            
                            ocupacionBackup.setNumAsiento(ocupacion.getNumAsiento());
                            
                            ocupacionBackup.setFechaBaja(nowTime);
                            
                            ocupacionBackup.setComprabackup(compraBackup);
                            
                        Viajerobackup viajeroBackup = new Viajerobackup();
                        
                            viajeroBackup.setDni(ocupacion.getViajero().getDni());
                            
                            for(int i=0; i < viajeros.size(); i++){
                                
                                if(viajeroBackup.getDni().equals(viajeros.get(i).getDni())){

                                    testigo = false;
                                    
                                    viajeroBackup.setNombre(viajeros.get(i).getNombre());

                                    viajeroBackup.setApellido(viajeros.get(i).getApellido());

                                    viajeroBackup.setFechaBaja(nowTime);

                                    viajeroBackup.setId(viajeros.get(i).getId());

                                    ocupacionBackup.setViajerobackup(viajeroBackup);

                                    ocupacionBackup.setComprabackup(compraBackup);

                                    compraBackup.setOcupacionbackup(ocupacionBackup);
                                    
                                }
                                
                            }

                            if(testigo == true){
                                
                                viajeroBackup.setNombre(ocupacion.getViajero().getNombre());

                                viajeroBackup.setApellido(ocupacion.getViajero().getApellidos());

                                viajeroBackup.setFechaBaja(nowTime);

                                ocupacionBackup.setViajerobackup(viajeroBackup);
                                
                                ocupacionBackup.setComprabackup(compraBackup);
                        
                                compraBackup.setOcupacionbackup(ocupacionBackup);
                            }
                            
                            testigo = true;
                    }
                    
                    viajeBackup.setComprabackup(compraBackup);
                }
                
                sesion.clear();
                
                sesion.saveOrUpdate(viajeBackup);
            
            Tx.commit();
            
        }catch(HibernateException HE){
        
        HE.printStackTrace();
        
        if(Tx!=null){      
            Tx.rollback();
        } throw HE;
            }
         finally{
         sesion.close();
        }
     }
      
      public void borrarViaje(Viajes viaje, SessionFactory SessionBuilder){    
        Session sesion=SessionBuilder.openSession();
        
        ArrayList<Viajero> viajeros = new ArrayList();

        Transaction Tx=null;
        
        try{
            Tx=sesion.beginTransaction();
          
            sesion.delete(viaje);
            
            String ordenHQL = ("FROM Viajero v WHERE v.id NOT IN (SELECT o.viajero FROM Ocupacion o)");
            Query q = sesion.createQuery(ordenHQL);
            
            viajeros = (ArrayList)q.list();
            
            for(int i=0; i < viajeros.size(); i++){
                sesion.delete(viajeros.get(i));
            }
            
            Tx.commit();
            
        }catch(HibernateException HE){
        
        HE.printStackTrace();
        
        if(Tx!=null){      
            Tx.rollback();
        } throw HE;
            }
         finally{
         sesion.close();
        }
     }
      
      
      /*
      public Viajes buscarViajeHora(SessionFactory SessionBuilder){
          
        Session sesion=SessionBuilder.openSession();
        
        String ordenSQL =("SELECT DISTINCT * FROM viajes v INNER JOIN horarios h ON v.idHorario = h.id INNER JOIN ruta r ON h.idRuta = r.id INNER JOIN estacion e ON r.idOrigen = (SELECT id FROM estacion WHERE localidad = "+origen+") AND r.idDestino = (SELECT id FROM estacion WHERE localidad = "+destino+") AND h.horaSalida = "+hora+"");
        
        SQLQuery q=(SQLQuery) sesion.createSQLQuery(ordenSQL);
        
        Viajes viaje = (Viajes)q.uniqueResult();
        
        sesion.close();
        
        return viaje;
        
      } */
}   