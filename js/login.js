$(function() {
	$('.resp-tabs-list li').bind('click', function(e){
		e.preventDefault();
		var action = $(this).data('action');
		$('.'+action+'-div').addClass('hide');
		$('.'+action+'-div').removeClass('hide');
	})
	
	var action = $('.resp-tab-active').data('action');
	$('.'+action+'-div').addClass('hide');
	$('.'+action+'-div').removeClass('hide');
});