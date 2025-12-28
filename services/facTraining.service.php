<?php
require './service.php';
class FacTrainingService extends Service
{
  function __construct()
  {
    parent::__construct("trainingdetails","ID");
  }
}