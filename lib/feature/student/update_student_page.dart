// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:app_qlphongtro_sv/feature/student/logic/info_student_bloc.dart';
import 'package:app_qlphongtro_sv/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateStudentPage extends StatelessWidget {
  final String id;

  const UpdateStudentPage({super.key, required this.id});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => InfoStudentBloc(id)..getInfoStudent1(context),
      child: BlocBuilder<InfoStudentBloc, InfoStudentState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text(
                'Cập nhật thông tin sinh viên: ${state.student.name}',
                style: const TextStyle(color: Colors.black),
              ),
              backgroundColor: const Color(0xFF6FC9E5),
              elevation: 0,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  XInput(
                    hintText: "Tên sinh viên:",
                    value: state.name,
                    onChanged: (value) =>
                        context.read<InfoStudentBloc>().onChangedName(value),
                  ),
                  const SizedBox(height: 16),
                  XInput(
                    hintText: "Ngày tháng năm sinh",
                    value: state.dateOfBirth,
                    onChanged: (value) => context
                        .read<InfoStudentBloc>()
                        .onChangedDateOfBirth(value),
                  ),
                  const SizedBox(height: 8),
                  XInput(
                    hintText: 'Giới tính',
                    value: state.gender,
                    onChanged: (value) =>
                        context.read<InfoStudentBloc>().onChangedGener(value),
                  ),
                  const SizedBox(height: 8),
                  XInput(
                    hintText: 'Số điện thoại',
                    value: state.phone,
                    onChanged: (value) =>
                        context.read<InfoStudentBloc>().onChangedPhone(value),
                  ),
                  const SizedBox(height: 8),
                  XInput(
                    hintText: 'Email',
                    value: state.email,
                    onChanged: (value) =>
                        context.read<InfoStudentBloc>().onChangedEmail(value),
                  ),
                  const SizedBox(height: 8),
                  XInput(
                    hintText: 'Quê quán',
                    value: state.place,
                    onChanged: (value) =>
                        context.read<InfoStudentBloc>().onChangedPlace(value),
                  ),
                  const SizedBox(height: 8),
                  XInput(
                    hintText: 'Số CMND hoặc số CCCD',
                    value: state.numberId,
                    onChanged: (value) => context
                        .read<InfoStudentBloc>()
                        .onChangedNumberId(value),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF6FC9E5),
                      ),
                    ),
                    onPressed: () {
                      context.read<InfoStudentBloc>().updateStudent(context);
                    },
                    child: const Text('Lưu'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
