<?php
// Số điện thoại của bạn
$myNumber = "+84xxxxxxxxxx";

// Đầu số của Việt Nam
$countryCode = "+84";

// Nhận tin nhắn từ SMSTools3 adb
$command = "adb shell am broadcast -a com.google.android.intent.action.SMS_RECEIVED --es address $myNumber --es sms_body 'Hello world!'";
exec($command);

// Trả về phản hồi thành công
echo json_encode(array(
  array(
    "number" => $myNumber,
    "message" => "Hello world!"
  )
));
?>
