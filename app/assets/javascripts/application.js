// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require slideout
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

// =========================================
// SLIDEOUT.js
// =========================================
function initializeSlideOut(){
    // initialize left slideout
    var slideout = new Slideout({
      'panel': document.getElementById('main'),
      'menu': document.getElementById('aside'),
      'padding': 200,
      'side': 'left',
      'tolerance': 70
    });

    $('.toggle-aside').click(function(){
      slideout.toggle();
    })

    var fixed = document.querySelector('.fixed-header');

    slideout.on('translate', function(translated) {
      fixed.style.transform = 'translateX(' + translated + 'px)';
    });

    slideout.on('beforeopen', function () {
      fixed.style.transition = 'transform 300ms ease';
      fixed.style.transform = 'translateX(200px)';
    });

    slideout.on('beforeclose', function () {
      fixed.style.transition = 'transform 300ms ease';
      fixed.style.transform = 'translateX(200px)';
    });

    slideout.on('open', function () {
      fixed.style.transition = '';
    });

    slideout.on('close', function () {
      fixed.style.transition = '';
    });
}

// =========================================
// INITIALIZE
// =========================================
document.addEventListener("turbolinks:load", function() {
  initializeSlideOut();
});
