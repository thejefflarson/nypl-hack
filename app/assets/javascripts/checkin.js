// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function(){

	var $container = $('#masonjar');

	$container.imagesLoaded( function(){
	  $container.masonry({
	    itemSelector : '.box'
	  });
	});
})