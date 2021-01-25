$( document ).ready(function() {
       $('button[type="submit"]').click(function(e){
       		$('#contactBooking').validate({ // initialize the plugin
			rules: {
				name: {
					required: true
				},
				email: {
					required: true,
					email: true
				},
				phone: {
					required: true
				},
				arival_date: {
					required: true
				},
				departure_date: {
					required: true
				},
				chooseAdults: {
					required: true
				},
				chooseChildren: {
					required: true
				},
				message: {
					required: true
				}
			},
			submitHandler: function (form) { 
				// sending value with ajax request
				$.post($(form).attr('action'), $(form).serialize(), function (response) {
					$(form).parent('div').append(response);
					$(form).find('input[type="text"]').val('');
					$(form).find('input[type="email"]').val('');
					$(form).find('textarea').val('');
				});
				return false;
			}
		});
       		});
});