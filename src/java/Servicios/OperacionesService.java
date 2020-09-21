package Servicios;

import java.util.ArrayList;
import org.hibernate.SessionFactory;
import DAO.NewHibernateUtil;
import POJOS.Horarios;
import POJOS.Ruta;
import POJOS.Viajes;
import java.util.Iterator;
import java.util.List;
import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.Session;

public class OperacionesService {
    
    public ArrayList<RutaService> obtenerRutas(){
    
    SessionFactory sf = NewHibernateUtil.getSessionFactory();
    Session sesion = sf.openSession();
    
    String ordenHQL = "from Ruta";
    Query q = sesion.createQuery(ordenHQL);
 
    List rutas = q.list();
    ArrayList<RutaService> rutasArray = new ArrayList();

    Iterator iterRutas = rutas.iterator();
    
        while(iterRutas.hasNext()){
            Ruta ruta = (Ruta)iterRutas.next();
                Hibernate.initialize(ruta);

                Hibernate.initialize(ruta.getHorarioses());
                Hibernate.initialize(ruta.getEstacionByIdDestino());
                Hibernate.initialize(ruta.getEstacionByIdOrigen());
         
            EstacionService estacionOrigen = new EstacionService();
            
            estacionOrigen.setDireccion(ruta.getEstacionByIdOrigen().getDireccion());
            estacionOrigen.setId(ruta.getEstacionByIdOrigen().getId());
            estacionOrigen.setLocalidad(ruta.getEstacionByIdOrigen().getLocalidad());
            estacionOrigen.setNombre(ruta.getEstacionByIdOrigen().getNombre());

            EstacionService estacionDestino = new EstacionService();
            
            estacionDestino.setDireccion(ruta.getEstacionByIdDestino().getDireccion());
            estacionDestino.setId(ruta.getEstacionByIdDestino().getId());
            estacionDestino.setLocalidad(ruta.getEstacionByIdDestino().getLocalidad());
            estacionDestino.setNombre(ruta.getEstacionByIdDestino().getNombre());
            
            RutaService rutaWeb = new RutaService();
            
            rutaWeb.setDistancia(ruta.getDistancia());
            rutaWeb.setDuracion(ruta.getDuracion().toString());
            rutaWeb.setEstacionDestino(estacionDestino);
            rutaWeb.setEstacionOrigen(estacionOrigen);
            rutaWeb.setPrecio(ruta.getPrecio());
            rutaWeb.setId(ruta.getId());

            ArrayList<HorariosService> horariosArray = new ArrayList();

            Iterator iterHorarios = ruta.getHorarioses().iterator();
            

        while(iterHorarios.hasNext()){
            Horarios horario = (Horarios)iterHorarios.next();
            Hibernate.initialize(horario.getViajeses());

            HorariosService horarioWeb = new HorariosService();

            horarioWeb.setHoraLlegada(horario.getHoraLlegada().toString());
            horarioWeb.setHoraSalida(horario.getHoraSalida().toString());
            horarioWeb.setTipo(horario.getTipo());
            horarioWeb.setId(horario.getId());
            horariosArray.add(horarioWeb);

            ArrayList<ViajeService> viajesArray = new ArrayList();
            Iterator iterViajes = horario.getViajeses().iterator();

                while(iterViajes.hasNext()){
                    Viajes viaje = (Viajes)iterViajes.next();

                    ViajeService viajesWeb = new ViajeService();

                    viajesWeb.setDia(viaje.getDia().toString());
                    viajesWeb.setId(viaje.getId());
                    viajesWeb.setPlazas(viaje.getPlazas());
                    viajesArray.add(viajesWeb);   
                }

               horarioWeb.setViajes(viajesArray);
        }

        rutaWeb.setHorarios(horariosArray);
        rutasArray.add(rutaWeb);
        }
        sesion.close();
        return rutasArray;
    }

}
