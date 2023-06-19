import 'package:app_qlphongtro_sv/network/model/common/base_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class WStudent extends BaseModel {
  // ignore: annotate_overrides, overridden_fields
  String id;

  String? name;
  String? gender;
  String? phone;
  String? email;
  String? place;
  String? numberId;
  String? dateOfBirth;

  WStudent({
    required this.id,
    this.gender,
    this.name,
    this.phone,
    this.email,
    this.place,
    this.numberId,
    this.dateOfBirth,
  });

  static WStudent fromMap(Map map, {String? id}) {
    return WStudent(
      id: id ?? map['id'],
      gender: map['gender'],
      name: map['name'],
      phone: map['phone'] ?? '',
      place: map['place'] ?? '',
      numberId: map['numberId'] ?? '',
      email: map['email'] ?? '',
      dateOfBirth: map['dateOfBirth'] ?? "",
    );
  }

  static WStudent fromUserPrefs(Map map, {String? id}) {
    return WStudent(
      id: id ?? map['id'],
      email: map['email'],
      name: map['username'],
      phone: map['phone'] ?? '',
      place: map['place'] ?? '',
      gender: map['gender'] ?? '',
      numberId: map['numberId'] ?? '',
      dateOfBirth: map["dateOfBirth"] ?? "",
    );
  }

  Map<String, dynamic> toUserPrefs() {
    return {
      "id": id,
      "gender": gender,
      "name": name,
      "numberId": numberId,
      "email": email,
      "phone": phone,
      "place": place,
      "dateOfBirth": dateOfBirth,
    };
  }

  factory WStudent.fromDocument(DocumentSnapshot document) {
    return WStudent.fromMap(
      document.data() as Map<String, dynamic>,
      id: document.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "gender": gender,
      "name": name,
      "numberId": numberId,
      "email": email,
      "phone": phone,
      "place": place,
      "dateOfBirth": dateOfBirth,
    };
  }

  factory WStudent.empty() => WStudent(
        id: '',
        name: '',
        gender: '',
        phone: "",
        email: "",
        numberId: "",
        place: "",
        dateOfBirth: "",
      );

  WStudent copyWith({
    String? id,
    String? phone,
    String? name,
    String? email,
    String? gender,
    String? numberId,
    String? place,
    String? dateOfBirth,
  }) {
    return WStudent(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      gender: gender ?? this.gender,
      numberId: numberId ?? this.numberId,
      place: place ?? this.place,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    );
  }
}
