// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:app_qlphongtro_sv/network/model/common/base_model.dart';

class WUser extends BaseModel {
  // ignore: annotate_overrides, overridden_fields
  String id;

  String? username;
  String? email;
  String? password;
  String? totalGroup;
  String? totalRoom;
  String? totalRoomFull;

  WUser({
    required this.id,
    this.email,
    this.username,
    this.password,
    this.totalGroup,
    this.totalRoom,
    this.totalRoomFull,
  });

  static WUser fromMap(Map map, {String? id}) {
    return WUser(
      id: id ?? map['id'],
      email: map['email'],
      username: map['username'],
      password: map['password'] ?? '',
      totalGroup: map['totalGroup'] ?? '',
      totalRoom: map['totalRoom'] ?? '',
      totalRoomFull: map['totalRoomFull'] ?? '',
    );
  }

  static WUser fromUserPrefs(Map map, {String? id}) {
    return WUser(
      id: id ?? map['id'],
      email: map['email'],
      username: map['username'],
      password: map['password'] ?? '',
      totalGroup: map['totalGroup'] ?? '',
      totalRoom: map['totalRoom'] ?? '',
      totalRoomFull: map['totalRoomFull'] ?? '',
    );
  }

  Map<String, dynamic> toUserPrefs() {
    return {
      "id": id,
      "email": email,
      "username": username,
      "password": password,
      "totalGroup": totalGroup,
      "totalRoom": totalRoom,
      "totalRoomFull": totalRoomFull,
    };
  }

  factory WUser.fromDocument(DocumentSnapshot document) {
    return WUser.fromMap(
      document.data() as Map<String, dynamic>,
      id: document.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "email": email,
      "username": username,
      "password": password,
      "totalGroup": totalGroup,
      "totalRoom": totalRoom,
      "totalRoomFull": totalRoomFull,
    };
  }

  factory WUser.empty() => WUser(
      id: '',
      username: '',
      email: '',
      password: "",
      totalGroup: "",
      totalRoom: "",
      totalRoomFull: "");

  WUser copyWith({
    String? id,
    String? username,
    String? email,
    String? password,
    String? totalGroup,
    String? totalRoom,
    String? totalRoomFull,
  }) {
    return WUser(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
      totalGroup: totalGroup ?? this.totalGroup,
      totalRoom: totalRoom ?? this.totalRoom,
      totalRoomFull: totalRoomFull ?? this.totalRoomFull,
    );
  }
}
