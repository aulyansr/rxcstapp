class LoginPinRequest {
  String phone;
  String pin;
  LoginPinRequest({required this.phone, required this.pin});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'pin': pin, 'phone': phone};
  }
}
