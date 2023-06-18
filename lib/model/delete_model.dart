class LoginResult {
  int destroysUser;

  LoginResult({
    required this.destroysUser,
  });

  factory LoginResult.fromJson(Map<String, dynamic> json) {
    return LoginResult(
      destroysUser: json['DestroysUser'],
    );
  }
}

class DeleteResponse {
  bool error;
  int code;
  String message;
  LoginResult loginResult;

  DeleteResponse({
    required this.error,
    required this.code,
    required this.message,
    required this.loginResult,
  });

  factory DeleteResponse.fromJson(Map<String, dynamic> json) {
    return DeleteResponse(
      error: json['error'],
      code: json['code'],
      message: json['message'],
      loginResult: LoginResult.fromJson(json['loginResult']),
    );
  }
}
