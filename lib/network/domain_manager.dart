import 'package:app_qlphongtro_sv/network/data/group/group_repository.dart';
import 'package:app_qlphongtro_sv/network/data/group/group_repository_impl.dart';
import 'package:app_qlphongtro_sv/network/data/student/student_repository.dart';
import 'package:app_qlphongtro_sv/network/data/student/student_repository_impl.dart';
import 'package:app_qlphongtro_sv/network/data/user/user_repository_impl.dart';

import 'data/user/user_repository.dart';

class DomainManager {
  late UserRepository userRepository;
  late StudentRepository studentRepository;
  late GroupRepository groupRepository;

  DomainManager() {
    userRepository = UserRepositoryImpl();
    studentRepository = StudentRepositoryImpl();
    groupRepository = GroupRepositoryImpl();
  }
}
