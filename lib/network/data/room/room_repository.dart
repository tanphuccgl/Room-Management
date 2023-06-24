import 'package:app_qlphongtro_sv/network/model/common/result.dart';
import 'package:app_qlphongtro_sv/network/model/room.dart';

abstract class RoomRepository {
  Future<XResult<bool>> postroom(WRoom room);
  Future<XResult<List<WRoom>>> getListroom(String idGroup);
  Future<XResult<WRoom>> getInforoom(String id);
  Future<XResult<bool>> removeroom(String id);
}
