<?php
require './service.php';
class DisclosureService extends Service
{
  function __construct()
  {
    parent::__construct("disclosure","id");
  }
}
