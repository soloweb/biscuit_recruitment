'use strict';

$('.menu-toggle').click(function() {
  $('.main-menu').stop().fadeIn();
  $('html').css('overflow', 'hidden');
});

$('.main-menu .close').click(function() {
  $('.main-menu').stop().fadeOut();
  $('html').css('overflow', 'show');
});

$(document).ready(function () {
  console.log('Design & Developed By Soloweb. 2014');
})