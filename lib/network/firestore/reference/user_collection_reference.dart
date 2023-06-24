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

  Future<XResult<WUser>> login(
      {required String email, required String password}) async {
    try {
      final userCollection = await ref
          .where('email', isEqualTo: email)
          .where('password', isEqualTo: password)
          .limit(1)
          .get();
      var data = userCollection.docs.map((e) => e.data()).first;

      return XResult.success(data);
    } catch (e) {
      return XResult.exception(e);
    }
  }

  Future<XResult<WUser>> queryEmail(String email) async {
    try {
      final userCollection =
          await ref.where('email', isEqualTo: email).limit(1).get();
      var data = userCollection.docs.map((e) => e.data()).first;

      return XResult.success(data);
    } catch (e) {
      return XResult.exception(e);
    }
  }

  Future<XResult<bool>> resetPassword(WUser user, String password) async {
    try {
      final userCollection = ref.doc(user.id);
      await userCollection.set(user.copyWith(password: password));

      return XResult.success(true);
    } catch (e) {
      return XResult.exception(e);
    }
  }
}
