import 'package:app_qlphongtro_sv/network/model/common/result.dart';
import 'package:app_qlphongtro_sv/network/model/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'base_collection_reference.dart';

class UserCollectionReference extends BaseCollectionReference<WUser> {
  UserCollectionReference()
      : super(
          FirebaseFirestore.instance.collection("users").withConverter<WUser>(
                fromFirestore: ((snapshot, _) => WUser.fromDocument(snapshot)),
                toFirestore: (model, _) => model.toMap(),
              ),
        );

  Future<XResult<bool>> signIn(WUser user) async {
    try {
      final userCollection = ref.doc(user.id);
      await userCollection.set(user);

      return XResult.success(true);
    } catch (e) {
      return XResult.exception(e);
    }
  }
}
