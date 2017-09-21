var miArray = new Array(48);
var mday;
var id;
var n_selected = 0;
var pprice; //Pitch normal price
var first_time = true;


$(document).on('turbolinks:load', function() {
    $('.datepicker').datepicker({
        onSelect: function(date) {

            mday = date;
            n_selected = 0;

            if ($('#total_price').empty()== false) {
              $('#total_price').remove();
            }

            //Pitch id saved in hidden value
            id = document.getElementById("pitch_id").value;

            $.ajax({
                url: '/horarios',
                type: 'GET',
                dataType: 'json',
                cache: false,
                data: { day: mday, pitch_id: id },
                success: function(data) {
                    // data is a json object

                    // Start creating table with JSON's information
                    createTable(data);

                },
                error: function() {
                    console.log('error');
                    alert('Error al cargar los horarios. Por favor, inténtelo de nuevo más tarde.');
                },
                complete: function(xhr) {
                    console.log('complete json loading');
                    console.log(xhr.getAllResponseHeaders());
                }
            });

        },
        firstDay: 1,
        monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
        monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
        dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
        dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mié', 'Juv', 'Vie', 'Sáb'],
        dayNamesMin: ['Do', 'Lu', 'Ma', 'Mi', 'Ju', 'Vi', 'Sá'],
        weekHeader: 'Sm',
        dateFormat: 'dd/mm/yy',
        isRTL: false,
        showMonthAfterYear: false,
        yearSuffix: '',
        closeText: 'Cerrar',
        prevText: '< Ant',
        nextText: 'Sig >',
        currentText: 'Hoy',
        maxDate: "+2d",
        minDate: 0
    });

});

// Creation of void table with times and IDs
function createTable(json){
//Erasing previous data in case it had
    eraseTable();
    eraseReservations();
    eraseOptions();
    eraseHiddens();

    $('#dynamictable').append('<table></table>');
    var table = $('#dynamictable').children();
    table.append("<tr><td colspan='3'>Horarios</td></tr>");
    table.append("<tr><td>Hora</td><td>30 min</td><td>30 min</td></tr>");
    var root = "h";
    var val1,val2;
    for (h=0;h<24;h++){
        i=h*2;
        val1 = eval("json."+(root+i));//concat strings and values to access h vars
        val2 = eval("json."+(root+(i+1)));
        miArray[i] = val1;
        miArray[i+1] = val2;

        if (val1 != null ||  val2 != null){
            table.append("<tr><td>"+formattedH(h)+":00 </td> <td id="+i+">"+val1+"</td><td id="+(i+1)+">"+val2+"</td></tr>");
            switch(val1) {
                case 0:  $('#'+i).css({"background-color": "#008000"});  break; //free
                case 1:  $('#'+i).css({"background-color": "#6c1100"});  break; //occupaid
                case 2:  $('#'+i).css({"background-color": "#ea821a"});  break; //unavailable
                default: $('#'+i).css({"background-color": "#8b8878"}); //out of time
            }
            switch(val2) {
                case 0:  $('#'+(i+1)).css({"background-color": "#008000"});  break; //free
                case 1:  $('#'+(i+1)).css({"background-color": "#6c1100"});  break; //occupaid
                case 2:  $('#'+(i+1)).css({"background-color": "#ea821a"});  break; //unavailable
                default: $('#'+(i+1)).css({"background-color": "#8b8878"}); //out of time
            }
        }
    }
    console.log(miArray);
    loadingValuesInHiddenTags();
}

