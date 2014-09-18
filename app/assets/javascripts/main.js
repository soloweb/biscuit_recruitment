'use strict';

$(document).ready(function () {
  $('.menu-toggle').click(function() {
    $('.main-menu').addClass('animated fadeIn');
    $('.main-menu').show();
    setTimeout(function(){
      $('.main-menu').removeClass('animated fadeIn');
    }, 200);
  });

  $('.main-menu .close').click(function() {
    $('.main-menu').addClass('animated fadeOut');
    setTimeout(function(){
      $('.main-menu').removeClass('animated fadeOut');
      $('.main-menu').hide();
    }, 200);
  });
  console.log('Design & Developed By Soloweb. 2014');
})