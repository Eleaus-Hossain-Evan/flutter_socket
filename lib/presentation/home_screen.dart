import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_socket/application/chat/chat_provider.dart';
import 'package:flutter_socket/presentation/chat_screen.dart';
import 'package:flutter_socket/presentation/widgets/k_list_view_separated.dart';
import 'package:flutter_socket/utils/api_routes.dart';
import 'package:flutter_socket/utils/utils.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomeScreen extends HookConsumerWidget {
  static const route = '/home';
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chatProvider);

    Future getData() async {
      await Future.microtask(
          () => ref.read(chatProvider.notifier).getMessageList());
    }

    useEffect(() {
      getData();

      return null;
    }, []);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: RefreshIndicator(
        onRefresh: () async => getData(),
        child: KListViewSeparated(
          itemCount: state.messageList.length,
          itemBuilder: (context, index) {
            final item = state.messageList[index];
            return Theme(
              data: ThemeData(
                listTileTheme: ListTileThemeData(
                  tileColor: context.theme.colorScheme.primaryContainer
                      .withOpacity(.25),
                  shape: ShapeBorder.lerp(
                    RoundedRectangleBorder(borderRadius: radius12),
                    RoundedRectangleBorder(borderRadius: radius12),
                    1,
                  ),
                ),
              ),
              child: ListTile(
                onTap: () => context.push(
                    '${ChatScreen.route}/${item.userInfo.id}?userName=${item.userInfo.name}'),
                leading: CircleAvatar(
                  backgroundImage: CachedNetworkImageProvider(
                    APIRoute.BASE_URL + item.userInfo.profilePicture,
                  ),
                ),
                title: Text(item.userInfo.name),
                subtitle: Text(item.message),
                trailing: Text(timeago.format(DateTime.parse(item.time))),
              ),
            );
          },
        ),
      ),
    );
  }
}
