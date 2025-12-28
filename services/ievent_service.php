<?php
require './service.php';
  class IEventService extends Service
{
  function __construct()
  {
    parent::__construct("institute_events","E_ID");
  }
}   
