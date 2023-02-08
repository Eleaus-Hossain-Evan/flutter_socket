import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../domain/chat_model.dart';
import '../../domain/message_list_response.dart';
import '../../utils/utils.dart';

class ChatState extends Equatable {
  final bool loading;
  final CleanFailure failure;
  final List<MessageModel> messageList;
  final List<ChatModel> chatList;

  const ChatState({
    required this.loading,
    required this.failure,
    required this.messageList,
    required this.chatList,
  });

  factory ChatState.init() {
    return ChatState(
      loading: false,
      failure: CleanFailure.none(),
      messageList: const [],
      chatList: const [],
    );
  }

  ChatState copyWith({
    bool? loading,
    CleanFailure? failure,
    List<MessageModel>? messageList,
    List<ChatModel>? chatList,
  }) {
    return ChatState(
      loading: loading ?? this.loading,
      failure: failure ?? this.failure,
      messageList: messageList ?? this.messageList,
      chatList: chatList ?? this.chatList,
    );
  }

  @override
  String toString() {
    return 'ChatState(loading: $loading, failure: $failure, messageList: $messageList, chatList: $chatList)';
  }

  @override
  List<Object> get props => [loading, failure, messageList, chatList];
}
