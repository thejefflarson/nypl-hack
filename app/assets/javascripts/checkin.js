// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){

	var $container = $('#masonjar');
	$container.imagesLoaded( function(){
	  $container.masonry({
	    itemSelector : '.box'
	  });
	});

	$('.connect-button').click(function(){
		window.location.href = "https://foursquare.com/app/nypl-time-traveller/GBCU0L2D1WW0PYLSX4EMZSGJ0ZRV21FKNGUCD3SIXHDKKOZN";
	})

	if (getURLParameter('success') == 1){
		$('.connect-button').text("Success! You've connected!")
	} else { }

	function getURLParameter(name) {
	    return decodeURIComponent(
	        (RegExp(name + '=' + '(.+?)(&|$)').exec(location.search)||[,null])[1]
	    );
	}

})