
window.location.hash="no-back-button";
window.location.hash="Again-No-back-button";
window.onhashchange=function(){window.location.hash="no-back-button"}


//ASIENTOS
let max = document.getElementById("maxValue").value;
let valores = new Array(max);
function collapse(number, button){
    
    let content = document.getElementById("content-" + number);
    let otherButton = document.getElementsByClassName("colapsable");
    if(button.classList.contains("active")){

        //oculta    
        let active = document.getElementById(content.id);
        let inputs = active.getElementsByClassName("inputAsiento");
      
        valores[number] = [];   
        for (let i=0; i < inputs.length; i++){
            if (inputs[i].value === ""){
                sweetAlert("¡Atención!", "Termine de rellenar los campos, por favor.", "error");
                return;
            }else{
                valores[number].push(inputs[i].value);
            }
        }
        
        // vuelve a activar los otros pasajeros
        for(let j = 0; j < otherButton.length; j++){
            otherButton[j].disabled = false;
        }
        
        content.style.display = "none";
        content.style.maxHeight = "0px";
        button.childNodes[1].setAttribute("class","fas fa-plus");
      
    }else{
        
        //muestra
        
        // desactiva los otros pasajeros
        for(let j = 0; j < otherButton.length; j++){
            otherButton[j].disabled = true;
        }
        button.disabled = false;
        
        content.style.display = "flex";
        content.style.maxHeight = "100px";
        button.childNodes[1].setAttribute("class","fas fa-minus");
      
      
    }
    button.classList.toggle("active"); 
    
    
    
}

let asientosOcupados = [];
function comprobarAsiento(select, max){
    
    let plaza = document.getElementsByClassName("plazas");
    
    asientosOcupados.push(select.value);
    for(let n = 0; n < plaza.length; n++){
        let option = plaza[n].childNodes;
        for(let k = 0; k < option.length; k++){
            if(option[k].nodeName === "OPTION"){
                if(option[k].getAttribute("value") === select.value){
                    if(select.value !== plaza[n].value){
                        option[k].disabled = true;
                    }
                }
            }
        }
    }
    
}

//REDIRECT

function redirect(ruta){
    location.assign(ruta);
}

//VALIDAR

function validarDNI(value,id) {
  let idField = document.getElementById(id);
  let blanco = "";
  let validChars = 'TRWAGMYFPDXBNJZSQVHLCKET';
  let nifRexp = /^[0-9]{8}[TRWAGMYFPDXBNJZSQVHLCKET]{1}$/i;
  let nieRexp = /^[XYZ]{1}[0-9]{7}[TRWAGMYFPDXBNJZSQVHLCKET]{1}$/i;
  let str = value.toString().toUpperCase();

  if (!nifRexp.test(str) && !nieRexp.test(str)) {
      
        sweetAlert("¡Atención!","El DNI o NIE es erróneo.","error");
  
        idField.value = blanco;
    };

  let nie = str
    .replace(/^[X]/, '0')
    .replace(/^[Y]/, '1')
    .replace(/^[Z]/, '2');

  let letter = str.substr(-1);
  let charIndex = parseInt(nie.substr(0, 8)) % 23;

  if (validChars.charAt(charIndex) !== letter) {
      
    sweetAlert("¡Atención!","El DNI o NIE es erróneo.","error");
  
    idField.value = blanco;
  }
}

function validarTarjetas(){
  
  let dato = document.getElementById("tarjetaNum").value;
  let inputForm = document.getElementById("tipoTarjeta");
  let blanco = "";
 
  let tipo = "";
     
  if (dato.match(/^4\d{3}-?\d{4}-?\d{4}-?\d{4}$/)){
      
    tipo = "Visa";
        
    inputForm.value=tipo;
      
}else if (dato.match(/^5[1-5]\d{2}-?\d{4}-?\d{4}-?\d{4}$/)){
    
    tipo = "MasterCard";
     
    inputForm.value=tipo;

}else{
    
    tipo = "noValido";
    
    inputForm.value=tipo;
    
    dato.value = blanco;
    inputForm.setAttribute("name","tipoTarjeta");
  
    alert("Lo sentimos, la tarjeta no es válida.");
    }
}

//COMPROBAR VIAJE

function comprobarPlazas(value){
    
    if(value === 0){
        sweetAlert("Lo sentimos","Este viaje no tiene plazas libres","error");
    }else{
        document.getElementById("botonEnvio").click();
    }
}

