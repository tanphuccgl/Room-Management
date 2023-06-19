import 'package:app_qlphongtro_sv/network/data/user/user_repository_impl.dart';

import 'data/user/user_repository.dart';

class DomainManager {
  late UserRepository userRepository;

  DomainManager() {
    userRepository = UserRepositoryImpl();
  }
}
