import 'package:equatable/equatable.dart';

import '../../domain/message_list_response.dart';
import '../../utils/utils.dart';

class ChatState extends Equatable {
  final bool loading;
  final CleanFailure failure;
  final List<MessageModel> messageList;

  const ChatState({
    required this.loading,
    required this.failure,
    required this.messageList,
  });

  factory ChatState.init() {
    return ChatState(
      loading: false,
      failure: CleanFailure.none(),
      messageList: const [],
    );
  }

  ChatState copyWith({
    bool? loading,
    CleanFailure? failure,
    List<MessageModel>? messageList,
  }) {
    return ChatState(
      loading: loading ?? this.loading,
      failure: failure ?? this.failure,
      messageList: messageList ?? this.messageList,
    );
  }

  @override
  String toString() =>
      'ChatState(loading: $loading, failure: $failure, messageList: $messageList)';

  @override
  List<Object> get props => [loading, failure, messageList];
}
