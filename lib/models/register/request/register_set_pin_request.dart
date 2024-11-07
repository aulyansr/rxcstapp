class RegisterSetPinRequest {
  String customer_phone;
  String pin;
  RegisterSetPinRequest({required this.customer_phone, required this.pin});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{'pin': pin, 'customer_phone': customer_phone};
  }
}
