$(document).on('turbolinks:load', function() {
  $('#calendar').fullCalendar({
    dayClick: function(date, jsEvent, view) {
      alert('a day has been clicked!');
    }
  })
});
