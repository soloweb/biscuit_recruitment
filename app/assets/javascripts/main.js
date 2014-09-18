'use strict';

$(document).ready(function () {
  $('.menu-toggle').click(function() {
    $('.main-menu').fadeIn();
  });

  $('.main-menu .close').click(function() {
    $('.main-menu').fadeOut();
  });
  console.log('Design & Developed By Soloweb. 2014');
})