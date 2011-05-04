jQuery(document).ready(function(){

    jQuery("#top-title a").bind('mouseover', function() {
      jQuery(this).animate({color: "#c03"}, 300);
    });
    
    jQuery("#top-title a").bind('mouseout', function() {
      jQuery(this).animate({color: "#fff"}, 500);
    });

})
