$(document).on('turbolinks:load', function() {
  $('.js-flash').each(function() {
    $(this).hide();
    let type = $(this).data('type');
    let message = $(this).data('message');

    switch(type) {
      case 'info':
        toastr.info(message)
        break
      case 'success':
        toastr.success(message)
        break
      case 'warning':
        toastr.warning(message)
        break
      default:
        toastr.error(message)
        break
    }
  })
});
