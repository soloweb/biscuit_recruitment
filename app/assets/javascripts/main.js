'use strict';

$('.menu-toggle').click(function() {
  $('.main-menu').stop().fadeIn();
});

$('.main-menu .close').click(function() {
  $('.main-menu').stop().fadeOut();
});

$(document).ready(function () {
  console.log('Design & Developed By Soloweb. 2014');
})