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

  $('.datepicker').datepicker({dateFormat: "yy-mm-dd", firstDay: 1});


});
