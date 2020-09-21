/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servicios;

import java.util.ArrayList;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;

/**
 *
 * @author Alan
 */
@WebService(serviceName = "listarRutas")
public class listarRutas {

    /**
     * Web service operation
     * @return 
     */
    @WebMethod(operationName = "obtenerRutas")
    public ArrayList<RutaService> obtenerRutas() {
        ArrayList<RutaService> listado =  new OperacionesService().obtenerRutas();
        return listado;
    }
}