//ICONO CLAVES

function mostrarClave(){
    let password = document.getElementById("password");
    let boton = document.getElementById("showpass");
    password.type = "text";
    boton.setAttribute("class", "fas fa-eye-slash showPassword");
}

function ocultarClave(){
    let password = document.getElementById("password");
    let boton = document.getElementById("showpass");
    password.type = "password";
    boton.setAttribute("class", "fas fa-eye showPassword");
}

//SWEET-ALERTS

function sweetAlert (titulo, texto, icono = "success"){
    Swal.fire({
        title: titulo,
        text: texto,
        icon: icono,
        showClass: {
            popup: 'animated fadeInDown faster'
      },
       hideClass: {
    popup: 'animated fadeOutUp faster'
  }
    });
}

function formRegistro(){
        Swal.fire({
        title: "Antes de nada.",
        text:"¿Desea usar la información de algún viajero?" ,
        confirmButtonColor: '#009c8c',
        cancelButtonColor: '#cc0000',
        showCloseButton: true,
        showCancelButton: true,
        icon:"question",
        /*customClass:{
            confirmButton: 'buttonClass'
        },
         buttonsStyling: false, */
        showClass: {
            popup: 'animated lightSpeedIn faster'
      },
       hideClass: {
    popup: 'animated lightSpeedOut faster'
  },
   cancelButtonText: 'No',
   confirmButtonText: 'Vale'
    }).then((result) => {
      if (result.value) {
        viajerosRegistro();
      }else if (
    result.dismiss === Swal.DismissReason.cancel
    ){
     registroUsuario();
    } 
    });  
}

function viajerosRegistro(){
    let options = crearOptionsViajeros();
    
    Swal.fire({
        title: "Elija el viajero",
        html:`<select id="viajeroRegistro">${options}</select>`,
        confirmButtonColor: '#009c8c',
        showCloseButton: true,
        icon:"info",
        customClass:{
            confirmButton: 'buttonClass'
        },
        showClass: {
            popup: 'animated lightSpeedIn faster'
      },
       hideClass: {
    popup: 'animated lightSpeedOut faster'
  },
   confirmButtonText: 'Seleccionar'
    }).then((result) => {
      if (result.value) {
          
        let elegido = document.getElementById("viajeroRegistro").value;
        
         registroUsuario(elegido);
      }
    });  
}

function crearOptionsViajeros(){
    let viajerosData = document.getElementsByClassName("viajerosData");
    let cadenaOptions = "";
    let posi = 2;
   
        for(let i=0; i < (viajerosData.length/3); i++){
            
            if (cadenaOptions == ""){
                cadenaOptions = `<option value="${viajerosData[posi].value}">${viajerosData[posi].value}</option>`;
            }else{
                cadenaOptions += `
    <option value="${viajerosData[posi].value}">${viajerosData[posi].value}</option>`;
            }
           posi += 3;
        }
    return cadenaOptions;
}

