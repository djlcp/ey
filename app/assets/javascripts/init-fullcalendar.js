$(document).on('turbolinks:load', function() {
  var requestsUrl = $('#calendar').data('target');
  $('#calendar').fullCalendar({
      events: requestsUrl,
      firstDay: 1, // week starts from Monday
      fixedWeekCount: false, //caledar will have 4,5 or 6 weeks,depending on the month
      contentHeight: 600, // display height
      Boolean, default: true, //?!! auto-resize for browser window
      header: {
        left: 'month,agendaWeek,agendaDay,listMonth',
        center: 'title',
        right: 'today, prevYear,prev,next,nextYear'
      },
      buttonText: {
         prevYear: "Previous",
         nextYear: "Next"
      },
      weekNumbers: false, // shows week count
      eventLimit: true, // allow "more" link when too many events
      selectable: false, //will give ability to select multiple days
      selectHelper: false,
      editable: false,
      themeSystem: "bootstrap4",
      // On click handler
      eventClick: function(calEvent, jsEvent, view) {
        var newHtml = "<div>" +
                        "<h2 class='mb-3'>" + calEvent.user + "-" + calEvent.leave_type + "</h2>" +
                        "<p>" + calEvent.description + "</p>" +
                      "</div>"
        $('#calendar-modal').html(newHtml).modal();
      }
    });

  addEventListener('turbolinks:before-visit', () => {
    $('#calendar').fullCalendar('destroy')
  });
});

