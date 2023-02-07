import 'package:flutter_socket/application/chat/chat_state.dart';
import 'package:flutter_socket/infustructure/chat_repo.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final chatProvider = StateNotifierProvider<ChatNotifier, ChatState>((ref) {
  return ChatNotifier(ref, ChatRepo());
});

class ChatNotifier extends StateNotifier<ChatState> {
  final Ref ref;
  final ChatRepo repo;
  ChatNotifier(this.ref, this.repo) : super(ChatState.init());

  void getMessageList() async {
    state = state.copyWith(loading: true);
    final data = await repo.getMessageList();
    data.fold((l) {
      state = state.copyWith(loading: false, failure: l);
    }, (r) {
      state = state.copyWith(loading: false, messageList: r.data);
    });
  }
}
