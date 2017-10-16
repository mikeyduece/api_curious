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
//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require jquery
//= require materialize-sprockets
// var options = [
//   {selector: '#pwned', offset: 200, callback: customCallbackFunc },
//   {selector: '.collection-item', offset: 200, callback: function() {
//     customCallbackFunc();
//   } },
// ];
// Materialize.scrollFire(options);

// $(document).ready(function(){
//     // the "href" attribute of the modal trigger must specify the modal ID that wants to be triggered
//     $('.modal').modal();
// });
//
// $('#modal1').modal('open');
// $('#modal1').modal('close');
//
// $('.modal').modal({
//       dismissible: true, // Modal can be dismissed by clicking outside of the modal
//       opacity: .5, // Opacity of modal background
//       inDuration: 300, // Transition in duration
//       outDuration: 200, // Transition out duration
//       startingTop: '4%', // Starting top style attribute
//       endingTop: '10%', // Ending top style attribute
//       ready: function(modal, trigger) { // Callback for Modal open. Modal and trigger parameters available.
//         alert("Ready");
//         console.log(modal, trigger);
//       },
//       complete: function() { alert('Closed'); } // Callback for Modal close
//     }
//   );

$('.ls-modal').on('click', function(e){
  e.preventDefault();
  $('#myModal').modal('show').find('.modal-body').load($(this).attr('href'));
});

$(function(){
 $(".in_iframe_modal").on("click",function(evt){
     evt.preventDefault();

     btnDom = $(this);

     url = btnDom.attr("href") || btnDom.data("modal-frame-src");

     //lets get the modal title
     modalTitle = btnDom.data('modal-title') || btnDom.attr("title");


     modal = $("#iframe_modal");

     modal.find("#modal-title").text(modalTitle);


     winHeight = $(window).innerHeight()-70;

     modal.css({
         "height" : winHeight+"px",
         "max-height" : winHeight+"px",
     });

     //close modal first
      //$("#iframe_modal").closeModal();
      modal.openModal();

      frame =  $("#iframe_modal iframe");

     frame.css("height",winHeight);

     //change iframe modal src
     frame.attr("src",url);


 });

 });
// var i=0;
// $('.modal').each(function(){
//     i++;
//     var newID='modal'+i;
//     $(this).attr('id',newID);
//     $(this).val(i);
// });
