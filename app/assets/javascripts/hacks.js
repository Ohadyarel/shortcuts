$(document).ready(function(){
	// array of tags 
	var tagArray=[]
	$("#tag-array").val(tagArray)
	$("#submit-tag").on('click',function(e) {
    tagArray.push($("#tag").val());
    $("#tags").append("<p id='cloud'>"+ $("#tag").val() + "<span class='del-tag'> X</span>" + "</p>");
    $("#tag").val("");
		$(".del-tag").on('click',function(e) {
			$(this).parent().remove();
		});
		// replace the tag-array with the values of the array
		if (tagArray.length != 0) {
			$("#tag-array").val(tagArray)
		}
	});
	
})