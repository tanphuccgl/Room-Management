import 'package:app_qlphongtro_sv/network/data/bill/bill_repository.dart';
import 'package:app_qlphongtro_sv/network/firestore/reference/bill_collection_reference.dart';
import 'package:app_qlphongtro_sv/network/model/bill.dart';
import 'package:app_qlphongtro_sv/network/model/common/result.dart';

class BillRepositoryImpl extends BillRepository {
  final reference = BillCollectionReference();

  @override
  Future<XResult<bool>> postGroup(WBill group) {
    return reference.postWGroup(group);
  }

  @override
  Future<XResult<List<WBill>>> getListGroup() {
    return reference.getListGroup();
  }
}
