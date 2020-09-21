
package servicios;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Clase Java para rutaService complex type.
 * 
 * <p>El siguiente fragmento de esquema especifica el contenido que se espera que haya en esta clase.
 * 
 * <pre>
 * &lt;complexType name="rutaService"&gt;
 *   &lt;complexContent&gt;
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType"&gt;
 *       &lt;sequence&gt;
 *         &lt;element name="distancia" type="{http://www.w3.org/2001/XMLSchema}int"/&gt;
 *         &lt;element name="duracion" type="{http://www.w3.org/2001/XMLSchema}string" minOccurs="0"/&gt;
 *         &lt;element name="estacionDestino" type="{http://Servicios/}estacionService" minOccurs="0"/&gt;
 *         &lt;element name="estacionOrigen" type="{http://Servicios/}estacionService" minOccurs="0"/&gt;
 *         &lt;element name="horarios" type="{http://Servicios/}horariosService" maxOccurs="unbounded" minOccurs="0"/&gt;
 *         &lt;element name="id" type="{http://www.w3.org/2001/XMLSchema}int" minOccurs="0"/&gt;
 *         &lt;element name="precio" type="{http://www.w3.org/2001/XMLSchema}int"/&gt;
 *       &lt;/sequence&gt;
 *     &lt;/restriction&gt;
 *   &lt;/complexContent&gt;
 * &lt;/complexType&gt;
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "rutaService", propOrder = {
    "distancia",
    "duracion",
    "estacionDestino",
    "estacionOrigen",
    "horarios",
    "id",
    "precio"
})
public class RutaService {

    protected int distancia;
    protected String duracion;
    protected EstacionService estacionDestino;
    protected EstacionService estacionOrigen;
    @XmlElement(nillable = true)
    protected List<HorariosService> horarios;
    protected Integer id;
    protected int precio;

    /**
     * Obtiene el valor de la propiedad distancia.
     * 
     */
    public int getDistancia() {
        return distancia;
    }

    /**
     * Define el valor de la propiedad distancia.
     * 
     */
    public void setDistancia(int value) {
        this.distancia = value;
    }

    /**
     * Obtiene el valor de la propiedad duracion.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getDuracion() {
        return duracion;
    }

    /**
     * Define el valor de la propiedad duracion.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setDuracion(String value) {
        this.duracion = value;
    }

    /**
     * Obtiene el valor de la propiedad estacionDestino.
     * 
     * @return
     *     possible object is
     *     {@link EstacionService }
     *     
     */
    public EstacionService getEstacionDestino() {
        return estacionDestino;
    }

    /**
     * Define el valor de la propiedad estacionDestino.
     * 
     * @param value
     *     allowed object is
     *     {@link EstacionService }
     *     
     */
    public void setEstacionDestino(EstacionService value) {
        this.estacionDestino = value;
    }

    /**
     * Obtiene el valor de la propiedad estacionOrigen.
     * 
     * @return
     *     possible object is
     *     {@link EstacionService }
     *     
     */
    public EstacionService getEstacionOrigen() {
        return estacionOrigen;
    }

    /**
     * Define el valor de la propiedad estacionOrigen.
     * 
     * @param value
     *     allowed object is
     *     {@link EstacionService }
     *     
     */
    public void setEstacionOrigen(EstacionService value) {
        this.estacionOrigen = value;
    }

    /**
     * Gets the value of the horarios property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the horarios property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getHorarios().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link HorariosService }
     * 
     * 
     */
    public List<HorariosService> getHorarios() {
        if (horarios == null) {
            horarios = new ArrayList<HorariosService>();
        }
        return this.horarios;
    }

    /**
     * Obtiene el valor de la propiedad id.
     * 
     * @return
     *     possible object is
     *     {@link Integer }
     *     
     */
    public Integer getId() {
        return id;
    }

    /**
     * Define el valor de la propiedad id.
     * 
     * @param value
     *     allowed object is
     *     {@link Integer }
     *     
     */
    public void setId(Integer value) {
        this.id = value;
    }

    /**
     * Obtiene el valor de la propiedad precio.
     * 
     */
    public int getPrecio() {
        return precio;
    }

    /**
     * Define el valor de la propiedad precio.
     * 
     */
    public void setPrecio(int value) {
        this.precio = value;
    }

}
