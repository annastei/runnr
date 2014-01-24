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

  $('form.ajax-form').on('ajax:success', function(evt, data, status, xhr){
    update_statistics();
    $("#workout_list").append("<tr><td>" + data.date + "</td><td>" + data.distance + "</td><td>" + data.duration + "</td><td>" + data.comment + "</td><td><a class='btn btn-mini btn-danger' data-confirm='Are you sure?' data-method='delete' href='/workouts/" + data.id + "' rel='nofollow'>Delete</a></td></tr>")
  })

  $(".tablesorter").tablesorter( {
    headers: { 
            3: {
                sorter: false 
            },
            4: {
                sorter: false 
            }
        },
        sortList: [[0,1]]
  })

});
