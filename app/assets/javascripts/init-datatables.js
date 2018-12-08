$(document).on('turbolinks:load', function() {
  $('.js-datatable').each(function() {
    var options = {
      "bLengthChange": false,
    }

    if ($(this).data('buttons') == 'true') {
      options['dom'] = 'Bfrtip',
      options['buttons'] = [
        {
          extend: 'csv',
          exportOptions: {
            columns: [-1]
          },
        }, {
          extend: 'excel',
          exportOptions: {
            columns: [-1]
          }
        }
      ]
    }
    $(this).DataTable(options);
  });
});
