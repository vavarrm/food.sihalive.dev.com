$(function() {
	
    // $( "#dialog" ).dialog();
 
	
	$('#nav-login').bind('click', function(e){
		e.preventDefault();
		$( "#dialog" ).dialog({
			width:'auto',
			resizable: false,
			modal: true,}
		).removeClass('hidden');
		// dialog.dialog( "open" );
	})

});