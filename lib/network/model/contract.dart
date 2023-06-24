// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:app_qlphongtro_sv/network/model/common/base_model.dart';

class WContract extends BaseModel {
  // ignore: annotate_overrides, overridden_fields
  final String id;
  final String idRoom;
  final String idStudent;

  final String hostName;
  final String hostPhone;
  final String hostPlace;
  final String hostEmail;

  final String roomPlace;
  final String roomStart;
  final String roomEnd;

  final String roomPrice;
  final String roomPay;
  final String roomOtherFees;
  final String roomDeposit;

  final String roomRule;
  final String roomFix;

  final String roomContractTerminatio;
  final String roomDispute;
  WContract({
    required this.id,
    required this.idRoom,
    required this.idStudent,
    required this.hostName,
    required this.hostPhone,
    required this.hostPlace,
    required this.hostEmail,
    required this.roomPlace,
    required this.roomStart,
    required this.roomEnd,
    required this.roomPrice,
    required this.roomPay,
    required this.roomOtherFees,
    required this.roomDeposit,
    required this.roomRule,
    required this.roomFix,
    required this.roomContractTerminatio,
    required this.roomDispute,
  });

  WContract copyWith({
    String? id,
    String? idRoom,
    String? idStudent,
    String? hostName,
    String? hostPhone,
    String? hostPlace,
    String? hostEmail,
    String? roomPlace,
    String? roomStart,
    String? roomEnd,
    String? roomPrice,
    String? roomPay,
    String? roomOtherFees,
    String? roomDeposit,
    String? roomRule,
    String? roomFix,
    String? roomContractTerminatio,
    String? roomDispute,
  }) {
    return WContract(
      id: id ?? this.id,
      idRoom: idRoom ?? this.idRoom,
      idStudent: idStudent ?? this.idStudent,
      hostName: hostName ?? this.hostName,
      hostPhone: hostPhone ?? this.hostPhone,
      hostPlace: hostPlace ?? this.hostPlace,
      hostEmail: hostEmail ?? this.hostEmail,
      roomPlace: roomPlace ?? this.roomPlace,
      roomStart: roomStart ?? this.roomStart,
      roomEnd: roomEnd ?? this.roomEnd,
      roomPrice: roomPrice ?? this.roomPrice,
      roomPay: roomPay ?? this.roomPay,
      roomOtherFees: roomOtherFees ?? this.roomOtherFees,
      roomDeposit: roomDeposit ?? this.roomDeposit,
      roomRule: roomRule ?? this.roomRule,
      roomFix: roomFix ?? this.roomFix,
      roomContractTerminatio:
          roomContractTerminatio ?? this.roomContractTerminatio,
      roomDispute: roomDispute ?? this.roomDispute,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'idRoom': idRoom,
      'idStudent': idStudent,
      'hostName': hostName,
      'hostPhone': hostPhone,
      'hostPlace': hostPlace,
      'hostEmail': hostEmail,
      'roomPlace': roomPlace,
      'roomStart': roomStart,
      'roomEnd': roomEnd,
      'roomPrice': roomPrice,
      'roomPay': roomPay,
      'roomOtherFees': roomOtherFees,
      'roomDeposit': roomDeposit,
      'roomRule': roomRule,
      'roomFix': roomFix,
      'roomContractTerminatio': roomContractTerminatio,
      'roomDispute': roomDispute,
    };
  }

  factory WContract.fromMap(Map<String, dynamic> map, {String? id}) {
    return WContract(
      id: map['id'] as String,
      idRoom: map['idRoom'] as String,
      idStudent: map['idStudent'] as String,
      hostName: map['hostName'] as String,
      hostPhone: map['hostPhone'] as String,
      hostPlace: map['hostPlace'] as String,
      hostEmail: map['hostEmail'] as String,
      roomPlace: map['roomPlace'] as String,
      roomStart: map['roomStart'] as String,
      roomEnd: map['roomEnd'] as String,
      roomPrice: map['roomPrice'] as String,
      roomPay: map['roomPay'] as String,
      roomOtherFees: map['roomOtherFees'] as String,
      roomDeposit: map['roomDeposit'] as String,
      roomRule: map['roomRule'] as String,
      roomFix: map['roomFix'] as String,
      roomContractTerminatio: map['roomContractTerminatio'] as String,
      roomDispute: map['roomDispute'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory WContract.fromJson(String source) =>
      WContract.fromMap(json.decode(source) as Map<String, dynamic>);

  factory WContract.fromDocument(DocumentSnapshot document) {
    return WContract.fromMap(
      document.data() as Map<String, dynamic>,
      id: document.id,
    );
  }
  factory WContract.empty() => WContract(
      id: "",
      idRoom: "",
      idStudent: "",
      hostName: "",
      hostPhone: "",
      hostPlace: "",
      hostEmail: "",
      roomPlace: "",
      roomStart: "",
      roomEnd: "",
      roomPrice: "",
      roomPay: "",
      roomOtherFees: "",
      roomDeposit: "",
      roomRule: "",
      roomFix: "",
      roomContractTerminatio: "",
      roomDispute: "");
}
