import 'package:app_qlphongtro_sv/network/model/common/result.dart';
import 'package:app_qlphongtro_sv/network/model/room.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'base_collection_reference.dart';

class RoomCollectionReference extends BaseCollectionReference<WRoom> {
  RoomCollectionReference()
      : super(
          FirebaseFirestore.instance.collection("rooms").withConverter<WRoom>(
                fromFirestore: ((snapshot, _) => WRoom.fromDocument(snapshot)),
                toFirestore: (model, _) => model.toMap(),
              ),
        );

  Future<XResult<bool>> postWroom(WRoom room) async {
    try {
      final userCollection = ref.doc(room.id);
      await userCollection.set(room);

      return XResult.success(true);
    } catch (e) {
      return XResult.exception(e);
    }
  }

  Future<XResult<List<WRoom>>> getListroom(String idGroup) async {
    try {
      final userCollection =
          await ref.where('idGroup', isEqualTo: idGroup).get();
      final list = userCollection.docs.map((e) => e.data()).toList();

      return XResult.success(list);
    } catch (e) {
      return XResult.exception(e);
    }
  }

  Future<XResult<WRoom>> getInforoom(String id) async {
    try {
      var snapshot = await ref.where('id', isEqualTo: id).limit(1).get();
      final result = snapshot.docs.map((e) => e.data()).first;

      return XResult.success(result);
    } catch (e) {
      return XResult.exception(e);
    }
  }

  Future<XResult<bool>> removeWroom(String id) async {
    try {
      remove(id);

      return XResult.success(true);
    } catch (e) {
      return XResult.exception(e);
    }
  }
}
