

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

$('.heartIcon').hover(function() {
	$(this).removeClass('glyphicon-heart-empty');
	$(this).addClass('glyphicon-heart');
}, function () {
	$(this).removeClass('glyphicon-heart');
	$(this).addClass('glyphicon-heart-empty');
});

$('.productLikes').on('click', function() {
	url = event.target.id + "/newlike"
	$.ajax({
		url: url,
		method: 'post',
	})
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

