class RegisterRequest {
  final String customer_name;
  final String customer_phone;

  RegisterRequest({required this.customer_name, required this.customer_phone});

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'customer_name': customer_name,
      'customer_phone': customer_phone
    };
  }
}
