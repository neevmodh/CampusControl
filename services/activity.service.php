<?php
require './service.php';
class ActivityService extends Service
{
  function __construct()
  {
    parent::__construct("activity","ID");
  }
}
