$(document).on('turbolinks:load', function() {
  // $.ajax({
  //   url: '/users',
  //   type: 'GET',
  //   dataType: 'json',
  //   success: function(response) {
  //     console.log(response)
  //   }
  // });
  $('#calendar').fullCalendar({
      events: '/requests.json',
      firstDay: 1, // week starts from Monday
      fixedWeekCount: false, //caledar will have 4,5 or 6 weeks,depending on the month
      contentHeight: 600, // display height
      Boolean, default: true, //?!! auto-resize for browser window

      header: {
        left: 'month,agendaWeek,agendaDay,listMonth',
        center: 'title',
        right: 'today, prevYear,prev,next,nextYear'
      },
      //CHANGE BUTTON TEXT FOR PREV,NEXT YEAR
      buttonText: {
         prevYear: new moment().year() - 1,
         nextYear: new moment().year() + 1
      },
      minTime: "07:00:00",
      maxTime: "19:00:00",// shows time for weeks and days
      /*viewRender: function (view) {
        var y = moment($('#calendar').fullCalendar('getDate')).year();
        $(".fc-prevYear-button").text(y - 1);
        $(".fc-nextYear-button").text(y + 1);
      }*/

      weekNumbers: true, // shows week count
      eventLimit: true, // allow "more" link when too many events
      selectable: true, //will give ability to select multiple days
      selectHelper: true,
      editable: true,

      /*select: function(start, end) {
        $.getScript('/events/new', function() {
          $('#event_date_range').val(moment(start).format("MM/DD/YYYY HH:mm") + ' - ' + moment(end).format("MM/DD/YYYY HH:mm"))
          date_range_picker();
          $('.start_hidden').val(moment(start).format('YYYY-MM-DD HH:mm'));
          $('.end_hidden').val(moment(end).format('YYYY-MM-DD HH:mm'));
        });

        calendar.fullCalendar('unselect');
      },*/

      themeSystem: "bootstrap4"
    });


    // $('.datepicker').datepicker({
    //     dateFormat: "yy-mm-dd",
    // });
});