function registroUsuario(elegido = ""){
    
    if (elegido == ""){
       Swal.fire({
        title: "Rellene los campos",
        text:"Has de rellenar todos." ,
        confirmButtonColor: '#009c8c',
        showCloseButton: true,
        html:`<div style="display:flex; flex-direction:column; justify-content:center">
<span style="padding:10px;; width="500px"> DNI: <input style="width:150px; margin:2px" type="text" maxlength="9" id="DNI" class="DNI" name="formMember" onblur="validarDNI(value,this.id)" required </span>
<span style="padding:10px"; width="500px"> Nombre: <input style="width:150px; margin:2px" type="text" maxlength="20" id="nombre" name="formMember" required> </span>
<span style="padding:10px"; width="500px"> Apellido: <input style="width:150px; margin:2px" type="text" maxlength="30" id="apellido" name="formMember" required> </span>
<span style="padding:10px"; width="500px"> Clave: <input style="width:150px; margin:2px" type="password" maxlenght="50" id="clave" name="formMember" required> </span>
<span style="padding:10px"; width="500px"> Telefono: <input style="width:150px; margin:2px"  type="text" maxlenght="9" id="telefono" name="formMember" pattern="[0-9]{9}" required> </span>
<span style="padding:10px"; width="500px"> Email: <input style="width:150px; margin:2px" required name="formMember" type="email" id="email" title="Introduzca un correo válido." required> </span>
</div>`,
        showClass: {
            popup: 'animated lightSpeedIn faster'
      },
       hideClass: {
    popup: 'animated lightSpeedOut faster'
  },
   confirmButtonText: 'Registrar'
    }).then((result) => {
        if (result.value){
        let datos = document.getElementsByName("formMember");
        for(let i=0; i <datos.length; i++){
            if(datos[i].value == ""){
            sweetAlert("Lo sentimos","Ha de rellenar todos los campos","error");}}
        let cliente = {
            dni: document.getElementById("DNI").value,
            nombre: document.getElementById("nombre").value,
            apellido: document.getElementById("apellido").value,
            clave: document.getElementById("clave").value,
            telefono: document.getElementById("telefono").value,
            email: document.getElementById("email").value
        };
      createTarjeta(cliente);
       }
    }); 
}else{

    let viajerosData = document.getElementsByClassName("viajerosData");
    console.log(viajerosData);
    let dni = "";
    let apellido = "";
    
        for(let i=0; i < viajerosData.length; i++){
            
            if (viajerosData[i].value === elegido){
                
                dni = viajerosData[i-2].value;
                apellido = viajerosData[i-1].value;
            }
        }
   /*   <i id="showpass" onmousedown="mostrarClave()" onmouseup="ocultarClave()"  class="fas fa-eye"></i>*/
      Swal.fire({
        title: "Rellene los campos",
        confirmButtonColor: '#009c8c',
        showCloseButton: true,
        html:`<div style="display:flex; flex-direction:column; justify-content:center"> 
<span style="padding:10px; width:500px"> DNI: <input style="width:150px" name="formMember" type="text" readonly maxlength="9" id="DNI" value="${dni}"> </span>
<span style="padding:10px"; width:500px"> Nombre: <input style="width:150px" name="formMember" type="text" readonly maxlength="20" id="nombre" value="${elegido}" required> </span>
<span style="padding:10px"; width:500px"> Apellido: <input style="width:150px" name="formMember" type="text" readonly maxlength="30" id="apellido" value="${apellido}" required> </span>
<span style="padding:10px"; width:500px"> Clave: <input style="width:150px" name="formMember" type="password" maxlength="30" id="clave" required></span>
<span style="padding:10px"; width:500px"> Telefono: <input style="width:150px" name="formMember" type="text" maxlength="9" id="telefono" pattern="[0-9]{9}" title="Ha de introducir un numero válido." required> </span>
<span style="padding:10px"; width:500px"> Email: <input style="width:150px" name="formMember" type="email" title="Introduzca un correo válido." id="email" required> </span>
</div>`,
        showClass: {
            popup: 'animated lightSpeedIn faster'
      },
       hideClass: {
    popup: 'animated lightSpeedOut faster'
  },
   confirmButtonText: 'Registrar'
    }).then((result) => {
        
    let datos = document.getElementsByName('formMember');
    
       
    for(let i=0; i < datos.length; i++){        
    if(datos[i].value == ""){sweetAlert("Lo sentimos", "Ha de introducir los datos solicitados.","error");}}
        if (result.value) {
          let cliente = {
              dni: document.getElementById("DNI").value,
              nombre: document.getElementById("nombre").value,
              apellido: document.getElementById("apellido").value,
              clave: document.getElementById("clave").value,
              telefono: document.getElementById("telefono").value,
              email: document.getElementById("email").value
            };
          createTarjeta(cliente);
        }
    });
    }
     
}

function createOnlyTarjeta(){
     Swal.fire({
        title: "¿Cómo es la tarjeta nueva?",
        showConfirmButton: false,
        showCloseButton: true,
        html:`<form action="./crearTarjeta">
 
 <div style="display:flex; flex-direction:column">
    <i class="far fa-credit-card" style="margin-bottom:10px;"></i><input type="text" maxlength="19" id="tarjetaNum" placeholder="Número de Tarjeta" name="numeroTarjeta" required title="Ha de introducir un número de tarjeta válido." onblur="validarTarjetas()" style="width:45%; margin-bottom:20px; margin-left:auto; margin-right:auto">
        
    <i class="fas fa-user-shield" style="margin-bottom:10px;"></i><input type="text" placeholder="Nombre Titular" maxlength="10" name="nombreTarjeta" required style="width:45%; margin-bottom:20px; margin-left:auto; margin-right:auto">
        
        <i class="fas fa-calendar-times" style="margin-bottom:10px;"></i><input type="month" pattern="[0-1]{1}[0-9]{1}/[0-9]{4}" title="Introduzca [MM]/[YYYY]" name="fechaTarjeta" required style="width:45%; margin-bottom:20px; margin-left:auto; margin-right:auto">
        
        <i class="fab fa-keycdn" style="margin-bottom:10px;"></i><input type="text" pattern="[0-9]{3}" title="Han de ser tres dígitos." placeholder="CVV" name="cvvTarjeta" required style="width:45%; margin-left:auto; margin-bottom:20px; margin-right:auto">
        
         <input type="hidden" name="tipoTarjeta" id="tipoTarjeta">
        
        <button style="margin-top:10px; margin-right:auto; margin-left:auto" type="submit"> Añadir </button>
  </div>      
</form>`,
        showClass: {
            popup: 'animated lightSpeedIn faster'
      },
       hideClass: {
    popup: 'animated lightSpeedOut faster'
  }
    });

}

