<?php
require './service.php';
class AlumniFeedbackService extends Service
{
  function __construct()
  {
    parent::__construct("alumnus_feedback", "id");
  }
}
