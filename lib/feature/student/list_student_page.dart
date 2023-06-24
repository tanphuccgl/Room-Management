// ignore_for_file: sort_child_properties_last

import 'package:app_qlphongtro_sv/feature/student/logic/list_student_bloc.dart';
import 'package:app_qlphongtro_sv/feature/student/info_student_page.dart';
import 'package:app_qlphongtro_sv/feature/student/update_student_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListStudentPage extends StatelessWidget {
  const ListStudentPage({super.key});

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
                    onChanged: (value) {},
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
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              color: const Color(0xFF6FC9E5),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UpdateStudentPage(
                                      id: state.list[index].id,
                                    ),
                                  ),
                                );
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                context
                                    .read<ListStudentBloc>()
                                    .showDeleteConfirmationDialog(
                                        context, state.list[index]);
                              },
                            ),
                          ],
                        ),
                      );
                    },
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
