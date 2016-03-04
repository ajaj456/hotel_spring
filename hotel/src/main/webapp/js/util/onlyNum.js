$(document).ready(function() {
	$(".onlynum").keyup(function() {
		$(this).val($(this).val().replace(/[^0-9]/g, ""));
	});
	$(".onlyeng").keyup(function() {
		$(this).val($(this).val().replace(/[^\!-z]/g, ""));
	});

});