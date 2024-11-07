class LoginCheckPhoneResponse {
  int customer_id;
  String customer_phone;
  bool with_pin;

  LoginCheckPhoneResponse(
      {required this.customer_id,
      required this.customer_phone,
      required this.with_pin});

  static LoginCheckPhoneResponse fromJson(Map<String, dynamic> data) {
    return LoginCheckPhoneResponse(
        customer_id: data['customer_id'],
        customer_phone: data['customer_phone'],
        with_pin: data['with_pin']);
  }
}
