class LoginResult {
  final String namalengkap;
  final String profile;

  LoginResult({required this.namalengkap, required this.profile});

  factory LoginResult.fromJson(Map<String, dynamic> json) {
    return LoginResult(
      namalengkap: json['namalengkap'] ?? '',
      profile: json['profile'] ?? '',
    );
  }
}

class DetailResponse {
  final bool error;
  final int code;
  final String message;
  final LoginResult loginResult;

  DetailResponse({
    required this.error,
    required this.code,
    required this.message,
    required this.loginResult,
  });

  factory DetailResponse.fromJson(Map<String, dynamic> json) {
    return DetailResponse(
      error: json['error'] ?? false,
      code: json['code'] ?? 0,
      message: json['message'] ?? '',
      loginResult: LoginResult.fromJson(json['loginResult'] ?? {}),
    );
  }
}
