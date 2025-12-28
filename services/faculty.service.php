<?php
require_once './service.php';
class FacultyService extends Service
{
  function __construct()
  {
    parent::__construct("faculty", "FacultyID");
  }
}
