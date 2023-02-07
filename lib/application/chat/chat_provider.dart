import 'package:flutter_socket/application/chat/chat_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChatNotifier extends StateNotifier<ChatState> {
  ChatNotifier() : super(ChatState.init());
}
