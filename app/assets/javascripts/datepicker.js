//$(document).on 'turbolinks:load', ->
// $(".datepicker").datepicker({ dateFormat: 'yy-mm-dd' });

/*Validaciones para el proyecto*/
(function() {
  $(document).on('turbolinks:load', function() {
    return $(".datepicker").datepicker({
      dateFormat: 'yy-mm-dd'
    }).on("change", function() {
    	var input1 = $("#proyecto_proy_fechainicio");
    	var input2 =  $("#proyecto_proy_fechafinalizacion");
    	var error_element=$("span", input1.parent().parent());
    	/*Validaciones del proyecto*/
    	validarFecha(input1,input2,error_element);
    	/*Validaciones del sprint*/
    	input1 = $("#sprint_sprint_fechainicio");
    	input2 = $("#sprint_sprint_fechafinalizacion");
    	error_element=$("span", input1.parent().parent());
    	validarFecha(input1,input2,error_element);
  });
  });

}).call(this);

function validarFecha(input1, input2, error_element){
	if (input1.val()!="" && input2.val()!="" && input1.val() >= input2.val()){
    		input1.removeClass("valid").addClass("invalid");
    		input2.removeClass("valid").addClass("invalid");
    		error_element.removeClass("error").addClass("error_show"); 
    	} else {
    		input1.removeClass("invalid").addClass("valid");
    		input2.removeClass("invalid").addClass("valid");
    		error_element.removeClass("error_show").addClass("error");    		
    	}
}

function display(msg) {
    window.alert(msg);
}

  $(document).on('turbolinks:load', function() {
	$("#submit").click(function(event){
		var form_data=$("#proyecto").serializeArray();
		var error_free=true;
		//for (var input in form_data){
			//var str = "#"+form_data[input]['name'];
			var str = "#proyecto_proy_fechainicio";
			var element=$(str);
			var valid=!element.hasClass("invalid");
			var error_element=$("span", element.parent().parent());
			if (!valid){error_element.removeClass("error").addClass("error_show"); error_free=false;}
			else{error_element.removeClass("error_show").addClass("error");}
		//}
		if (!error_free){
			element.focus();
			event.preventDefault(); 
		}
		else{
			//alert('No errors: Form will be submitted');
		}
	});
	/*Validación del submit del sprint*/
	$("#submit-sprint").click(function(event){
		var form_data=$("#sprint").serializeArray();
		var error_free=true;
		//for (var input in form_data){
			//var str = "#"+form_data[input]['name'];
			var str = "#sprint_sprint_fechainicio";
			var element=$(str);
			var valid=!element.hasClass("invalid");
			var error_element=$("span", element.parent().parent());
			if (!valid){error_element.removeClass("error").addClass("error_show"); error_free=false;}
			else{error_element.removeClass("error_show").addClass("error");}
		//}
		if (!error_free){
			element.focus();
			event.preventDefault(); 
		}
		else{
			//alert('No errors: Form will be submitted');
		}
	});
	}).call(this);