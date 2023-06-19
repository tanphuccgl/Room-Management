import 'package:app_qlphongtro_sv/feature/student/create_student_page.dart';
import 'package:app_qlphongtro_sv/network/domain_manager.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'list_student_state.dart';

class ListStudentBloc extends Cubit<ListStudentState> {
  ListStudentBloc() : super(ListStudentState());

  DomainManager get _domain => GetIt.I<DomainManager>();

  void onFloadingButton(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CreateStudentPage(),
      ),
    );
  }

  // Future<void> createStudent() async{
  //   final result = await _domain.studentRepository.postStudent();
  //   if (result.isSuccess) {
  //     Navigator.pop(context);
  //   }

  // }
}
