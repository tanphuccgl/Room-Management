import 'package:app_qlphongtro_sv/network/model/common/result.dart';
import 'package:app_qlphongtro_sv/network/model/contract.dart';

abstract class ContractRepository {
  Future<XResult<bool>> postGroup(WContract group);

  Future<XResult<WContract>> getInfoGroup(String id);
}
