// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:app_qlphongtro_sv/feature/hopdong/tt_hopdong_sv.dart';
import 'package:app_qlphongtro_sv/feature/student/logic/info_student_bloc.dart';
import 'package:app_qlphongtro_sv/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoStudentPage extends StatelessWidget {
  final String id;

  const InfoStudentPage({super.key, required this.id});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => InfoStudentBloc(id)..getInfoStudent(context),
      child: BlocBuilder<InfoStudentBloc, InfoStudentState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Text(
                'Thông tin chi tiết sinh viên thuê: ${state.student.name}',
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
                  Text(
                    'Tên sinh viên: ${state.student.name}',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  XInput(
                    hintText: "Ngày tháng năm sinh",
                    value: state.student.dateOfBirth ?? "",
                    readOnly: true,
                  ),
                  const SizedBox(height: 8),
                  XInput(
                    hintText: 'Giới tính',
                    value: state.student.gender ?? "",
                    readOnly: true,
                  ),
                  const SizedBox(height: 8),
                  XInput(
                    hintText: 'Số điện thoại',
                    value: state.student.phone ?? "",
                    readOnly: true,
                  ),
                  const SizedBox(height: 8),
                  XInput(
                    hintText: 'Email',
                    value: state.student.email ?? "",
                    readOnly: true,
                  ),
                  const SizedBox(height: 8),
                  XInput(
                    hintText: 'Quê quán',
                    value: state.student.place ?? "",
                    readOnly: true,
                  ),
                  const SizedBox(height: 8),
                  XInput(
                    hintText: 'Số CMND hoặc số CCCD',
                    value: state.student.numberId ?? "",
                    readOnly: true,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xFF6FC9E5),
                      ),
                    ),
                    onPressed: () {
                      //TODO
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => ThongTinHopDongTungSV(
                      //       tenSinhVien: widget.tenSinhVien,
                      //     ),
                      //   ),
                      // );
                    },
                    child: const Text('Xem hợp đồng'),
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
