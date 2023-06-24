import 'package:app_qlphongtro_sv/network/model/common/result.dart';
import 'package:app_qlphongtro_sv/network/model/contract.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'base_collection_reference.dart';

class ContractCollectionReference extends BaseCollectionReference<WContract> {
  ContractCollectionReference()
      : super(
          FirebaseFirestore.instance
              .collection("contracts")
              .withConverter<WContract>(
                fromFirestore: ((snapshot, _) =>
                    WContract.fromDocument(snapshot)),
                toFirestore: (model, _) => model.toMap(),
              ),
        );

  Future<XResult<bool>> postWGroup(WContract group) async {
    try {
      final userCollection = ref.doc(group.id);
      await userCollection.set(group);

      return XResult.success(true);
    } catch (e) {
      return XResult.exception(e);
    }
  }

  Future<XResult<WContract>> getInfoGroup(String id) async {
    try {
      var snapshot = await ref.where('id', isEqualTo: id).limit(1).get();
      final result = snapshot.docs.map((e) => e.data()).first;

      return XResult.success(result);
    } catch (e) {
      return XResult.exception(e);
    }
  }
}
