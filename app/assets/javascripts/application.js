// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui
//= require jquery-ui/autocomplete
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require_tree .

// Prevents user from hitting 'enter' on the form
$(document).on('keyup keypress', 'form input[type="text"]', function(e) {
  if(e.which == 13) {
    e.preventDefault();
    return false;
  }
});

// autocomplete for search bar
$(document).on('keyup', '#search', function() {
	// alert("hi")
	$.ajax({
	  type:"GET",
	  url:"hacks",
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
$(document).on('keyup', '#search', function() {
	// alert("in input field")
	$.ajax({
	  type:"GET",
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

