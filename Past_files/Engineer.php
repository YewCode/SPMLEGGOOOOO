<?php

class Engineer {
    private $eid;
    private $name;
    private $role;
    

    public function __construct($eid,$name, $role){
        $this->eid=$eid;
        $this->name=$name;
        $this->role=$role;
    }

    public function geteid(){
        return $this->eid;
    }
    public function getname(){
        return $this->name;
    }
    public function getrole(){
        return $this->role;
    }
    
}

?>

