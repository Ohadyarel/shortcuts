$(document).ready(function(){
	// array of tags 
	var tagArray=[]
	// $("#tag-array").val(tagArray)
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

	// autocomplete for search bar
	$('#search').on('keyup', function() {
		// alert("in input field")
		$.ajax({
		  type:"GET",
		  url:"new",
		  dataType:"json",
		  // gets the tags from the database
		  success:function(result){
		  	// autocomplete
		  	$( "#search" ).autocomplete({  
	     	source: result
		    });
		  }
		})
	});

	// autocomplete for tags
	$('#tag').on('keyup', function() {
		$.ajax({
		  type:"GET",
		  url:"new",
		  dataType:"json",
		  // gets the tags from the database
		  success:function(result){
		  	// autocomplete
		  	$( "#tag" ).autocomplete({  
	     	source: result
		    });
		  }
		})
	});

	// // autocomplete for tags
	// $('#tag').on('keyup', function() {
	// 	$.ajax({
	// 	  type:"GET",
	// 	  url:"edit",
	// 	  dataType:"json",
	// 	  // gets the tags from the database
	// 	  success:function(result){
	// 	  	// autocomplete
	// 	  	$( "#tag" ).autocomplete({  
	//      	source: result
	// 	    });
	// 	  }
	// 	})
	// });

})

