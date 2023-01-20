<?php

class Home extends Controllers{

    public function __construct(){
        session_start();
        parent:: __construct();
    }

    public function home(){
        $data['page_tag'] = "Home";
        $data['page_title'] = "Home";

        $this->views->getView($this,"home",$data);
    }


}

?>