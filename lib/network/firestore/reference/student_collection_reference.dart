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

  Future<XResult<List<WStudent>>> getListStudent() async {
    try {
      final userCollection = await ref.get();
      final list = userCollection.docs.map((e) => e.data()).toList();

      return XResult.success(list);
    } catch (e) {
      return XResult.exception(e);
    }
  }

  Future<XResult<WStudent>> getInfoStudent(String id) async {
    try {
      var snapshot = await ref.where('id', isEqualTo: id).limit(1).get();
      final result = snapshot.docs.map((e) => e.data()).first;

      return XResult.success(result);
    } catch (e) {
      return XResult.exception(e);
    }
  }

  Future<XResult<bool>> removeStudent(String id) async {
    try {
      remove(id);

      return XResult.success(true);
    } catch (e) {
      return XResult.exception(e);
    }
  }
}
