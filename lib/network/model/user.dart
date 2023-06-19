import 'package:app_qlphongtro_sv/network/model/common/base_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WUser extends BaseModel {
  // ignore: annotate_overrides, overridden_fields
  String id;

  String? username;
  String? email;
  String? password;

  WUser({
    required this.id,
    this.email,
    this.username,
    this.password,
  });

  static WUser fromMap(Map map, {String? id}) {
    return WUser(
      id: id ?? map['id'],
      email: map['email'],
      username: map['username'],
      password: map['password'] ?? '',
    );
  }

  static WUser fromUserPrefs(Map map, {String? id}) {
    return WUser(
      id: id ?? map['id'],
      email: map['email'],
      username: map['username'],
      password: map['password'] ?? '',
    );
  }

  Map<String, dynamic> toUserPrefs() {
    return {
      "id": id,
      "email": email,
      "username": username,
      "password": password,
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
    };
  }

  factory WUser.empty() => WUser(
        id: '',
        username: '',
        email: '',
        password: "",
      );

  WUser copyWith({
    String? id,
    String? password,
    String? username,
    String? email,
  }) {
    return WUser(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