function loadingValuesInHiddenTags()
{
    $('#s0').val(miArray[0]);
    $('#s1').val(miArray[1]);
    $('#s2').val(miArray[2]);
    $('#s3').val(miArray[3]);
    $('#s4').val(miArray[4]);
    $('#s5').val(miArray[5]);
    $('#s6').val(miArray[6]);
    $('#s7').val(miArray[7]);
    $('#s8').val(miArray[8]);
    $('#s9').val(miArray[9]);
    $('#s10').val(miArray[10]);
    $('#s11').val(miArray[11]);
    $('#s12').val(miArray[12]);
    $('#s13').val(miArray[13]);
    $('#s14').val(miArray[14]);
    $('#s15').val(miArray[15]);
    $('#s16').val(miArray[16]);
    $('#s17').val(miArray[17]);
    $('#s18').val(miArray[18]);
    $('#s19').val(miArray[19]);
    $('#s20').val(miArray[20]);
    $('#s21').val(miArray[21]);
    $('#s22').val(miArray[22]);
    $('#s23').val(miArray[23]);
    $('#s24').val(miArray[24]);
    $('#s25').val(miArray[25]);
    $('#s26').val(miArray[26]);
    $('#s27').val(miArray[27]);
    $('#s28').val(miArray[28]);
    $('#s29').val(miArray[29]);
    $('#s30').val(miArray[30]);
    $('#s31').val(miArray[31]);
    $('#s32').val(miArray[32]);
    $('#s33').val(miArray[33]);
    $('#s34').val(miArray[34]);
    $('#s35').val(miArray[35]);
    $('#s36').val(miArray[36]);
    $('#s37').val(miArray[37]);
    $('#s38').val(miArray[38]);
    $('#s39').val(miArray[39]);
    $('#s40').val(miArray[40]);
    $('#s41').val(miArray[41]);
    $('#s42').val(miArray[42]);
    $('#s43').val(miArray[43]);
    $('#s44').val(miArray[44]);
    $('#s45').val(miArray[45]);
    $('#s46').val(miArray[46]);
    $('#s47').val(miArray[47]);

    $('#sDate').val(mday);
    $('#sPitch').val($('#pitch_id').val());

}
function eraseHiddens(){

  $('#s0').val("");
  $('#s1').val("");
  $('#s2').val("");
  $('#s3').val("");
  $('#s4').val("");
  $('#s5').val("");
  $('#s6').val("");
  $('#s7').val("");
  $('#s8').val("");
  $('#s9').val("");
  $('#s10').val("");
  $('#s11').val("");
  $('#s12').val("");
  $('#s13').val("");
  $('#s14').val("");
  $('#s15').val("");
  $('#s16').val("");
  $('#s17').val("");
  $('#s18').val("");
  $('#s19').val("");
  $('#s20').val("");
  $('#s21').val("");
  $('#s22').val("");
  $('#s23').val("");
  $('#s24').val("");
  $('#s25').val("");
  $('#s26').val("");
  $('#s27').val("");
  $('#s28').val("");
  $('#s29').val("");
  $('#s30').val("");
  $('#s31').val("");
  $('#s32').val("");
  $('#s33').val("");
  $('#s34').val("");
  $('#s35').val("");
  $('#s36').val("");
  $('#s37').val("");
  $('#s38').val("");
  $('#s39').val("");
  $('#s40').val("");
  $('#s41').val("");
  $('#s42').val("");
  $('#s43').val("");
  $('#s44').val("");
  $('#s45').val("");
  $('#s46').val("");
  $('#s47').val("");

  $('#sDate').val("");
  $('#sPitch').val("");

}
// Removing old tables for different days selections
function eraseTable(){
    var el = document.getElementById('dynamictable');
    while( el.hasChildNodes() ){
        el.removeChild(el.lastChild);
    }
}
function eraseReservations(){
    //Clean up html
    var el = document.getElementById('booking');
    while( el.hasChildNodes() ){
        el.removeChild(el.lastChild);
    }
    //Clean up array
    for (var i in miArray) {
        if (miArray[i]==9) {
            miArray[i]=0;
        }
    }
}
function eraseOptions()
{
  if ($("#payment_button").hasClass("show"))
  {
    $('#payment_button').removeClass('show');
    $('#payment_button').addClass('hide');
  }
}
//Selection-Deselection specifics cells
$(document).on( 'turbolinks:load', function(){

    $("#dynamictable").on('click','td', function() {

        //alert($(this).attr('id'));
        var p = ($(this).attr('id'));//ID's selected point
        if (miArray[p] == 0){
          if (first_time){
            $('#selection').append("<h4> <p>  Tu selección: </p> </h4>");
            $('#subtotal').append("<h4> <p> Total a pagar: </p> </h4>");

            first_time = false;
          }
            miArray[p] = 9;
            $('#s'+p).val(9);// hidden
            $('#'+ p).css({"background-color": "red"});
            $('#booking').append("<p id="+'m'+p+">"+hourById(p)+"<p>");
            n_selected++;
            $('#sSelected').val(n_selected);
            currentPrice();
        }
        else if (miArray[p] == 9) {
            miArray[p]=0;
            $('#s'+p).val(0);//hidden
            $('#'+ p).css({"background-color": "#008000"});
            $('#m'+p ).remove();
            n_selected--;
            $('#sSelected').val(n_selected);
            currentPrice();
        }
    });
});

// Just put 0 back to the number if < 9
function formattedH (h)
{
    if (h<=9) {return ('0'+h)}
    else return h;
}
function compareObjects(obj1, obj2) {
    return JSON.stringify(obj1) === JSON.stringify(obj2);
}
//Given an ID, shows reservation selected
function hourById(id){
    var h = id/2;
    var hf;
    var exp;

    if (id%2 != 0){
        hf = Math.ceil(h) + ":00";
        h = Math.floor(h) + ":30";
    }
    else  {
        hf = Math.floor(h) + ":30";
        h = h + ":00";
    }

    exp = "De "+h+" a "+hf+" ";

    return exp;

}
function currentPrice()
{
pprice = document.getElementById("pitch_price").value;
if ($('#total_price').empty()== false) {
  $('#total_price').remove();
}
$('#total_price').append("<p>"+pprice*n_selected+ "€"+"<p>");
if (n_selected > 0) {
  $('#payment_button').removeClass('hide');
  $('#payment_button').addClass('show');
}
else {
  $('#payment_button').removeClass('show');
  $('#payment_button').addClass('hide');
  }
}


function finalCheck(){
  var max_selected;
  var pass = true;
  var change_trends = 0;
  var previous = 0, current;

  for (i in miArray){
    current = i;
    if (i == 9) {max_selected++;}
    if ( (previous < 5 && current == 9) || (previous == 9 && current < 5) ) {change_trends++}
  }

  //More than 2h selected or more than 1 section
  if (max_selected>4 || change_trends>2)
    {pass = false;}

  return pass;
}
