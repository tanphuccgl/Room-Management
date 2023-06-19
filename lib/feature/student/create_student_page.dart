// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:app_qlphongtro_sv/feature/student/logic/create_student_bloc.dart';
import 'package:app_qlphongtro_sv/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateStudentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateStudentBloc(),
      child: BlocBuilder<CreateStudentBloc, CreateStudentState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text(
                'Thêm sinh viên',
                style: TextStyle(color: Colors.black),
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
                    hintText: "Tên sinh viên",
                    value: state.name,
                    onChanged: (value) =>
                        context.read<CreateStudentBloc>().onChangedName(value),
                  ),
                  XInput(
                    hintText: "Ngày tháng năm sinh",
                    value: state.dateOfBirth,
                    onChanged: (value) => context
                        .read<CreateStudentBloc>()
                        .onChangedDateOfBirth(value),
                  ),
                  XInput(
                    hintText: "Giới tính",
                    value: state.gender,
                    onChanged: (value) =>
                        context.read<CreateStudentBloc>().onChangedGener(value),
                  ),
                  XInput(
                    hintText: "Số điện thoại",
                    value: state.phone,
                    onChanged: (value) =>
                        context.read<CreateStudentBloc>().onChangedPhone(value),
                  ),
                  XInput(
                    hintText: "Email",
                    value: state.email,
                    onChanged: (value) =>
                        context.read<CreateStudentBloc>().onChangedEmail(value),
                  ),
                  XInput(
                    hintText: "Quê quán",
                    value: state.place,
                    onChanged: (value) =>
                        context.read<CreateStudentBloc>().onChangedPlace(value),
                  ),
                  XInput(
                    hintText: "Số CMND hoặc số CCCD",
                    value: state.numberId,
                    onChanged: (value) => context
                        .read<CreateStudentBloc>()
                        .onChangedNumberId(value),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          const Color(0xFF6FC9E5),
                        ),
                      ),
                      onPressed: () => context
                          .read<CreateStudentBloc>()
                          .createStudent(context),
                      child: const Text('Tạo sinh viên'),
                    ),
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
