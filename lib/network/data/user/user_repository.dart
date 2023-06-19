import 'package:app_qlphongtro_sv/network/model/common/result.dart';
import 'package:app_qlphongtro_sv/network/model/user.dart';

abstract class UserRepository {
  Future<XResult<bool>> signIn(WUser user);
}
