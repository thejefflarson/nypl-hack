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
		window.location.href = "https://foursquare.com/app/nypl-time-traveller/CEWXPJBX0AFPI0Y3YC1JLKKQON4OOYHKSYFERVPTJDMK0MF5";
	})

})
