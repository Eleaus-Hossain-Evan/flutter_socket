import 'dart:convert';

import 'package:equatable/equatable.dart';

class MessageListResponse extends Equatable {
  final List<MessageModel> data;
  final bool success;
  final String message;

  MessageListResponse({
    required this.data,
    required this.success,
    required this.message,
  });

  MessageListResponse copyWith({
    List<MessageModel>? data,
    bool? success,
    String? message,
  }) {
    return MessageListResponse(
      data: data ?? this.data,
      success: success ?? this.success,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'data': data.map((x) => x.toMap()).toList(),
      'success': success,
      'message': message,
    };
  }

  factory MessageListResponse.fromMap(Map<String, dynamic> map) {
    return MessageListResponse(
      data: List<MessageModel>.from(
          map['data']?.map((x) => MessageModel.fromMap(x)) ?? const []),
      success: map['success'] ?? false,
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageListResponse.fromJson(String source) =>
      MessageListResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'ChatListResponse(data: $data, success: $success, message: $message)';

  @override
  List<Object> get props => [data, success, message];
}

class MessageModel extends Equatable {
  final String id;
  final String time;
  final UserInfo userInfo;
  final String message;

  const MessageModel({
    required this.id,
    required this.time,
    required this.userInfo,
    required this.message,
  });

  factory MessageModel.init() {
    return MessageModel(
      id: '',
      time: '',
      userInfo: UserInfo.init(),
      message: '',
    );
  }

  MessageModel copyWith({
    String? id,
    String? time,
    UserInfo? userInfo,
    String? message,
  }) {
    return MessageModel(
      id: id ?? this.id,
      time: time ?? this.time,
      userInfo: userInfo ?? this.userInfo,
      message: message ?? this.message,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'time': time,
      'userInfo': userInfo.toMap(),
      'message': message,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      id: map['_id'] ?? '',
      time: map['time'] ?? '',
      userInfo: UserInfo.fromMap(map['userInfo']),
      message: map['message'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) =>
      MessageModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Data(_id: $id, time: $time, userInfo: $userInfo, message: $message)';
  }

  @override
  List<Object> get props => [id, time, userInfo, message];
}

class UserInfo extends Equatable {
  final String id;
  final String name;
  final String profilePicture;

  const UserInfo({
    required this.id,
    required this.name,
    required this.profilePicture,
  });

  factory UserInfo.init() {
    return const UserInfo(
      id: '',
      name: '',
      profilePicture: '',
    );
  }

  UserInfo copyWith({
    String? id,
    String? name,
    String? profilePicture,
  }) {
    return UserInfo(
      id: id ?? this.id,
      name: name ?? this.name,
      profilePicture: profilePicture ?? this.profilePicture,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'name': name,
      'profilePicture': profilePicture,
    };
  }

  factory UserInfo.fromMap(Map<String, dynamic> map) {
    return UserInfo(
      id: map['_id'] ?? '',
      name: map['name'] ?? '',
      profilePicture: map['profilePicture'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserInfo.fromJson(String source) =>
      UserInfo.fromMap(json.decode(source));

  @override
  String toString() =>
      'UserInfo(_id: $id, name: $name, profilePicture: $profilePicture)';

  @override
  List<Object> get props => [id, name, profilePicture];
}
