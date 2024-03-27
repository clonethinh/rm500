<?php
// Số điện thoại của bạn
$myNumber = "+84xxxxxxxxxx";

// Đầu số của Việt Nam
$countryCode = "+84";

// Nhận số điện thoại và tin nhắn từ biểu mẫu
$number = $_POST["number"];
$message = $_POST["message"];

// Kiểm tra xem số điện thoại có hợp lệ không
if (!preg_match("/^\+84[0-9]{9}$/", $number)) {
  echo "Số điện thoại không hợp lệ";
  exit;
}

// Gửi tin nhắn bằng SMSTools3 adb
$command = "adb shell am broadcast -a com.google.android.intent.action.SMS_SEND --es address $number --es sms_body $message";
exec($command);

// Trả về phản hồi thành công
echo "Tin nhắn đã được gửi";
?>
