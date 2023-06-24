// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:app_qlphongtro_sv/network/model/common/base_model.dart';

class WRoom extends BaseModel {
  // ignore: annotate_overrides, overridden_fields
  String id;
  String? name;
  String? idGroup;
  bool? isEmpty;
  int? numberMember;

  WRoom({
    required this.id,
    this.name,
    this.isEmpty,
    this.numberMember,
    this.idGroup,
  });

  static WRoom fromMap(Map map, {String? id}) {
    return WRoom(
      id: id ?? map['id'],
      isEmpty: map['isEmpty'],
      name: map['name'],
      numberMember: map['numberMember'] ?? 0,
      idGroup: map['idGroup'] ?? "",
    );
  }

  static WRoom fromUserPrefs(Map map, {String? id}) {
    return WRoom(
      id: id ?? map['id'],
      isEmpty: map['isEmpty'],
      name: map['name'],
      numberMember: map['numberMember'] ?? 0,
      idGroup: map['idGroup'] ?? "",
    );
  }

  Map<String, dynamic> toUserPrefs() {
    return {
      "id": id,
      "isEmpty": isEmpty,
      "name": name,
      "numberMember": numberMember,
      "idGroup": idGroup,
    };
  }

  factory WRoom.fromDocument(DocumentSnapshot document) {
    return WRoom.fromMap(
      document.data() as Map<String, dynamic>,
      id: document.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "isEmpty": isEmpty,
      "name": name,
      "numberMember": numberMember,
      "idGroup": idGroup,
    };
  }

  factory WRoom.empty() => WRoom(
        id: '',
        name: '',
        idGroup: "",
        numberMember: 0,
        isEmpty: false,
      );

  WRoom copyWith({
    String? id,
    String? name,
    String? idGroup,
    bool? isEmpty,
    int? numberMember,
  }) {
    return WRoom(
      id: id ?? this.id,
      name: name ?? this.name,
      idGroup: idGroup ?? this.idGroup,
      isEmpty: isEmpty ?? this.isEmpty,
      numberMember: numberMember ?? this.numberMember,
    );
  }
}
