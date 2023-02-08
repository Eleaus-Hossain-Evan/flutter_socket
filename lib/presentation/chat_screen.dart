import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_socket/domain/message_send/message_send_body.dart';
import 'package:flutter_socket/presentation/widgets/k_list_view_separated.dart';
import 'package:flutter_socket/presentation/widgets/k_text_form_field.dart';
import 'package:flutter_socket/utils/text_theme_style_x.dart';
import 'package:flutter_socket/utils/ui_constant.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../application/chat/chat_provider.dart';

class ChatScreen extends HookConsumerWidget {
  static const route = '/chat';
  const ChatScreen({
    Key? key,
    required this.id,
    required this.userName,
  }) : super(key: key);

  final String id;
  final String userName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chatProvider);

    final controller = useTextEditingController();

    getData() {
      Future.microtask(() => ref.read(chatProvider.notifier).allMessageView());
    }

    useEffect(() {
      getData();

      return null;
    }, []);
    return Scaffold(
      appBar: AppBar(
        title: Text(userName),
      ),
      body: KListViewSeparated(
        itemCount: state.chatList.length,
        reverse: true,
        itemBuilder: (context, index) {
          final chat = state.chatList[index];
          return Padding(
            padding: paddingH6,
            child: Column(
              crossAxisAlignment:
                  chat.senderMsgBy == "User" ? crossEnd : crossStart,
              children: [
                Container(
                  padding: padding6,
                  decoration: BoxDecoration(
                    color: context.color.primaryContainer.withOpacity(.2),
                    borderRadius: radius4,
                  ),
                  child: Text(chat.message),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: KTextFormField(
          controller: controller,
          hintText: 'Type a message',
          onFieldSubmitted: (value) async {
            final success = await ref.read(chatProvider.notifier).sendMessage(
                  MessageSendBody(
                      message: value, userId: '63bea870ea3282f72d4dfe82'),
                );

            if (success) {
              controller.clear();
            }
          },
        ),
      ),
    );
  }
}
