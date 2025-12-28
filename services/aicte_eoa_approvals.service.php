<?php
require './service.php';
class AICTE_EOA_ApprovalsService extends Service
{
  function __construct()
  {
    parent::__construct("aicte_eoa_approvals","id");
  }
}
