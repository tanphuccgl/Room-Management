// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:app_qlphongtro_sv/network/model/common/base_model.dart';

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
  String? idContract;

  WStudent({
    required this.id,
    this.gender,
    this.name,
    this.phone,
    this.email,
    this.place,
    this.numberId,
    this.dateOfBirth,
    this.idContract,
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
      idContract: map['idContract'] ?? "",
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
      idContract: map['idContract'] ?? "",
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
      "idContract": idContract
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
      "idContract": idContract
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
        idContract: "",
      );

  WStudent copyWith({
    String? id,
    String? name,
    String? gender,
    String? phone,
    String? email,
    String? place,
    String? numberId,
    String? dateOfBirth,
    String? idContract,
  }) {
    return WStudent(
      id: id ?? this.id,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      place: place ?? this.place,
      numberId: numberId ?? this.numberId,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      idContract: idContract ?? this.idContract,
    );
  }
}
