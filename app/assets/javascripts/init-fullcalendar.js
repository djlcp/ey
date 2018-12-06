$(document).on('turbolinks:load', function() {
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
      minTime: "09:00:00",
      maxTime: "18:00:00",// shows time for weeks and days
      viewRender: function (view) {
        var y = moment($('#calendar').fullCalendar('getDate')).year();
        $(".fc-prevYear-button").text(y - 1);
        $(".fc-nextYear-button").text(y + 1);
      },


      weekNumbers: false, // shows week count
      eventLimit: true, // allow "more" link when too many events
      selectable: false, //will give ability to select multiple days
      selectHelper: false,
      editable: false,
      themeSystem: "bootstrap4"
    });
});
