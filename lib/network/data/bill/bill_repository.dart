import 'package:app_qlphongtro_sv/network/model/bill.dart';
import 'package:app_qlphongtro_sv/network/model/common/result.dart';

abstract class BillRepository {
  Future<XResult<bool>> postGroup(WBill group);
  Future<XResult<List<WBill>>> getListGroup();
}
