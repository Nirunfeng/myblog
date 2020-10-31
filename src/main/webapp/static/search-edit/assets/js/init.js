/* ==================================================
//  ____  _     _   _            _   _          _____ _                              
// |  _ \(_)___| |_(_)_ __   ___| |_(_)_   ____|_   _| |__   ___ _ __ ___   ___  ___ 
// | | | | / __| __| | '_ \ / __| __| \ \ / / _ \| | | '_ \ / _ \ '_ ` _ \ / _ \/ __|
// | |_| | \__ \ |_| | | | | (__| |_| |\ V /  __/| | | | | |  __/ | | | | |  __/\__ \
// |____/|_|___/\__|_|_| |_|\___|\__|_| \_/ \___||_| |_| |_|\___|_| |_| |_|\___||___/
//
/* ================================================*/

$(document).ready(function(){
    'use strict';
    // OWL CAROUSEL //
    $('.owl-carousel').owlCarousel({
      navigation: true,
      pagination: false,
      navigationText: [
      "<i class='pe-7s-angle-left'></i>",
      "<i class='pe-7s-angle-right'></i>"
      ], 
      autoPlay: 8000
    });

    $('.owl-carousel-paged').owlCarousel({
      navigation: false,
      pagination: true,
      autoPlay: 8000
    });

    // ADD SLIDEDOWN ANIMATION TO DROPDOWN //
    $('.dropdown').on('show.bs.dropdown', function(e){
        $(this).find('.dropdown-menu').first().stop(true, true).slideDown();
    });

    // ADD SLIDEUP ANIMATION TO DROPDOWN //
    $('.dropdown').on('hide.bs.dropdown', function(e){
        $(this).find('.dropdown-menu').first().stop(true, true).slideUp();
    });

    // Closes the Responsive Menu on Menu Item Click
    $('.navbar-collapse ul li a').click(function() {
        $('.navbar-toggle:visible').click();
    });

    //REVIEW CIRCLES
    $('.stat-circle').circliful();

    //NEAT VID EMBEDS
    $().prettyEmbed({ useFitVids: true });

    //COUNTER
    jQuery('.countup').counterUp({
        delay: 10,
        time: 1000
    });

    $('.lb-link').magnificPopup({
      type: 'image'
    });

    //BACK TO TOP
    $('a#back-to-top ').click(function(event) {
      event.preventDefault();
      $('html, body').animate({
        scrollTop: $("body").offset().top
      }, 500);
    }); 

    //NICESCROLL
    //jQuery("body").niceScroll({
      //cursorcolor: '#474550',
      //cursorwidth: 15,
      //cursorborderradius: 0,
      //cursorborder: '0px solid #fff',
      //zindex: 10
    //});

    //CONTACT FORM
    $('#contactform').submit(function(){
      var action = $(this).attr('action');
      $("#message").slideUp(750,function() {
      $('#message').hide();
      $('#submit').attr('disabled','disabled');
      $.post(action, {
        name: $('#name').val(),
        email: $('#email').val(),
        website: $('#website').val(),
        comments: $('#comments').val()
      },
        function(data){
          document.getElementById('message').innerHTML = data;
          $('#message').slideDown('slow');
          $('#submit').removeAttr('disabled');
          if(data.match('success') != null) $('#contactform').slideUp('slow');
          $(window).trigger('resize');
        }
      );
      });
      return false;
    });

    //WORD ROTATE
    $('.wodry').wodry({
        animation: 'rotateX',
        delay: 2000,
        animationDuration: 1000
    });
});

$(function() {
    'use strict';
    // DIRECTION AWARE HOVER //
    $(' .direction-aware li ').each( function() { 
      $(this).hoverdir(); 
    });

    // FULLSCREEN FIX //
    var windowHeight = $(window).innerHeight();
    var isMobileDevice = /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);
    if( !isMobileDevice ) {
      $('#headerwrap.fullheight').css('height', windowHeight);
    }

    // ANIMATE ONCE PAGE LOAD IS OVER //
    Pace.on("done", function(){
        new WOW().init();
    });

    // SEARCH //
    $('a[href="#search"]').on('click', function(event) {
        event.preventDefault();
        $('#search-wrapper').addClass('open');
        $('#search-wrapper > form > input[type="search"]').focus();
    });
    
    $('#search-wrapper, #search-wrapper button.close').on('click keyup', function(event) {
        if (event.target == this || event.target.className == 'close' || event.keyCode == 27) {
            $(this).removeClass('open');
        }
    });
    
    $('form').submit(function(event) {
        event.preventDefault();
        return false;
    })

    // ONEPAGER //
    $('a.page-scroll').bind('click', function(event) {
        var $anchor = $(this);
        $('html, body').stop().animate({
            scrollTop: $($anchor.attr('href')).offset().top
        }, 1500, 'easeInOutExpo');
        event.preventDefault();
    });

    $('.entry-content table, #post-content table').addClass('table');
    $('.entry-content dl, #post-content dl').addClass('dl-horizontal');
});

    // ONEPAGER XTRA //
    $('body').scrollspy({
        target: '.navbar-fixed-top'
    })

/*-----------------------------------------------------------------------------------*/
/*  PORTFOLIO
/*-----------------------------------------------------------------------------------*/
$(window).load(function() {
    'use strict';

    var portfolio_selectors = $('.portfolio-filter li a');

    if(portfolio_selectors!='undefined'){
        var portfolio = $('.portfolio-items');
        portfolio.imagesLoaded( function(){
             portfolio.isotope({
                itemSelector : 'li',
                layoutMode : 'fitRows'
            });
        });

        portfolio_selectors.on('click', function(e){
            e.preventDefault();
            portfolio_selectors.removeClass('active');
            $(this).addClass('active');
            var selector = $(this).attr('data-filter');
            portfolio.isotope({ filter: selector });
            return false;
        });
    }
});

/*-----------------------------------------------------------------------------------*/
/*  PRELOADER
/*-----------------------------------------------------------------------------------*/
jQuery(window).load(function() {
"use strict";
  
  jQuery(window).trigger('resize'); 
  
  jQuery('a:not([target="_blank"]):not([href*=#]):not([href^=mailto]):not(.fancybox-media):not(.btn.responsive-menu):not(a[href$="jpg"]):not([href$="jpeg"]):not(a[href$="gif"]):not(a[href$="png"])').click(function(){
    var href = jQuery(this).attr('href');
    jQuery('.preloader').fadeIn(600);
    setTimeout(function(){
      window.location = href;
    }, 650);
    return false;
     
  });
  
});
