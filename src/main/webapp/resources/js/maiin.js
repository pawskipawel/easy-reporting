
	//Angular
	var app = angular.module('myApp', []);
	app.controller('showData', function($scope) {
		$scope.companyName = "${companyDB.companyName}";
		$scope.nip = "${companyDB.nip}";
		$scope.phone = "${companyDB.phone}";
		$scope.email = "${companyDB.email}";
	
	});

	
	// jQuery 
	$(document).ready(function() {
		var MaxInputs = 2; // counting starts from 0
		var Outputcounter = ${count}; // already displaded addresses from DB.
		var AddAddressButton = $("#AddAddress");
	
		var addressIndex = -1; // variable index for list index : addreess[index]
		
		// condition for addAddress button located in general main table. 
		if(Outputcounter >= MaxInputs) {
	            $("#AddMoreAddressId").hide();
	        }
		
		
		$(AddAddressButton).click(function (e){
			if(Outputcounter <= MaxInputs) {
		addressIndex++;
		Outputcounter++;
		var $template = $('#addressTemlate'),
         $clone    = $template
                         .clone()
                         .removeClass('hide')
                         .removeAttr('id')
                         .attr('data-address-index', addressIndex)
                         .insertBefore($template);
		// find attribute "name" insrtead "path" - reason spring convertion -other way does not working
		$clone
        .find('[name="addresses[0].street"]').attr('name', 'addresses[' + addressIndex + '].street').end()
        .find('[name="addresses[0].streetNumber"]').attr('name', 'addresses[' + addressIndex + '].streetNumber').end()
        .find('[name="addresses[0].zipcode"]').attr('name', 'addresses[' + addressIndex + '].zipcode').end()
        .find('[name="addresses[0].city"]').attr('name', 'addresses[' + addressIndex + '].city').end()
        
    	$clone.find("input").prop('disabled', false)
        
        .find('[for="addresses[0].street"]').attr('for', 'addresses[' + addressIndex + '].street').end()
        .find('[for="addresses[0].streetNumber"]').attr('for', 'addresses[' + addressIndex + '].streetNumber').end()
        .find('[for="addresses[0].zipcode"]').attr('for', 'addresses[' + addressIndex + '].zipcode').end()
        .find('[for="addresses[0].city"]').attr('for', 'addresses[' + addressIndex + '].city').end();
		
		 $("#AddMoreAddressId").show();
		 if(Outputcounter == MaxInputs) {
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
			Outputcounter--;
			if(Outputcounter < MaxInputs) {
	            $("#AddMoreAddressId").show();
	        }
		     return false;
		 });
		
	});
