class LoginResponse {
  bool error;
  String message;
  LoginResult loginResult;

  LoginResponse({
    required this.error,
    required this.message,
    required this.loginResult,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      error: json['error'],
      message: json['message'],
      loginResult: LoginResult.fromJson(json['loginResult']),
    );
  }
}

class LoginResult {
  String userId;
  String name;
  String email;
  String token;

  LoginResult({
    required this.userId,
    required this.name,
    required this.email,
    required this.token,
  });

  factory LoginResult.fromJson(Map<String, dynamic> json) {
    return LoginResult(
      userId: json['userId'],
      name: json['name'],
      email: json['email'],
      token: json['token'],
    );
  }
}
