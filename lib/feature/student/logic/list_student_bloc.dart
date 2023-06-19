import 'package:app_qlphongtro_sv/feature/student/create_student_page.dart';
import 'package:app_qlphongtro_sv/network/domain_manager.dart';
import 'package:app_qlphongtro_sv/network/model/student.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'list_student_state.dart';

class ListStudentBloc extends Cubit<ListStudentState> {
  ListStudentBloc() : super(const ListStudentState()) {
    getListStudent();
  }

  DomainManager get _domain => GetIt.I<DomainManager>();

  void onFloadingButton(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateStudentPage(),
      ),
    );
  }

  Future<void> getListStudent() async {
    final result = await _domain.studentRepository.getListStudent();
    if (result.isSuccess) {
      emit(state.copyWith(list: result.data));
    }
  }
}
