
package servicios;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.annotation.XmlElementDecl;
import javax.xml.bind.annotation.XmlRegistry;
import javax.xml.namespace.QName;


/**
 * This object contains factory methods for each 
 * Java content interface and Java element interface 
 * generated in the servicios package. 
 * <p>An ObjectFactory allows you to programatically 
 * construct new instances of the Java representation 
 * for XML content. The Java representation of XML 
 * content can consist of schema derived interfaces 
 * and classes representing the binding of schema 
 * type definitions, element declarations and model 
 * groups.  Factory methods for each of these are 
 * provided in this class.
 * 
 */
@XmlRegistry
public class ObjectFactory {

    private final static QName _ObtenerRutas_QNAME = new QName("http://Servicios/", "obtenerRutas");
    private final static QName _ObtenerRutasResponse_QNAME = new QName("http://Servicios/", "obtenerRutasResponse");

    /**
     * Create a new ObjectFactory that can be used to create new instances of schema derived classes for package: servicios
     * 
     */
    public ObjectFactory() {
    }

    /**
     * Create an instance of {@link ObtenerRutas }
     * 
     */
    public ObtenerRutas createObtenerRutas() {
        return new ObtenerRutas();
    }

    /**
     * Create an instance of {@link ObtenerRutasResponse }
     * 
     */
    public ObtenerRutasResponse createObtenerRutasResponse() {
        return new ObtenerRutasResponse();
    }

    /**
     * Create an instance of {@link RutaService }
     * 
     */
    public RutaService createRutaService() {
        return new RutaService();
    }

    /**
     * Create an instance of {@link EstacionService }
     * 
     */
    public EstacionService createEstacionService() {
        return new EstacionService();
    }

    /**
     * Create an instance of {@link HorariosService }
     * 
     */
    public HorariosService createHorariosService() {
        return new HorariosService();
    }

    /**
     * Create an instance of {@link ViajeService }
     * 
     */
    public ViajeService createViajeService() {
        return new ViajeService();
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ObtenerRutas }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://Servicios/", name = "obtenerRutas")
    public JAXBElement<ObtenerRutas> createObtenerRutas(ObtenerRutas value) {
        return new JAXBElement<ObtenerRutas>(_ObtenerRutas_QNAME, ObtenerRutas.class, null, value);
    }

    /**
     * Create an instance of {@link JAXBElement }{@code <}{@link ObtenerRutasResponse }{@code >}}
     * 
     */
    @XmlElementDecl(namespace = "http://Servicios/", name = "obtenerRutasResponse")
    public JAXBElement<ObtenerRutasResponse> createObtenerRutasResponse(ObtenerRutasResponse value) {
        return new JAXBElement<ObtenerRutasResponse>(_ObtenerRutasResponse_QNAME, ObtenerRutasResponse.class, null, value);
    }

}
