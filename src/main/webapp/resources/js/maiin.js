$(document).ready(function() {
		var MaxInputs = 2;
		var InputsWrapper = $("#AddAddressesList");
		var AddAddressButton = $("#AddAddress");
		var x = InputsWrapper.length
		var addressIndex = 1; // tutaj powinna byc zmienna licznik z loopa do widoku po pobraniu z bazy 
		
		
		
		$(AddAddressButton).click(function (e){
			if(x <= MaxInputs) {
		addressIndex++;
	
		var $template = $('#addressTemlate'),
         $clone    = $template
                         .clone()
                         .removeClass('hide')
                         .removeAttr('id')
                         .attr('data-address-index', addressIndex)
                         .insertBefore($template);
		$clone
        .find('[path="addresses[0].street"]').attr('path', 'addresses[' + addressIndex + '].street').end()
        .find('[path="addresses[0].streetNumber"]').attr('path', 'addresses[' + addressIndex + '].streetNumber').end()
        .find('[path="addresses[0].zipcode"]').attr('path', 'addresses[' + addressIndex + '].zipcode').end()
        .find('[path="addresses[0].city"]').attr('path', 'addresses[' + addressIndex + '].city').end()
        
        .find('[for="addresses[0].street"]').attr('for', 'addresses[' + addressIndex + '].street').end()
        .find('[for="addresses[0].streetNumber"]').attr('for', 'addresses[' + addressIndex + '].streetNumber').end()
        .find('[for="addresses[0].zipcode"]').attr('for', 'addresses[' + addressIndex + '].zipcode').end()
        .find('[for="addresses[0].city"]').attr('for', 'addresses[' + addressIndex + '].city').end();
		
		 $("#AddMoreAddressId").show();
		
		if(addressIndex == 3) {
            $("#AddMoreAddressId").hide();
        }
		
			}
			return false;
		})
		
		
		var removeAddedAddress = $('#removeAddedAddress');
		$(removeAddedAddress).click(function (){
		$('#addDiv').closest('table').remove();
		})
		// You need to use event delegation (and class selector) because those buttons don't exist on load, but are created in table 
		$(document).on('click', 'button.removebutton', function () {
			$('#addButtonDiv').closest('table').remove();
			addressIndex--;
			if(addressIndex == addressIndex) {
	            $("#AddMoreAddressId").show();
	        }
		     return false;
		 });
		
	});