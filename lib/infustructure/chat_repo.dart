import 'dart:convert';
import 'dart:developer';

import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_socket/domain/message_list_response.dart';
import 'package:flutter_socket/domain/message_send/message_send_body.dart';
import 'package:flutter_socket/domain/message_send/message_send_response.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import '../domain/message_view/message_view_response.dart';
import '../utils/api_routes.dart';
import '../utils/utils.dart';

class ChatRepo {
  final myApi = NetworkHandler.instance;
  IO.Socket? socket;

  Future<Either<CleanFailure, MessageListResponse>> getMessageList() async {
    final data = await myApi.get(
      fromData: (json) => MessageListResponse.fromMap(json),
      endPoint: APIRoute.MESSAGE_LIST,
      withToken: true,
    );

    Logger.i("Notification: $data");

    return data.fold((l) {
      final error = jsonDecode(l.error);
      final failure = l.copyWith(error: error['error']['message']);
      return left(failure);
    }, (r) => right(r));
  }

  Future<Either<CleanFailure, MessageSendResponse>> messageSend(
      MessageSendBody body) async {
    final data = await myApi.post(
      body: body.toMap(),
      fromData: (json) => MessageSendResponse.fromMap(json),
      endPoint: APIRoute.MESSAGE_SEND,
      withToken: true,
    );

    Logger.i("Notification: $data");

    return data.fold((l) {
      final error = jsonDecode(l.error);
      final failure = l.copyWith(error: error['error']['message']);
      return left(failure);
    }, (r) => right(r));
  }

  Future<Either<CleanFailure, MessageViewResponse>> allMessageView(
      {int page = 1}) async {
    final data = await myApi.get(
      fromData: (json) => MessageViewResponse.fromMap(json),
      endPoint: APIRoute.MESSAGE_VIEW,
      withToken: true,
    );

    Logger.i("Notification: $data");

    return data.fold((l) {
      final error = jsonDecode(l.error);
      final failure = l.copyWith(error: error['error']['message']);
      return left(failure);
    }, (r) => right(r));
  }

  void otherSocketSubmit({
    required String userId,
    required String other,
    required List<String> vendors,
  }) {
    socket = IO.io(APIRoute.BASE_URL, <String, dynamic>{
      'autoConnect': false,
      'transports': ['websocket'],
    });
    if (socket != null) {
      socket!.connect();
      socket!.onConnect((_) {
        log('Connection established');
        socket!.emit('joinRoom', userId);
      });
      socket!.onDisconnect((_) => log('Connection Disconnection'));
      socket!.onConnectError((err) => log(err));
      socket!.onError((err) => log(err));
      socket!.emit(
        "othersUserSubmit",
        {"othersProblem": other, "vendor": vendors},
      );

      socket!.on('othersReceive-UserPanel', (playerData) {
        log("*********************************************************");
        log("playerData: $playerData");
        log("*********************************************************");

// [log] Connection established
// [log] *********************************************************
// [log] playerData: {othersProblem: my problem, receiverId: 63d0460092e5fb2002c99a58}
// [log] *********************************************************
      });
    }
  }
}
