import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_socket/domain/user_model.dart';

import '../chat_model.dart';

class MessageViewResponse extends Equatable {
  final Data data;
  final bool success;
  final String message;

  const MessageViewResponse({
    required this.data,
    required this.success,
    required this.message,
  });

  MessageViewResponse copyWith({
    Data? data,
    bool? success,
    String? message,
  }) {
    return MessageViewResponse(
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

  factory MessageViewResponse.fromMap(Map<String, dynamic> map) {
    return MessageViewResponse(
      data: Data.fromMap(map['data']),
      success: map['success'] ?? false,
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageViewResponse.fromJson(String source) =>
      MessageViewResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'MessageViewResponse(data: $data, success: $success, message: $message)';

  @override
  List<Object> get props => [data, success, message];
}

class Data extends Equatable {
  final int resultsPerPage;
  final int allMessageLength;
  final List<ChatModel> message;

  const Data({
    required this.resultsPerPage,
    required this.allMessageLength,
    required this.message,
  });

  factory Data.init() {
    return const Data(
      resultsPerPage: 0,
      allMessageLength: 0,
      message: [],
    );
  }

  Data copyWith({
    int? resultsPerPage,
    int? allMessageLength,
    List<ChatModel>? message,
  }) {
    return Data(
      resultsPerPage: resultsPerPage ?? this.resultsPerPage,
      allMessageLength: allMessageLength ?? this.allMessageLength,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'resultsPerPage': resultsPerPage,
      'allMessageLength': allMessageLength,
      'message': message.map((x) => x.toMap()).toList(),
    };
  }

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      resultsPerPage: map['resultsPerPage']?.toInt() ?? 0,
      allMessageLength: map['allMessageLength']?.toInt() ?? 0,
      message: List<ChatModel>.from(
          map['message']?.map((x) => ChatModel.fromMap(x)) ?? const []),
    );
  }

  String toJson() => json.encode(toMap());

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));

  @override
  String toString() =>
      'Data(resultsPerPage: $resultsPerPage, allMessageLength: $allMessageLength, message: $message)';

  @override
  List<Object> get props => [resultsPerPage, allMessageLength, message];
}
