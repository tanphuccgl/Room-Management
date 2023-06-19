import 'package:app_qlphongtro_sv/network/model/common/result.dart';
import 'package:app_qlphongtro_sv/network/model/student.dart';

abstract class StudentRepository {
  Future<XResult<bool>> postStudent(WStudent student);
  Future<XResult<List<WStudent>>> getListStudent();
  Future<XResult<WStudent>> getInfoStudent(String id);
}
