
function cargarDestinos(str) {
var xmlhttp;
    if (str === "") {
    document.getElementById("destino").innerHTML = "";
    return;
}
    if (window.XMLHttpRequest) {
        xmlhttp = new XMLHttpRequest();
        } else {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
xmlhttp.onreadystatechange = function () {
    if (xmlhttp.readyState === 4 && xmlhttp.status === 200) {
    document.getElementById("destino").innerHTML = xmlhttp.responseText;
    }
    };
xmlhttp.open("GET", "obtenerDestinos?origen=" + str, true);
xmlhttp.send();
}


function cargarViajeros() {
var xmlhttp;
    if (window.XMLHttpRequest) {
        xmlhttp = new XMLHttpRequest();
        } else {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    
xmlhttp.onreadystatechange = function () {
    if (this.readyState === 4 && this.status === 200) {
        
        if(this.responseText == "OK"){
            
            location.href="./pasoTres.jsp";
            
        }else{
            sweetAlert("¡Atención!","Complete y oculte los datos, por favor.","error");
        }
     
        
    }
    };
xmlhttp.open("GET", "crearViajeros?array=" + valores, true);
xmlhttp.send();
}