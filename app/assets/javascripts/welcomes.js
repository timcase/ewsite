  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-43474866-1']);
  _gaq.push(['_trackPageview']);

$(function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);

    $('#actions a.glidedown').bind('click',function(event){
        var $anchor = $(this);
        _gaq.push(['_trackEvent', 'action', 'click', $anchor.attr('href')]);

        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top
        }, 1500,'easeInOutExpo');
        /*
        if you don't want to use the easing effects:
        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top
        }, 1000);
        */
        event.preventDefault();
    });
    $('#find_artist').hide();
    $('#find_songs').hide();
    $('#find_similar').hide();
    $('#find_images').hide();

});
