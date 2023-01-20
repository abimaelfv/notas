<?php

  // cargar Controladores
  $controller = ucwords($controller); // mayu inicio letra
  $controllerFile = "Controllers/".$controller.".php";
  if(file_exists($controllerFile)){   // validar controlador
      require_once($controllerFile);
      $controller = new $controller(); // instancia
      if (method_exists($controller, $method)) {  // validar existencia de metodos
          $controller->{$method}($parametros);  // llmar metodo de controller
      }else{
          echo "Pagina no encontrada";
      }
  }else{
      echo "Pagina no encontrada";
  }

?>