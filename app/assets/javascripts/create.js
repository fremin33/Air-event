$( document ).ready(function() {
  $('#booking_place').change(function() {
    var quantity = $('#booking_place').val();
    var price = $('#booking-price').data('price');
    var tickets = $('.booking-tickets p span').html();
    $('.booking-total-price h4 span').html(price * quantity);
    $('.booking-tickets p span').html(tickets - 1);
  });
});