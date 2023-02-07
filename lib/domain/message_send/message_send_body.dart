import 'dart:convert';

import 'package:equatable/equatable.dart';

class MessageSendBody extends Equatable {
  final String message;
  final String userId;

  const MessageSendBody({
    required this.message,
    required this.userId,
  });

  MessageSendBody copyWith({
    String? message,
    String? userId,
  }) {
    return MessageSendBody(
      message: message ?? this.message,
      userId: userId ?? this.userId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'userId': userId,
    };
  }

  factory MessageSendBody.fromMap(Map<String, dynamic> map) {
    return MessageSendBody(
      message: map['message'] ?? '',
      userId: map['userId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageSendBody.fromJson(String source) =>
      MessageSendBody.fromMap(json.decode(source));

  @override
  String toString() => 'MessageSendBody(message: $message, userId: $userId)';

  @override
  List<Object> get props => [message, userId];
}
