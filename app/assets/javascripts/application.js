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
//
//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

// navバーの記述
$(document).on('turbolinks:load', function () {
  $('#tab-contents .tab[id != "tab1"]').hide();
  $('#tab-menu a').on('click', function(event) {
    $("#tab-contents .tab").hide();
    $("#tab-menu .active").removeClass("active");
    $(this).addClass("active");
    $($(this).attr("href")).show();
    event.preventDefault();
  });
});

// Top画面のスライドショー
$(document).on('turbolinks:load',function () {
  $("#slide-image").skippr({
    transition : 'slide',
    speed : 2000,
    easing : 'easeOutQuart',
    navType : 'none',
    childrenElementType : 'div',
    arrows : true,
    autoPlay : true,
    autoPlayDuration : 2000,
    keyboardOnAlways : true,
    hidePrevious : false
  });
});

// おすすめ、新着投稿のスライド
$(document).on('turbolinks:load',function () {
  $('.recommend-items').slick({
    centerMode: true,
    centerPadding: '60px',
    prevArrow: '<i class="fas fa-chevron-left"></i>',
    nextArrow: '<i class="fas fa-chevron-right"></i>',
    slidesToShow: 4,
    slidesToScroll: 1
  });
});

// おすすめユーザーのスライド
$(document).on('turbolinks:load',function () {
  $('.recommend-users').slick({
  centerMode: true,
  centerPadding: '60px',
  prevArrow: '<i class="fas fa-chevron-left"></i>',
  nextArrow: '<i class="fas fa-chevron-right"></i>',
  slidesToShow: 4,
  slidesToScroll: 1
  });
});

// 投稿画像のプレビュー
$(document).on("turbolinks:load", function(){
  function readURL(input) {
    if(input.files && input.files[0]){
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#img_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
  $("#post_item_image").change(function(){
    readURL(this);
  });
});

// プロフール画像のプレビュー
$(document).on("turbolinks:load", function(){
  function readURL(input) {
    if(input.files && input.files[0]){
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#img_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
  $("#user_profile_image").change(function(){
    readURL(this);
  });
});

//文字数カウント
$(document).on("turbolinks:load", function(){
  $(".js-text").on("keyup", function() {
    var cnt = $(this).val().length;
    $(".counter").text(cnt + "文字");
  });
});

// headerのドロップダウンメニュー
$(document).on("turbolinks:load",function(){
  $('.dropdown').hover(function() {
    $(this).find('.dropdown-menu').slideDown(true).fadeIn(500);
  },function() {
    $(this).find('.dropdown-menu').slideUp(300);
  });
});


$(document).on("turbolinks:load", function(){
  $('.section').hide();
  $('.btn1').on('click', function() {
    $('.start-1').fadeOut(2000);
    $('.start-2').fadeIn(2000);
  });
  $('.btn2').on('click', function() {
    $('.start-2').fadeOut(2000);
    $('.start-3').fadeIn(2000);
  });
  $('.btn3').on('click', function() {
    $('.start-3').fadeOut(2000);
    $('.start-4').fadeIn(2000);
  });
    $('.btn4').on('click', function() {
    $('.start-4').fadeOut(2000);
    $('.start-5').fadeIn(2000);
  });
    $('.btn5').on('click', function() {
    $('.start-5').fadeOut(2000);
    $('.start-6').fadeIn(2000);
  });
});

$(document).on("turbolinks:load",function() {
  $('.menu-trigger').on('click', function(event) {
    $(this).toggleClass('active');
    $('#sp-menu').fadeToggle();
    event.preventDefault();
  });
});