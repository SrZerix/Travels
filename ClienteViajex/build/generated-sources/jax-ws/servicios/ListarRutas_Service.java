
package servicios;

import java.net.MalformedURLException;
import java.net.URL;
import javax.xml.namespace.QName;
import javax.xml.ws.Service;
import javax.xml.ws.WebEndpoint;
import javax.xml.ws.WebServiceClient;
import javax.xml.ws.WebServiceException;
import javax.xml.ws.WebServiceFeature;


/**
 * This class was generated by the JAX-WS RI.
 * JAX-WS RI 2.2.11-b150120.1832
 * Generated source version: 2.2
 * 
 */
@WebServiceClient(name = "listarRutas", targetNamespace = "http://Servicios/", wsdlLocation = "http://localhost:8080/Viajex/listarRutas?wsdl")
public class ListarRutas_Service
    extends Service
{

    private final static URL LISTARRUTAS_WSDL_LOCATION;
    private final static WebServiceException LISTARRUTAS_EXCEPTION;
    private final static QName LISTARRUTAS_QNAME = new QName("http://Servicios/", "listarRutas");

    static {
        URL url = null;
        WebServiceException e = null;
        try {
            url = new URL("http://localhost:8080/Viajex/listarRutas?wsdl");
        } catch (MalformedURLException ex) {
            e = new WebServiceException(ex);
        }
        LISTARRUTAS_WSDL_LOCATION = url;
        LISTARRUTAS_EXCEPTION = e;
    }

    public ListarRutas_Service() {
        super(__getWsdlLocation(), LISTARRUTAS_QNAME);
    }

    public ListarRutas_Service(WebServiceFeature... features) {
        super(__getWsdlLocation(), LISTARRUTAS_QNAME, features);
    }

    public ListarRutas_Service(URL wsdlLocation) {
        super(wsdlLocation, LISTARRUTAS_QNAME);
    }

    public ListarRutas_Service(URL wsdlLocation, WebServiceFeature... features) {
        super(wsdlLocation, LISTARRUTAS_QNAME, features);
    }

    public ListarRutas_Service(URL wsdlLocation, QName serviceName) {
        super(wsdlLocation, serviceName);
    }

    public ListarRutas_Service(URL wsdlLocation, QName serviceName, WebServiceFeature... features) {
        super(wsdlLocation, serviceName, features);
    }

    /**
     * 
     * @return
     *     returns ListarRutas
     */
    @WebEndpoint(name = "listarRutasPort")
    public ListarRutas getListarRutasPort() {
        return super.getPort(new QName("http://Servicios/", "listarRutasPort"), ListarRutas.class);
    }

    /**
     * 
     * @param features
     *     A list of {@link javax.xml.ws.WebServiceFeature} to configure on the proxy.  Supported features not in the <code>features</code> parameter will have their default values.
     * @return
     *     returns ListarRutas
     */
    @WebEndpoint(name = "listarRutasPort")
    public ListarRutas getListarRutasPort(WebServiceFeature... features) {
        return super.getPort(new QName("http://Servicios/", "listarRutasPort"), ListarRutas.class, features);
    }

    private static URL __getWsdlLocation() {
        if (LISTARRUTAS_EXCEPTION!= null) {
            throw LISTARRUTAS_EXCEPTION;
        }
        return LISTARRUTAS_WSDL_LOCATION;
    }

}
