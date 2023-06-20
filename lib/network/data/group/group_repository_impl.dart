import 'package:app_qlphongtro_sv/network/data/group/group_repository.dart';
import 'package:app_qlphongtro_sv/network/firestore/reference/group_collection_reference.dart';
import 'package:app_qlphongtro_sv/network/model/common/result.dart';
import 'package:app_qlphongtro_sv/network/model/group.dart';

class GroupRepositoryImpl extends GroupRepository {
  final reference = GroupCollectionReference();

  @override
  Future<XResult<bool>> postGroup(WGroup group) {
    return reference.postWGroup(group);
  }

  @override
  Future<XResult<List<WGroup>>> getListGroup() {
    return reference.getListGroup();
  }

  @override
  Future<XResult<WGroup>> getInfoGroup(String id) {
    return reference.getInfoGroup(id);
  }

  @override
  Future<XResult<bool>> removeGroup(String id) {
    return reference.removeWGroup(id);
  }
}
