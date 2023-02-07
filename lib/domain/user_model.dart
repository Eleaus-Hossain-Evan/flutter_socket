import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String id;
  final String profilePicture;
  final String name;

  const UserModel({
    required this.id,
    required this.profilePicture,
    required this.name,
  });

  factory UserModel.init() {
    return const UserModel(
      id: '',
      profilePicture: '',
      name: '',
    );
  }

  UserModel copyWith({
    String? id,
    String? profilePicture,
    String? name,
  }) {
    return UserModel(
      id: id ?? this.id,
      profilePicture: profilePicture ?? this.profilePicture,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'profilePicture': profilePicture,
      'name': name,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['_id'] ?? '',
      profilePicture: map['profilePicture'] ?? '',
      name: map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'Sender(_id: $id, profilePicture: $profilePicture, name: $name)';

  @override
  List<Object> get props => [id, profilePicture, name];
}
