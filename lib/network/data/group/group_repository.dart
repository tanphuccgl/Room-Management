import 'package:app_qlphongtro_sv/network/model/common/result.dart';
import 'package:app_qlphongtro_sv/network/model/group.dart';

abstract class GroupRepository {
  Future<XResult<bool>> postGroup(WGroup group);
  Future<XResult<List<WGroup>>> getListGroup();
  Future<XResult<WGroup>> getInfoGroup(String id);
  Future<XResult<bool>> removeGroup(String id);
}
