// ignore_for_file: sort_child_properties_last

import 'package:app_qlphongtro_sv/feature/onboarding/login_screen/home_page_screen.dart';
import 'package:app_qlphongtro_sv/feature/student/logic/list_student_bloc.dart';
import 'package:app_qlphongtro_sv/feature/student/info_student_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListStudentPage extends StatefulWidget {
  const ListStudentPage({super.key});

  @override
  State<ListStudentPage> createState() => _ListStudentPageState();
}

class _ListStudentPageState extends State<ListStudentPage> {
  List<String> sinhVienList = [
    'Ly Thi Minh Tam',
    'Tran Dinh Duy',
    'Le Van Tai',
    // Danh sách sinh viên đã thuê phòng
  ];

  List<String> filteredList = [];

  @override
  void initState() {
    super.initState();
    filteredList = sinhVienList;
  }

  void searchSinhVien(String keyword) {
    setState(() {
      filteredList = sinhVienList
          .where((sinhVien) =>
              sinhVien.toLowerCase().contains(keyword.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ListStudentBloc(),
      child: BlocBuilder<ListStudentBloc, ListStudentState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text(
                'Danh Sách Sinh Viên Thuê Trọ',
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: const Color(0xFF6FC9E5),
              elevation: 0,
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: const Color(0xFF6FC9E5),
              child: const Icon(
                Icons.add,
                color: Colors.black,
              ),
              onPressed: () =>
                  context.read<ListStudentBloc>().onFloadingButton(context),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    onChanged: (value) {
                      searchSinhVien(value);
                    },
                    decoration: const InputDecoration(
                      hintText: 'Tìm kiếm sinh viên',
                      prefixIcon: Icon(Icons.search),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: state.list.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(state.list[index].name ?? ""),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => InfoStudentPage(
                                id: state.list[index].id,
                              ),
                            ),
                          );
                        },
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            context
                                .read<ListStudentBloc>()
                                .showDeleteConfirmationDialog(
                                    context, state.list[index]);
                          },
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const HomePageScreen()));
                          },
                          child: const Text(
                            'Trang chủ',
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF6FC9E5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 8.0),
                        child: ElevatedButton(
                          onPressed: () {
                            // Xử lý sự kiện khi ấn nút "Xuất File Excel"
                            // ...
                          },
                          child: const Text(
                            'Xuất File Excel',
                            style: TextStyle(color: Colors.black),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF6FC9E5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
