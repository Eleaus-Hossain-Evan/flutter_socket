import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:socket_io_client/socket_io_client.dart';

import '../../domain/chat_model.dart';
import 'socket_client.dart';

final socketProvider = Provider(SocketServices.new);

class SocketServices {
  final ProviderRef ref;
  Socket get _socketClient => ref.read(socketClientProvider).socket!;
  final socketResponse = StreamController<ChatModel>();
  SocketServices(this.ref) {
    _socketClient.emit('joinRoom', '63bea870ea3282f72d4dfe82');
  }

  // EMITS
  void sendMessage(ChatModel chat) {
    _socketClient.emit('newMessage', chat.toMap());
  }

  // LISTENERS
  void receiveMessage() {
    _socketClient.on('receiveMessage', (data) {
      final model = ChatModel.fromMap(data);
      socketResponse.sink.add(model);
    });
  }
}
