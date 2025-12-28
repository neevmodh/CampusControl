<?php
require './service.php';
class FacilitiesFeedbackService extends Service
{
  function __construct()
  {
    parent::__construct("facilities_feedback", "id");
  }
}
