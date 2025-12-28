<?php
require_once './service.php';
  class FacultyEducationService extends Service
{
  function __construct()
  {
    parent::__construct("facultyeducation","ID");
  }
}
