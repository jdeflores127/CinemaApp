/**
 * 
 */

function modificarEstatus(estatus){
	alert("entra a js");
	if(estatus.localeCompare("Activa")==0)
		{
			document.getElementById("Activa").selected=true;
			alert("entra activa");
		}
	else
		{
			document.getElementById("Inactiva").selected=true;
			alert("entra Inactiva");

		}
}
function InicializaDatePicker(){
	alert("Inicializa Date picker");
	$('#fechaEstreno').datepicker({
		showAnim: "fold",
		dateFormat: "dd/mm/yyyy"
	});
}