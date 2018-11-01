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
    /*dayClick: function(date, jsEvent, view) {
      alert('a day has been clicked!');*/
  themeSystem: 'jquery-ui',
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
      /*viewRender: function (view) {
        var y = moment($('#calendar').fullCalendar('getDate')).year();
        $(".fc-prevYear-button").text(y - 1);
        $(".fc-nextYear-button").text(y + 1);
      }*/

      weekNumbers: true,
      eventLimit: true, // allow "more" link when too many events
      themeSystem: "jquery-ui"
    });
 });