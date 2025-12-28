<?php
require './service.php';
  class EventService extends Service
{
  function __construct()
  {
    parent::__construct("events","E_ID");
  }
}
