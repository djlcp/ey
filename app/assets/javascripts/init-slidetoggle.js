$(document).on('turbolinks:load', function() {
  $('.js-slide-toggle').on('click', function() {
    var target = $(this).data('target')
    $(target).slideToggle(0.5);
    $(this).find('.js-see-more').toggleClass('rotate')
  })
});
