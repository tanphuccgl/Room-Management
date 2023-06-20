// ignore_for_file: use_build_context_synchronously

import 'package:app_qlphongtro_sv/network/domain_manager.dart';
import 'package:app_qlphongtro_sv/network/model/student.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'info_student_state.dart';

class InfoStudentBloc extends Cubit<InfoStudentState> {
  final String id;
  InfoStudentBloc(this.id) : super(InfoStudentState(student: WStudent.empty()));

  DomainManager get _domain => GetIt.I<DomainManager>();

  Future<void> getInfoStudent(BuildContext context) async {
    final result = await _domain.studentRepository.getInfoStudent(id);
    if (result.isSuccess) {
      emit(state.copyWith(student: result.data));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Error')));

      return;
    }
  }
}
