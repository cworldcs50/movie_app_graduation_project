import 'package:equatable/equatable.dart';

class ErrorModel extends Equatable {
  final int statusCode;
  final String statusMessage;
  final bool success;

  const ErrorModel({
    required this.statusCode,
    required this.statusMessage,
    required this.success,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> jsonData) => ErrorModel(
    statusCode: jsonData['status_code'],
    statusMessage: jsonData['status_message'],
    success: jsonData['success'],
  );

  @override
  List<Object?> get props => [statusCode, statusMessage, success];
}
