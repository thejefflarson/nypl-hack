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

})