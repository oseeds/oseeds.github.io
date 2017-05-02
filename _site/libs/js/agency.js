(function($) {"use strict";
              
              $('a.page-scroll').bind('click', function(event) {var $anchor = $(this);$('html, body').stop().animate({scrollTop: ($($anchor.attr('href')).offset().top - 100)}, 1250, 'easeInOutExpo');event.preventDefault();});
              
              $('body').scrollspy({target: '.navbar-fixed-top',offset: 80});$('.navbar-collapse ul li a').click(function(){$('.navbar-toggle:visible').click();});
              
              
              $('#mainNav').affix({offset: {top: 40;}})
             
             
              var $grid = $('.grid').masonry({itemSelector: '.grid-item',percentPosition: true,columnWidth: '.grid-sizer'});$grid.imagesLoaded().progress( function() {$grid.masonry();}); 

        $(".art-content img, .grid img").on("click", function() {$('#imagepreview').attr('src', $(this).attr('src'));var a=$(this).attr('alt');if(a==undefined){a=""};$('#myModalLabel').text(a);$('#imagemodal').modal('show');});
             
              
              
              
            $(".contactmodalopen").on("click",function(){$('#contactmodal').modal('show');});
              
              
             })(jQuery);