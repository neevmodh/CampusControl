<?php
require_once __DIR__ . '/../service.php';

class DepartmentService extends Service {

    public function __construct() {
        parent::__construct('department', 'DepartmentID');
    }   
    public function getDeptName($id) {
       $result =  $this->fetchOne($id);
       return $result['DepartmentName'];
    }
}