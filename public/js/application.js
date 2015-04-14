

// $('#newProductButton').on('click', function() {
// 	var $category = $('#categoryId').val();
// 	console.log($category);

// });

// Add new text field in new_product if a new category is selected.
$('#categoryId').on( 'change', function() {
	if ( $('#categoryId').val() != 99 ) {
		$('#newCategory').hide();
	} else {
		$('#newCategory').show();
	};
});
