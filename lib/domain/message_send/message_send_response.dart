import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../chat_model.dart';

class MessageSendResponse extends Equatable {
  final ChatModel data;
  final bool success;
  final String message;

  const MessageSendResponse({
    required this.data,
    required this.success,
    required this.message,
  });

  MessageSendResponse copyWith({
    ChatModel? data,
    bool? success,
    String? message,
  }) {
    return MessageSendResponse(
      data: data ?? this.data,
      success: success ?? this.success,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data.toMap(),
      'success': success,
      'message': message,
    };
  }

  factory MessageSendResponse.fromMap(Map<String, dynamic> map) {
    return MessageSendResponse(
      data: ChatModel.fromMap(map['data']),
      success: map['success'] ?? false,
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageSendResponse.fromJson(String source) =>
      MessageSendResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'MessageSendResponse(data: $data, success: $success, message: $message)';

  @override
  List<Object> get props => [data, success, message];
}
