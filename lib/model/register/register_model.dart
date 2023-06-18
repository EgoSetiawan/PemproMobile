class RegisterResponse {
  bool error;
  int code;
  String message;

  RegisterResponse({
    required this.error,
    required this.code,
    required this.message,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      error: json['error'] as bool,
      code: json['code'] as int,
      message: json['message'] as String,
    );
  }
}
