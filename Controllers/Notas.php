<?php
class Notas extends Controllers{
  public function __construct(){
    parent:: __construct(); 
  }

  public function notas(){
    $data['page_tag'] = "Notas";
    $data['page_title'] = "Notas";
    $data['alumnos'] = $this->getAlumnos();
    
    $this->views->getView($this,"notas",$data);
  }

  public function getAlumnos(){
    $alumnos = $this->model->selectAlumno();
    
    
    if(!empty($alumnos)){
      for ($i=0; $i < count($alumnos); $i++) {
        $alumnos[$i]['notas'] = array();
        $notas = $this->model->selectNotaAlumno($alumnos[$i]['id']);
        
        for ($j=0; $j < 6; $j++) {
          if(isset($notas[$j]['valor'])){
            $alumnos[$i]['notas'][$j] = $notas[$j]['valor'];
          }else{
            $alumnos[$i]['notas'][$j] = 0;
          }
        }
      }
    }
    return $alumnos;
  }
}
?>