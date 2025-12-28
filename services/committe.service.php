<?php
require './service.php';
  class CommitteService extends Service
{
  function __construct()
  {
    parent::__construct("committe","CommitteId");
    
  }
  
}