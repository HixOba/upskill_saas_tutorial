/*global $, Stripe*/
//Document ready
$(document).on('turbolinks:load', function(){
  //Set Stripe public key
  Stripe.setPublishableKey( $('meta[name="stripe-key"]').attr('content') );
  var theForm = $('#pro_form');
  var submitBtn = $('#form-signup-btn');
  //When user clicks submit btn,
  //prevent default submission behaviour
  //Collect the credit card fields
  //Send the card info to Stripe
  //Stripe returns a card token
  //Inject card token as hidden field into form
  //Submit form to our rails app
});