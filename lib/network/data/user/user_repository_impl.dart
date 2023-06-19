import 'package:app_qlphongtro_sv/network/data/user/user_repository.dart';
import 'package:app_qlphongtro_sv/network/firestore/reference/user_collection_reference.dart';
import 'package:app_qlphongtro_sv/network/model/common/result.dart';
import 'package:app_qlphongtro_sv/network/model/user.dart';

class UserRepositoryImpl extends UserRepository {
  final reference = UserCollectionReference();

  @override
  Future<XResult<bool>> signIn(WUser user) {
    return reference.signIn(user);
  }

  @override
  Future<XResult<WUser>> login(
      {required String email, required String password}) {
    return reference.login(email: email, password: password);
  }
}
