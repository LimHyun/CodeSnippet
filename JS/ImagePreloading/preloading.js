// Common Images
var imageArray = [
'http://Server/File.jpg'
,'http://Server/File2.jpg'
,'http://Server/File3.jpg'
];

// onReady Event
$(document).ready(function () {
	// create hidden tag
	var hidden = $('body').append('<div id="img-cache" style="display:none" />').children('#img-cache');
	
	// Preload Common Images
	$.each(imageArray, function (i, val) {
		$('<img/>').attr('src', val).appendTo(hidden);
	});
});
