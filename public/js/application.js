

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
	productId = event.target.id
	url = "/" + productId + "/newlike"
	$.ajax({
		url: url,
		method: 'post',
		success: function () {
			$.ajax({
				url: '/api/products/' + productId,
				method: 'get',
				dataType: 'json'
			}).done(function (product) {
				$('.' + productId + 'likeNumber').html(product.likes)
			})
		}
	})
});

$(document).ready(function() {

	var $container = $('#feed');
	// initialize Masonry after all images have loaded
	$container.imagesLoaded( function() {
	  $container.masonry({
	  	columnWidth: 340,
	  	gutter: 10,
			itemSelector: '.item'
	  });
	});

// display sign up modal if user is not signed in
$('#signUpModal').modal()

});