function createTarjeta(cliente){
     Swal.fire({
        title: "¡Solo queda su tarjeta!",
        confirmButtonColor: '#009c8c',
        showCloseButton: true,
        showConfirmButton: false,
        html:`<form action="./crearClientes"><div> 
<span><input type="hidden" "maxlenght="9" name="DNI" value="${cliente.dni}" onclick="validarDNI(value) </span>">
<span><input type="hidden" maxlenght="20" name="nombre" value="${cliente.nombre}" required> </span>
<span><input type="hidden" maxlenght="30" name="apellido" value="${cliente.apellido}" required> </span>
<span><input type="hidden" maxlenght="50" name="clave" value="${cliente.clave}" required> </span>
<span><input type="hidden" name="telefono" value="${cliente.telefono}" required> </span>
<span><input type="hidden" value="${cliente.email}" name="email" required> </span>
    <input type="hidden" name="tipoTarjeta" id="tipoTarjeta">
</div>
 
 <div style="display:flex; flex-direction:column">
    <i class="far fa-credit-card" style="margin-bottom:10px;"></i><input type="text" maxlenght="19" id="tarjetaNum" placeholder="Número de Tarjeta" name="numeroTarjeta" required title="Ha de introducir un número de tarjeta válido." onblur="validarTarjetas()" style="width:45%; margin-bottom:20px; margin-left:auto; margin-right:auto">
        
    <i class="fas fa-user-shield" style="margin-bottom:10px;"></i><input type="text" placeholder="Nombre Titular" maxlenght="20" name="nombreTarjeta" required style="width:45%; margin-bottom:20px; margin-left:auto; margin-right:auto">
        
        <i class="fas fa-calendar-times" style="margin-bottom:10px;"></i><input type="month" placeholder="Fecha Caducidad" pattern="[0-1]{1}[0-9]{1}/[0-9]{4}" title="Introduzca [MM]/[YYYY]" name="fechaTarjeta" required style="width:45%; margin-bottom:20px; margin-left:auto; margin-right:auto">
        
        <i class="fab fa-keycdn" style="margin-bottom:10px;"></i><input type="text" pattern="[0-9]{3}" title="Han de ser tres dígitos" placeholder="CVV" name="cvvTarjeta" required style="width:45%; margin-left:auto; margin-bottom:20px; margin-right:auto">
        
        <button style="margin-top:10px; margin-right:auto; margin-left:auto" type="submit"> Agregar </button>
  </div>      
</form>`,
        showClass: {
            popup: 'animated lightSpeedIn faster'
      },
       hideClass: {
    popup: 'animated lightSpeedOut faster'
  }
    });
}

function confirmarCVV(cvv){
    
    Swal.fire({
        title: "Introduzca el CVV",
        html:`<input id="cvvInserted" type="text" maxlength="3"></input>`,
        confirmButtonColor: '#009c8c',
        showCloseButton: true,
        icon:"question",
        customClass:{
            confirmButton: 'buttonClass'
        },
        showClass: {
            popup: 'animated lightSpeedIn faster'
      },
       hideClass: {
    popup: 'animated lightSpeedOut faster'
  },
   confirmButtonText: 'Comprobar'
    }).then((result) => {
      if (result.value) {
          
          if(document.getElementById("cvvInserted").value != ""){
           
                if(document.getElementById("cvvInserted").value == cvv){         
                    redirect('./crearCompra');
                }else{
                    sweetAlert("Lo sentimos","El CVV no es correcto.", "error");
                }
            }else{
                
                sweetAlert("Lo sentimos","Debe de introducir el CVV", "error");
            }
      }
    });  
}
