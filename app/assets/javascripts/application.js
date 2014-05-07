// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require bootstrap-typeahead-rails
//= require d3
//= require d3.chart
//= require FileSaver
//= require jszip.min
//= require simg
//= require tufted-rails


$(document).ready(function () {
  $('.typeahead').typeahead({ prefetch: '/munis.json' });

  $('#start-planning').on('click', function () {
    $('html, body').animate({ scrollTop: 0 }, 'slow');
    $('input').focus();
  });
});


var saveImages = function(callback) {
  var zip = new JSZip();
  var img = zip.folder("images");

  $("svg").each(function(index, svg) {
    var simg = new Simg(svg);

    simg.toImg(function(image) {
      var filedata = Simg.getBase64Image(image);
      var filename = "chart-" + index + ".png"
      img.file(filename, filedata, {base64: true})
    })

  });

  setTimeout(function(){
    if(callback) callback(zip);
  }, 500);
  
}

var saveZip = function(zip) {
  var content = zip.generate({type:"blob"});
  saveAs(content, "example.zip");
}

var downloadSvgs = function () {
  saveImages(function(zip) {
    saveZip(zip);
  })
}
