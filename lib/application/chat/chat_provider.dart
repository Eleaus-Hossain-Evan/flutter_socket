import 'package:flutter_socket/application/chat/chat_state.dart';
import 'package:flutter_socket/application/socket/socket_method.dart';
import 'package:flutter_socket/domain/message_send/message_send_body.dart';
import 'package:flutter_socket/infustructure/chat_repo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final chatProvider = StateNotifierProvider<ChatNotifier, ChatState>((ref) {
  
  return ChatNotifier(ref, ChatRepo());
});

class ChatNotifier extends StateNotifier<ChatState> {
  final Ref ref;
  final ChatRepo repo;
  
  ChatNotifier(this.ref, this.repo, this.socket) : super(ChatState.init());

  // final socketResponse = StreamController<socket.socketResponse>();

  void getMessageList() async {
    state = state.copyWith(loading: true);
    final data = await repo.getMessageList();
    data.fold((l) {
      state = state.copyWith(loading: false, failure: l);
    }, (r) {
      state = state.copyWith(loading: false, messageList: r.data);
    });
  }

  void allMessageView() async {
    state = state.copyWith(loading: true);
    final data = await repo.allMessageView();
    data.fold((l) {
      state = state.copyWith(loading: false, failure: l);
    }, (r) {
      state = state.copyWith(loading: false, chatList: r.data.message);
    });
  }

  Future<bool> sendMessage(MessageSendBody body) async {
    bool success = false;
    final data = await repo.messageSend(body);
    data.fold((l) {
      state = state.copyWith(loading: false, failure: l);
    }, (r) {
      allMessageView();
      success = true;
     
      state = state.copyWith();
    });
    return success;
  }
}
