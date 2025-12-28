<?php
require './service.php';
class ParentsFeedbackService extends Service
{
  function __construct()
  {
    parent::__construct("parents_feedback", "id");
  }
}
