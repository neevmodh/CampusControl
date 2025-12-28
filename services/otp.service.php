<?php
require_once './service.php';
class OTPService extends Service
{
  function __construct()
  {
    parent::__construct("verify_otp", "id");
  }

  public function generateOtp()
  {
    $otp = rand(1000, 9999);
    return $otp;
  }

  public function generateResetKey()
  {
    $length = 24;
    $randomString = bin2hex(random_bytes($length / 2));
    return $randomString;
  }
}
