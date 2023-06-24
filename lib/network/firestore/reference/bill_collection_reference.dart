import 'package:app_qlphongtro_sv/network/model/bill.dart';
import 'package:app_qlphongtro_sv/network/model/common/result.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'base_collection_reference.dart';

class BillCollectionReference extends BaseCollectionReference<WBill> {
  BillCollectionReference()
      : super(
          FirebaseFirestore.instance.collection("bills").withConverter<WBill>(
                fromFirestore: ((snapshot, _) => WBill.fromDocument(snapshot)),
                toFirestore: (model, _) => model.toMap(),
              ),
        );

  Future<XResult<bool>> postWGroup(WBill group) async {
    try {
      final userCollection = ref.doc(group.id);
      await userCollection.set(group);

      return XResult.success(true);
    } catch (e) {
      return XResult.exception(e);
    }
  }

  Future<XResult<List<WBill>>> getListGroup() async {
    try {
      final userCollection = await ref.get();
      final list = userCollection.docs.map((e) => e.data()).toList();

      return XResult.success(list);
    } catch (e) {
      return XResult.exception(e);
    }
  }
}
