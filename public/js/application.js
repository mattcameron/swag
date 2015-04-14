

// Add new text field in new_product if a new category is selected.
$('#categoryId').on( 'change', function() {
	if ( $('#categoryId').val() != 99 ) {
		$('#newCategory').hide();
	} else {
		$('#newCategory').show();
	};
});

$('.item').hover(function() {
	$(this).find('.productInfo').show();
}, function () {
	$('.productInfo').hide();
});


$(document).ready(function() {

	var $container = $('#feed');
	// initialize Masonry after all images have loaded
	$container.imagesLoaded( function() {
	  $container.masonry({
	  	gutter: 10,
			itemSelector: '.item',
	  });
	});


});

