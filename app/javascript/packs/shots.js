document.addEventListener("turbolinks:load", function() {

	var Shots = {
		shotHover() {
			$('.shot').hover(function() {
				$(this).children('.shot-data').toggleClass('visible');
			});
		}
	};
	Shots.shotHover();
});