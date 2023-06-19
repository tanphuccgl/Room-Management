import 'package:app_qlphongtro_sv/network/model/common/result.dart';
import 'package:app_qlphongtro_sv/network/model/student.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'base_collection_reference.dart';

class StudentCollectionReference extends BaseCollectionReference<WStudent> {
  StudentCollectionReference()
      : super(
          FirebaseFirestore.instance
              .collection("students")
              .withConverter<WStudent>(
                fromFirestore: ((snapshot, _) =>
                    WStudent.fromDocument(snapshot)),
                toFirestore: (model, _) => model.toMap(),
              ),
        );

  Future<XResult<bool>> postStudent(WStudent student) async {
    try {
      final userCollection = ref.doc(student.id);
      await userCollection.set(student);

      return XResult.success(true);
    } catch (e) {
      return XResult.exception(e);
    }
  }
}
