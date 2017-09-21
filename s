[1mdiff --git a/app/assets/javascripts/pitches.js b/app/assets/javascripts/pitches.js[m
[1mindex 29d51fa..482cfd3 100644[m
[1m--- a/app/assets/javascripts/pitches.js[m
[1m+++ b/app/assets/javascripts/pitches.js[m
[36m@@ -5,10 +5,11 @@[m [mvar n_selected = 0;[m
 var pprice; //Pitch normal price[m
 var first_time = true;[m
 [m
[32m+[m
 $(document).on('turbolinks:load', function() {[m
     $('.datepicker').datepicker({[m
         onSelect: function(date) {[m
[31m-            // mday = date.substring(0, 2);[m
[32m+[m
             mday = date;[m
             n_selected = 0;[m
 [m
[36m@@ -70,11 +71,11 @@[m [mfunction createTable(json){[m
     eraseTable();[m
     eraseReservations();[m
     eraseOptions();[m
[31m-[m
[32m+[m[32m    eraseHiddens();[m
 [m
     $('#dynamictable').append('<table></table>');[m
     var table = $('#dynamictable').children();[m
[31m-    table.append("<tr><td colspan='3'>Nombre de la pista</td></tr>");[m
[32m+[m[32m    table.append("<tr><td colspan='3'>Horarios</td></tr>");[m
     table.append("<tr><td>Hora</td><td>30 min</td><td>30 min</td></tr>");[m
     var root = "h";[m
     var val1,val2;[m
[36m@@ -160,6 +161,61 @@[m [mfunction loadingValuesInHiddenTags()[m
     $('#sPitch').val($('#pitch_id').val());[m
 [m
 }[m
[32m+[m[32mfunction eraseHiddens(){[m
[32m+[m
[32m+[m[32m  $('#s0').val("");[m
[32m+[m[32m  $('#s1').val("");[m
[32m+[m[32m  $('#s2').val("");[m
[32m+[m[32m  $('#s3').val("");[m
[32m+[m[32m  $('#s4').val("");[m
[32m+[m[32m  $('#s5').val("");[m
[32m+[m[32m  $('#s6').val("");[m
[32m+[m[32m  $('#s7').val("");[m
[32m+[m[32m  $('#s8').val("");[m
[32m+[m[32m  $('#s9').val("");[m
[32m+[m[32m  $('#s10').val("");[m
[32m+[m[32m  $('#s11').val("");[m
[32m+[m[32m  $('#s12').val("");[m
[32m+[m[32m  $('#s13').val("");[m
[32m+[m[32m  $('#s14').val("");[m
[32m+[m[32m  $('#s15').val("");[m
[32m+[m[32m  $('#s16').val("");[m
[32m+[m[32m  $('#s17').val("");[m
[32m+[m[32m  $('#s18').val("");[m
[32m+[m[32m  $('#s19').val("");[m
[32m+[m[32m  $('#s20').val("");[m
[32m+[m[32m  $('#s21').val("");[m
[32m+[m[32m  $('#s22').val("");[m
[32m+[m[32m  $('#s23').val("");[m
[32m+[m[32m  $('#s24').val("");[m
[32m+[m[32m  $('#s25').val("");[m
[32m+[m[32m  $('#s26').val("");[m
[32m+[m[32m  $('#s27').val("");[m
[32m+[m[32m  $('#s28').val("");[m
[32m+[m[32m  $('#s29').val("");[m
[32m+[m[32m  $('#s30').val("");[m
[32m+[m[32m  $('#s31').val("");[m
[32m+[m[32m  $('#s32').val("");[m
[32m+[m[32m  $('#s33').val("");[m
[32m+[m[32m  $('#s34').val("");[m
[32m+[m[32m  $('#s35').val("");[m
[32m+[m[32m  $('#s36').val("");[m
[32m+[m[32m  $('#s37').val("");[m
[32m+[m[32m  $('#s38').val("");[m
[32m+[m[32m  $('#s39').val("");[m
[32m+[m[32m  $('#s40').val("");[m
[32m+[m[32m  $('#s41').val("");[m
[32m+[m[32m  $('#s42').val("");[m
[32m+[m[32m  $('#s43').val("");[m
[32m+[m[32m  $('#s44').val("");[m
[32m+[m[32m  $('#s45').val("");[m
[32m+[m[32m  $('#s46').val("");[m
[32m+[m[32m  $('#s47').val("");[m
[32m+[m
[32m+[m[32m  $('#sDate').val("");[m
[32m+[m[32m  $('#sPitch').val("");[m
[32m+[m
[32m+[m[32m}[m
 // Removing old tables for different days selections[m
 function eraseTable(){[m
     var el = document.getElementById('dynamictable');[m
[1mdiff --git a/app/controllers/pitches_controller.rb b/app/controllers/pitches_controller.rb[m
[1mindex 42f8061..a3bdd64 100644[m
[1m--- a/app/controllers/pitches_controller.rb[m
[1m+++ b/app/controllers/pitches_controller.rb[m
[36m@@ -71,8 +71,10 @@[m [mclass PitchesController < ApplicationController[m
 [m
   def confirm[m
     our_date = Date.strptime(params[:fecha], '%d/%m/%Y')[m
[31m-    n_selected = params[:seleccionados][m
[32m+[m[32m    @n_selected = params[:seleccionados][m
     @schedule = Schedule.where("date_ref = ? and pitch_id = ?", our_date , params[:pitch_id])[m
[32m+[m[32m    @pitch = Pitch.find_by_id(pa