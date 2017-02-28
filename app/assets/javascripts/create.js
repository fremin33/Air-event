$( document ).ready(function() {
  $("#booking_place").change(function(){
    var quantity = $(this).val();
    var unitprice = $('#booking-price').data('price');
    var ticketsavailable = $('#ticketsavailable').val();
    var totalPrice = unitprice * quantity;
    var totalTickets = ticketsavailable - quantity;
    $('.booking-tickets p span').html(totalTickets);
    $('.booking-total-price h4 span').html(totalPrice)
  });
});
