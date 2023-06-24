import 'package:app_qlphongtro_sv/network/data/contract/group_repository.dart';
import 'package:app_qlphongtro_sv/network/firestore/reference/contract_collection_reference.dart';
import 'package:app_qlphongtro_sv/network/model/common/result.dart';
import 'package:app_qlphongtro_sv/network/model/contract.dart';

class ContractRepositoryImpl extends ContractRepository {
  final reference = ContractCollectionReference();

  @override
  Future<XResult<bool>> postGroup(WContract group) {
    return reference.postWGroup(group);
  }

  @override
  Future<XResult<WContract>> getInfoGroup(String id) {
    return reference.getInfoGroup(id);
  }
}
