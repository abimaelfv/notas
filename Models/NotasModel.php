<?php

class NotasModel extends Mysql{

  public function __construct(){
    parent:: __construct();
  }

  public function selectAlumno(){
    $sql = "SELECT  * FROM alumno";
    $request = $this->select($sql);
    return $request;
  }

  public function selectNotaAlumno($alumno){
    $sql = "SELECT id, valor FROM notas WHERE alumno_id = $alumno";
    $request = $this->select($sql);
    return $request;
  }


}