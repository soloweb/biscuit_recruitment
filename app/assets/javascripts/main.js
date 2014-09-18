'use strict';

$(document).ready(function () {
  $('.menu-toggle').click(function() {
    $('.main-menu').stop().fadeIn();
  });

  $('.main-menu .close').click(function() {
    $('.main-menu').stop().fadeOut();
  });
  console.log('Design & Developed By Soloweb. 2014');
})