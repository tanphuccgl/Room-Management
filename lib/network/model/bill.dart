// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:app_qlphongtro_sv/network/model/common/base_model.dart';

class WBill extends BaseModel {
  // ignore: annotate_overrides, overridden_fields
  String id;
  String? total;

  WBill({
    required this.id,
    this.total,
  });

  static WBill fromMap(Map map, {String? id}) {
    return WBill(
      id: id ?? map['id'],
      total: map['total'],
    );
  }

  static WBill fromUserPrefs(Map map, {String? id}) {
    return WBill(
      id: id ?? map['id'],
      total: map['total'],
    );
  }

  Map<String, dynamic> toUserPrefs() {
    return {
      "id": id,
      "total": total,
    };
  }

  factory WBill.fromDocument(DocumentSnapshot document) {
    return WBill.fromMap(
      document.data() as Map<String, dynamic>,
      id: document.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "total": total,
    };
  }

  factory WBill.empty() => WBill(
        id: '',
        total: '',
      );

  WBill copyWith({
    String? id,
    String? total,
  }) {
    return WBill(
      id: id ?? this.id,
      total: total ?? this.total,
    );
  }
}
