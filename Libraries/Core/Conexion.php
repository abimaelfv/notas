<?php 

class Conexion{
    
  private $conectar;
  private $opciones = array(\PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES\'UTF8\'',\PDO::ATTR_ERRMODE => \PDO::ERRMODE_EXCEPTION);
  
  public function __construct(){
      $dsn = "mysql:host=".DB_HOST.";dbname=".DB_NAME.";charset=".DB_CHARSET;

      try {
          $this->conectar = new PDO($dsn, DB_USER, DB_PASSWORD, $this->opciones);
      } catch (PDOException $e) {
          $this->conectar = 'Error de conexión';
          echo "ERROR: ".$e->getMessage();
      }
  }

  public function conectar(){
      return $this->conectar;
  }

  public function desconectar(){
      $this->conectar = null;
  }
}

?>