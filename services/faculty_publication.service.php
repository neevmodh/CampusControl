<?php
require_once './service.php';
class FacultyPublicationService extends Service
{
  function __construct()
  {
    parent::__construct("facultypubliation","ID");
  }
}
