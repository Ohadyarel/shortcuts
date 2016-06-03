$(document).ready(function(){
	// array of tags 
	var tagArray=[]
	$("#submit-tag").on('click',function(e) {
    tagArray.push($("#tag").val());
    $("#tags").append("<p id='cloud'>"+ $("#tag").val() + "<span class='del-tag'> X</span>" + "</p>");
    $("#tag").val("");
		$(".del-tag").on('click',function(e) {
			$(this).parent().remove();
		});
		// replace the tag-array with the values of the array
		$("#tag-array").val(tagArray)
		// console.log(tagArray);
	});


	// autocomplete for tags
	$('#search').on('keyup', function() {
		// alert("in input field")
		$.ajax({
		  type:"GET",
		  url:"new",
		  dataType:"json",
		  // gets the tags from the database
		  success:function(result){
		  	// alert("Resolut")
		  	// autocomplete
		  	$( "#search" ).autocomplete({  
	     	source: result
		    });
		  }
		})
	});

	// autocomplete for tags
	$('#tag-input').on('keyup', function() {
		// alert("in input field")
		$.ajax({
		  type:"GET",
		  url:"new",
		  dataType:"json",
		  // gets the tags from the database
		  success:function(result){
		  	// alert("Resolut")
		  	// autocomplete
		  	$( "#tag-input" ).autocomplete({  
	     	source: result
		    });
		  }
		})
	});

})

