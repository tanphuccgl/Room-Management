import 'package:app_qlphongtro_sv/network/data/room/room_repository.dart';
import 'package:app_qlphongtro_sv/network/firestore/reference/room_collection_reference.dart';
import 'package:app_qlphongtro_sv/network/model/common/result.dart';
import 'package:app_qlphongtro_sv/network/model/room.dart';

class RoomRepositoryImpl extends RoomRepository {
  final reference = RoomCollectionReference();

  @override
  Future<XResult<bool>> postroom(WRoom room) {
    return reference.postWroom(room);
  }

  @override
  Future<XResult<List<WRoom>>> getListroom(String idGroup) {
    return reference.getListroom(idGroup);
  }

  @override
  Future<XResult<WRoom>> getInforoom(String id) {
    return reference.getInforoom(id);
  }

  @override
  Future<XResult<bool>> removeroom(String id) {
    return reference.removeWroom(id);
  }
}
