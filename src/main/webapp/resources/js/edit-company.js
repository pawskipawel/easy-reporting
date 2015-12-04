	
// jQuery 
	$(document).ready(function() {
		var MaxInputs = 2; // counting starts from 0 including 0
		var Outputcounter = count; // (must start form -1) already displayed addresses from DB ->REQUIRE INTEGRATION   
		var AddAddressButton = $("#AddAddress");
	
		var addressIndex = count+1; // variable index for list index (must start form -1): deafault addreess[index] ->REQUIRE INTEGRATION   
		
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
		
		
		// You need to use event delegation (and class selector) because those buttons don't exist on load, but are created in table 
		$(document).on('click', 'button.removebutton', function () {
			$(this).closest('table').remove();
			addressIndex--;
			Outputcounter--;
			if(Outputcounter < MaxInputs) {
	            $("#AddMoreAddressId").show();
	        }
		     return false;
		 });
		
		$(document).on('click', 'button.removeAddressFromDB', function () {
			$(this).closest('table').find("input").prop('disabled', false)
			$(this).closest('table').hide();
		     return false;
		 });
		
		// BANK ACCOUNT
		var MaxInputsBank = 2; // counting starts from 0 including 0
		var OutputcounterBank = countAccount; // (must start form -1) already displayed addresses from DB ->REQUIRE INTEGRATION   
		var bankAccountIndex = countAccount; // variable index for list index (must start form -1): deafault addreess[index] ->REQUIRE INTEGRATION   
		
		// condition for addAddress button located in general main table. 
		if(OutputcounterBank >= MaxInputsBank) {
	            $("#AddMoreBankAccountId").hide();
	        }
		
		$("#AddMoreBankAccountId").click(function (e){
			if(Outputcounter <= MaxInputs) {
		bankAccountIndex++;
		OutputcounterBank++;
		var $template = $('#bankAccountTemlate'),
        $cloneBankAccount = $template
                         .clone()
                         .removeClass('hide')
                         .removeAttr('id')                         
                         .insertBefore($template);
		// find attribute "name" insrtead "path" - reason spring convertion -other way does not working
		$cloneBankAccount
        .find('[name="bankAccount[0].accountNumber"]').attr('name', 'bankAccount[' + bankAccountIndex + '].accountNumber').end()
        .find('[name="bankAccount[0].description"]').attr('name', 'bankAccount[' + bankAccountIndex + '].description').end()
           
    	$cloneBankAccount.find("input").prop('disabled', false)
		
		 $("#AddMoreBankAccountId").show();
		 if(OutputcounterBank == MaxInputs) {
            $("#AddMoreBankAccountId").hide();
        }
		
			}
			return false;
		})
		
		// You need to use event delegation (and class selector) because those buttons don't exist on load, but are created in table 
		$(document).on('click', 'button.removeButtonBankAccount', function () {
			$(this).closest('table').remove();
			bankAccountIndex--;
			OutputcounterBank--;
			if(OutputcounterBank < MaxInputsBank) {
	            $("#AddMoreBankAccountId").show();
	        }
		     return false;
		 });
		
		$(document).on('click', 'button.removeBakAccountFromDB', function () {
			$(this).closest('table').find("input").prop('disabled', false)
			$(this).closest('table').hide();
		     return false;
		 });

	});
