// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//= require jquery3
//= require jquery_ujs
//= require turbolinks
//= require_tree .

@import 'jquery-3.1.1.min'
@import 'bootstrap.min'
@import "slick.min";
@import "owl.carousel.min";
@import 'wow'


    'use strict';
    $(window).scroll(function() {    
        var scroll = $(window).scrollTop();
    
        if (scroll >= 200) {
            $(".fixed-top").addClass("darkHeader");
        } else {
            $(".fixed-top").removeClass("darkHeader");
        }
    });

    $('.admission_curosel').owlCarousel({
        loop: true,
        autoplay: true,
        autoplayTimeout: 10000,
        dots: false,
        nav: true,
        navText: ["<i class='fa fa-arrow-left''></i>", "<i class='fa fa-arrow-right''></i>"],
        responsive: {
            0: {
                items: 1
            },
            768: {
                items: 2
            },
            992: {
                items: 2
            },
            1000: {
                items: 4
            },
            1920: {
                items: 4
            }
        }
    })	
    new WOW().init();
