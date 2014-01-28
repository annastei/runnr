// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){

  var update_statistics = function() {
    $.getJSON( "/workouts/statistics.json", function( data ) {
      $("#count").text(data.count);
      $("#average_speed").text(data.average_speed.toFixed(2));
      $("#average_per_week").text(data.average_per_week.toFixed(2));
    })
  };

  update_statistics();

  $('form.ajax-form').on({
    'ajax:success': function(evt, data, status, xhr ){
      $('form.ajax-form')[0].reset();
      update_statistics();
      $("#workout_list").append("<tr><td>" + data.date + "</td><td>" + data.distance + "</td><td>" + data.time_period + "</td><td>" + data.comment + "</td><td><a class='btn btn-mini btn-danger' data-confirm='Are you sure?' data-method='delete' href='/workouts/" + data.id + "' rel='nofollow'>Delete</a></td></tr>")
    },
    'ajax:error': function(evt, xhr, status, error){
      var responseObject = $.parseJSON(xhr.responseText),
          errors = $('<ul />');

      $.each(responseObject, function(){
        errors.append('<li>' + this + '</li>');
      })

      $(this).find('.errors').html(errors);
    }
  });

  $(".tablesorter").tablesorter( {
    headers: {
            2: {
                sorter: 'time'
            },
            3: {
                sorter: false
            },
            4: {
                sorter: false
            }
        },
        sortList: [[0,1]]
  });

  $('.datepicker').datepicker({dateFormat: "yy-mm-dd", firstDay: 1}).datepicker("setDate", "0");


});
