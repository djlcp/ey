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
    dayClick: function(date, jsEvent, view) {
      alert('a day has been clicked!');
    }
  })
});
