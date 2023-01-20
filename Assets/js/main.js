$(document).ready(function(){

  // calcular promedio 1
  $(document).on("keyup",".nota1", function(e){
    e.preventDefault();
    var row = (this.parentNode.parentNode).getAttribute('id');

    var nota1 = parseFloat($('#'+row+' #n1a').val());
    var nota2 = parseFloat($('#'+row+' #n2a').val());
    var nota3 = parseFloat($('#'+row+' #n3a').val());

    document.querySelector('#'+row+' .p1').innerHTML = subpromedio(nota1, nota2, nota3);
    calcPromedio(row);
  });

  // calcular promedio 2
  $(document).on("keyup",".nota2", function(e){
    e.preventDefault();
    var row = (this.parentNode.parentNode).getAttribute('id');

    var nota1 = parseFloat($('#'+row+' #n1b').val());
    var nota2 = parseFloat($('#'+row+' #n2b').val());
    var nota3 = parseFloat($('#'+row+' #n3b').val());

    document.querySelector('#'+row+' .p2').innerHTML = subpromedio(nota1, nota2, nota3);
    calcPromedio(row);
  });

}, false);


function subpromedio(nota1, nota2, nota3){
  nota1 = (Number.isNaN(nota1)) ? 0 : nota1;
  nota2 = (Number.isNaN(nota2)) ? 0 : nota2;
  nota3 = (Number.isNaN(nota3)) ? 0 : nota3;

  var promedio = ((nota1 + nota2 + nota3)/3).toFixed(0);
  return promedio
}

function calcPromedio(row){
  var pro1 = parseFloat($('#'+row+' .p1').html());
  var pro2 = parseFloat($('#'+row+' .p2').html());
  pro1 = (Number.isNaN(pro1)) ? 0 : pro1;
  pro2 = (Number.isNaN(pro2)) ? 0 : pro2;
  var promedio = ((pro1+pro2)/2).toFixed(0);
  document.querySelector('#'+row+' .pf').innerHTML = promedio;
}