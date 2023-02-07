import 'dart:convert';

import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:flutter_socket/domain/message_list_response.dart';
import 'package:flutter_socket/domain/message_send/message_send_response.dart';
import 'package:fpdart/fpdart.dart';

import '../domain/message_view/message_view_response.dart';
import '../utils/api_routes.dart';
import '../utils/clean_failour.dart';
import '../utils/network_handler.dart';

class ChatRepo {
  final myApi = NetworkHandler.instance;

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

  Future<Either<CleanFailure, MessageSendResponse>> messageSend() async {
    final data = await myApi.get(
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
}
