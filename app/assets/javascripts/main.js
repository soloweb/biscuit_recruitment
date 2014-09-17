'use strict';

$(document).ready(function () {
   // Code goes here
  $("a.burger").click(function() {
    $(".navtm").toggle();
  });

  $(".map").click(function() {
    $("#mapcontainer").toggle(function() {
      var s = $("#maptext");
      if ($("#mapcontainer").css("display") == "block") {
        s.html('<span class="ss-icon ss-gizmo closeclass">close</span> Close');
      } else {
        s.html('<span class="ss-icon ss-gizmo">location</span> View on Map');
      }
    });
  });

  $(".searchclose").click(function() {
    var getid = $(this).parent().attr('getid');
    $(this).parent().hide();
    $('#' + getid).show();
  });

  $('.recent-vacancies').owlCarousel({
    autoPlay: 6000,
    items: 3,
    navigation: true,
    pagination: false,
    navigationText: ["previous", "next"]
  });

  $('.owl-prev, .owl-next').addClass('ss-icon ss-standard');

  console.log('Design & Developed By Soloweb. 2014');

  $('.search-controls #clear').click(function() {
    $('#frmjobsearch .entered').hide();
    $("#frmjobsearch input[type='text']").val('');
    $("#frmjobsearch input[type='text']").show();
    $('#frmjobsearch .styled-select select option[selected="selected"]').removeAttr('selected');
    $('#frmjobsearch .styled-select').show();
  });

  $('.mobile-nav-button').click(function() {
    $('.main-navigation').slideToggle(200);
  });
})