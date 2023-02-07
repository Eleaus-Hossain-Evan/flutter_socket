import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_socket/domain/user_model.dart';

class ChatModel extends Equatable {
  final String id;
  final UserModel sender;
  final String senderMsgBy;
  final UserModel receiver;
  final String receiverMsgBy;
  final String message;
  final String msgSendingTime;
  final bool messageSeen;
  final String msgSeenTime;
  final String createdAt;
  final String updatedAt;

  const ChatModel({
    required this.id,
    required this.sender,
    required this.senderMsgBy,
    required this.receiver,
    required this.receiverMsgBy,
    required this.message,
    required this.msgSendingTime,
    required this.messageSeen,
    required this.msgSeenTime,
    required this.createdAt,
    required this.updatedAt,
  });

  ChatModel copyWith({
    String? id,
    UserModel? sender,
    String? senderMsgBy,
    UserModel? receiver,
    String? receiverMsgBy,
    String? message,
    String? msgSendingTime,
    bool? messageSeen,
    String? msgSeenTime,
    String? createdAt,
    String? updatedAt,
  }) {
    return ChatModel(
      id: id ?? this.id,
      sender: sender ?? this.sender,
      senderMsgBy: senderMsgBy ?? this.senderMsgBy,
      receiver: receiver ?? this.receiver,
      receiverMsgBy: receiverMsgBy ?? this.receiverMsgBy,
      message: message ?? this.message,
      msgSendingTime: msgSendingTime ?? this.msgSendingTime,
      messageSeen: messageSeen ?? this.messageSeen,
      msgSeenTime: msgSeenTime ?? this.msgSeenTime,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'sender': sender.toMap(),
      'senderMsgBy': senderMsgBy,
      'receiver': receiver.toMap(),
      'receiverMsgBy': receiverMsgBy,
      'message': message,
      'msgSendingTime': msgSendingTime,
      'messageSeen': messageSeen,
      'msgSeenTime': msgSeenTime,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      id: map['_id'] ?? '',
      sender: UserModel.fromMap(map['sender']),
      senderMsgBy: map['senderMsgBy'] ?? '',
      receiver: UserModel.fromMap(map['receiver']),
      receiverMsgBy: map['receiverMsgBy'] ?? '',
      message: map['message'] ?? '',
      msgSendingTime: map['msgSendingTime'] ?? '',
      messageSeen: map['messageSeen'] ?? false,
      msgSeenTime: map['msgSeenTime'] ?? '',
      createdAt: map['createdAt'] ?? '',
      updatedAt: map['updatedAt'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatModel.fromJson(String source) =>
      ChatModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Message(_id: $id, sender: $sender, senderMsgBy: $senderMsgBy, receiver: $receiver, receiverMsgBy: $receiverMsgBy, message: $message, msgSendingTime: $msgSendingTime, messageSeen: $messageSeen, msgSeenTime: $msgSeenTime, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  List<Object> get props {
    return [
      id,
      sender,
      senderMsgBy,
      receiver,
      receiverMsgBy,
      message,
      msgSendingTime,
      messageSeen,
      msgSeenTime,
      createdAt,
      updatedAt,
    ];
  }
}
