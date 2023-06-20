// ignore_for_file: use_build_context_synchronously

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

  Future<void> removeStudent(BuildContext context, String id) async {
    final result = await _domain.studentRepository.removeStudent(id);
    if (result.isSuccess) {
      getListStudent();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Success')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Error')));
    }
  }

  void showDeleteConfirmationDialog(BuildContext context, WStudent student) {
    showDialog(
      context: context,
      builder: (_) {
        return BlocProvider.value(
          value: context.read<ListStudentBloc>(),
          child: BlocBuilder<ListStudentBloc, ListStudentState>(
            builder: (context, state) {
              return AlertDialog(
                title: const Text('Danh Sách Sinh Viên Thuê'),
                content: Text('Bạn có muốn xóa sinh viên ${student.name}?'),
                actions: [
                  OutlinedButton(
                    onPressed: () {
                      removeStudent(context, student.id);
                      // ...
                      Navigator.of(context).pop(); // Đóng hộp thoại
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color(0xFF6FC9E5),
                      side: const BorderSide(color: Colors.black),
                    ),
                    child:
                        const Text('Có', style: TextStyle(color: Colors.black)),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      // Xử lý sự kiện khi ấn vào "Không"
                      // ...
                      Navigator.of(context).pop(); // Đóng hộp thoại
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: const Color(0xFF6FC9E5),
                      side: const BorderSide(color: Colors.black),
                    ),
                    child: const Text('Không',
                        style: TextStyle(color: Colors.black)),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
