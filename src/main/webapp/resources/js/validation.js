
$(document).ready(function() {
	
	/*
	 * Register new user validation
	 * user-register.jsp
	 */
	
	$(".registrationForm").validate(
		{
			rules: {
				name: {
					required : true,
					minlength : 3,
					remote : {
						url: window.location.protocol +"/easy-reporting/register/available.html",
						type: "get", 
						data: {
							username: function() {
								return $("#name").val();
							}
						}
					}
				},
				email: {
					required : true,
					email: true
				},
				password: {
					required : true,
					minlength : 5
				},
				
				password_again: {
					required : true,
					minlength : 5,
					equalTo: "#password"
				}
				
			},
			highlight: function(element) {
				$(element).closest('.form-group').removeClass('has-success').addClass('has-error');
			},
			unhighlight: function(element) {
				$(element).closest('.form-group').removeClass('has-error').addClass('has-success');
			},  
			messages: {
				name: {
					remote: "Such username already exists!"
				}
			}

		}
	);


	/*
	 * Register new user validation
	 * user-register.jsp
	 */
	
	$(".companyForm").validate(
			{
				rules: {
					companyName: {
						required : true,
						minlength : 3,
						maxlength : 15
					},
				
				
				email: {
					required : true,
					email: true
				},
				
				nip: {
				remote : {
					url: window.location.protocol + "/easy-reporting/user-settings/edit-company/isnipcorrect.html",
					type: "get", 
					data: {
						nip: function() {
							return $("#nip").val();
						}
					}
				}
				},
				
				},
				highlight: function(element) {
					$(element).closest('.form-group').removeClass('has-success').addClass('has-error');
				},
				unhighlight: function(element) {
					$(element).closest('.form-group').removeClass('has-error').addClass('has-success');
				},  
				messages: {
					nip: {
						remote: "incorrect NIP"
					}
				}
				
			}
		);
	
	
});


