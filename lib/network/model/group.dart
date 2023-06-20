import 'package:app_qlphongtro_sv/network/model/common/base_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WGroup extends BaseModel {
  // ignore: annotate_overrides, overridden_fields
  String id;
  String? name;
  String? place;
  int? numberRoom;
  int? numberEmpty;

  WGroup({
    required this.id,
    this.name,
    this.numberRoom,
    this.numberEmpty,
    this.place,
  });

  static WGroup fromMap(Map map, {String? id}) {
    return WGroup(
      id: id ?? map['id'],
      numberRoom: map['numberRoom'],
      name: map['name'],
      numberEmpty: map['numberEmpty'] ?? 0,
      place: map['place'] ?? 0,
    );
  }

  static WGroup fromUserPrefs(Map map, {String? id}) {
    return WGroup(
      id: id ?? map['id'],
      numberRoom: map['numberRoom'],
      name: map['name'],
      numberEmpty: map['numberEmpty'] ?? 0,
      place: map['place'] ?? 0,
    );
  }

  Map<String, dynamic> toUserPrefs() {
    return {
      "id": id,
      "numberRoom": numberRoom,
      "name": name,
      "numberEmpty": numberEmpty,
      "place": place,
    };
  }

  factory WGroup.fromDocument(DocumentSnapshot document) {
    return WGroup.fromMap(
      document.data() as Map<String, dynamic>,
      id: document.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "numberRoom": numberRoom,
      "name": name,
      "numberEmpty": numberEmpty,
      "place": place,
    };
  }

  factory WGroup.empty() => WGroup(
        id: '',
        name: '',
        place: "",
        numberEmpty: 0,
        numberRoom: 0,
      );

  WGroup copyWith({
    String? id,
    String? name,
    String? place,
    int? numberEmpty,
    int? numberRoom,
  }) {
    return WGroup(
      id: id ?? this.id,
      name: name ?? this.name,
      place: place ?? this.place,
      numberEmpty: numberEmpty ?? this.numberEmpty,
      numberRoom: numberRoom ?? this.numberRoom,
    );
  }
}
