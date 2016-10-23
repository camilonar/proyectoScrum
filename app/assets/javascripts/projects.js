			function filtrar() {
			  // Declare variables 
			  var input, filter, table, tr, td, i;
			  input = document.getElementById("buscarProyecto");
			  filter = input.value.toUpperCase();
			  table = document.getElementById("tabla");
			  tr = table.getElementsByTagName("tr");

			  // Loop through all table rows, and hide those who don't match the search query
			  for (i = 0; i < tr.length; i++) {
			  	td = tr[i].getElementsByTagName("td")[0];
			  	if (td) {
			  		if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
			  			tr[i].style.display = "";
			  		} else {
			  			tr[i].style.display = "none";
			  		}
			  	} 
			  }
			}

	$(document).ready(function() {
    // Configure/customize these variables.
    var ellipsestext = "...";
    

    $('.more').each(function() {
    	var content = $(this).html();

    	if(content.length > showChar) {

    		var c = content.substr(0, showChar);
    		var h = content.substr(showChar, content.length - showChar);


    		$(this).html(html);
    	}

    });

    $(".morelink").click(function(){
    	if($(this).hasClass("less")) {
    		$(this).removeClass("less");
    		$(this).html(moretext);
    	} else {
    		$(this).addClass("less");
    		$(this).html(lesstext);
    	}
    	$(this).parent().prev().toggle();
    	$(this).prev().toggle();
    	return false;
    });
    });

