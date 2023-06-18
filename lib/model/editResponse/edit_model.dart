class EditResponse {
  final bool error;
  final int code;
  final String message;

  EditResponse({required this.error, required this.code, required this.message});

  factory EditResponse.fromJson(Map<String, dynamic> json) {
    return EditResponse(
      error: json['error'] ?? false,
      code: json['code'] ?? 0,
      message: json['message'] ?? '',
    );
  }
}
