class UserResponse {
  final bool error;
  final String message;
  final User user;

  UserResponse({
    required this.error,
    required this.message,
    required this.user,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      error: json['error'],
      message: json['message'],
      user: User.fromJson(json['response']),
    );
  }
}

class User {
  final String id;
  final String email;
  final String fullName;

  User({
    required this.id,
    required this.email,
    required this.fullName,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      fullName: json['fullName'],
    );
  }
}

