$(document).on('turbolinks:load', function() {
  $('.js-datatable').each(function() {
    var options = {
      "bLengthChange": false,
    }

    if ($(this).data('show-buttons')) {
      options['dom'] = 'Bfrtip',
      options['buttons'] = [
        {
          extend: 'csv',
          exportOptions: {},
        }, {
          extend: 'excel',
          exportOptions: {}
        }
      ]
    }
    $(this).DataTable(options);
  });
});
