$(document).ready(function() {	
		var MaxInputs = 2;
		var InputsWrapper   = $("#AddAddressesList"); 
		var AddAddressButton = $("#AddAddress");
		var x = InputsWrapper.length;
		var FieldCount=1; 
		
		$(AddAddressButton).click(function (e) {
			
			if(x <= MaxInputs) {
				FieldCount++; //text box added ncrement
				$(InputsWrapper).append('<p> Dodano addres </p>');
				 x++; //text box increment
				 
				 $("#AddMoreAddressId").show();
		            
		         $('AddMoreFileBox').html("Add field");
			}
			return false;
		});
		
		
		
	});