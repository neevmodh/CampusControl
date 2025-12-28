<?php
require_once './service.php';
  class AddCalendarService extends Service
{
  function __construct()
  {
    parent::__construct("dept_academiccalender","ID");
  }
}
