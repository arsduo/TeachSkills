// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
/* Author: Apecore UG (haftungsbeschränkt)

*/

$(document).ready(function() {
   $.getJSON("https://graph.facebook.com/xplaygrounds?callback=?", function(json) {
       $(".counter_fb").html('<a href="http://facebook.com/xplaygrounds" target="_blank">' + json.likes + '</a>');
   });
});

$.ajax({
            url: 'http://api.twitter.com/1/users/show.json',
            data: {screen_name: 'xplaygrounds'},
            dataType: 'jsonp',
            success: function(data) {
                $('.counter_twitter')
				.html('<a href="http://twitter.com/xplaygrounds" target="_blank">' + data.followers_count + '</a>');
                }
        });


$('#expand_arrow').click(function(){
	//$('#expand_content').animate({ height: 400});
	$('#expand_content').slideToggle('slow', function() {
    $('#expand_arrow').toggleClass('up_arrow');
  });

});





















