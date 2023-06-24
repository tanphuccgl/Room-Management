// ignore_for_file: use_build_context_synchronously

import 'package:app_qlphongtro_sv/feature/room/logic/room_bloc.dart';
import 'package:app_qlphongtro_sv/network/domain_manager.dart';
import 'package:app_qlphongtro_sv/network/model/room.dart';
import 'package:app_qlphongtro_sv/network/model/student.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part "info_contract_state.dart";

class InfoContractBloc extends Cubit<InfoContractState> {
  InfoContractBloc()
      : super(
            InfoContractState(student: WStudent.empty(), room: WRoom.empty()));

  DomainManager get _domain => GetIt.I<DomainManager>();

  Future<void> getInforoom(BuildContext context, String id) async {
    final result = await _domain.roomRepository.getInforoom(id);
    if (result.isSuccess) {
      if ((result.data!.idStudent ?? "").isNotEmpty) {
        await getInfoStudent(context, result.data!.idStudent ?? "");
      }

      emit(state.copyWith(name: result.data!.name ?? ""));

      emit(state.copyWith(numberRoom: result.data!.numberRoom ?? ""));

      emit(state.copyWith(numberMember: result.data?.numberMember.toString()));

      emit(state.copyWith(room: result.data));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Error')));

      return;
    }
  }

  void onChangedName(String value) {
    emit(state.copyWith(name: value));
  }

  void onChangedNumberRoom(String value) {
    emit(state.copyWith(numberRoom: value));
  }

  void onChangedNumberMember(String value) {
    emit(state.copyWith(numberMember: value));
  }

  void onChangedEdit() {
    emit(state.copyWith(isEdit: !state.isEdit));
  }

  void onChangedStudent(String value) {
    emit(state.copyWith(idStudentSelected: value));
  }

  Future<List<WStudent>> getListStudent() async {
    final result = await _domain.studentRepository.getListStudent();
    if (result.isSuccess) {
      return result.data!;
    }
    return [];
  }

  void showListStudent(BuildContext context) async {
    final list = await getListStudent();
    showDialog(
        context: context,
        builder: (_) {
          return BlocProvider.value(
            value: context.read<InfoContractBloc>(),
            child: BlocBuilder<InfoContractBloc, InfoContractState>(
              builder: (context, state1) {
                return AlertDialog(
                  title: const Text('Chọn sinh viên'),
                  content: SizedBox(
                    height: 300,
                    width: 100,
                    child: ListView.builder(
                      itemBuilder: (_, i) {
                        return GestureDetector(
                          onTap: () {
                            onChangedStudent(list[i].id);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Text(
                              list[i].name ?? "",
                              style: TextStyle(
                                color: list[i].id == state1.idStudentSelected
                                    ? Colors.green
                                    : Colors.black,
                              ),
                            ),
                          ),
                        );
                      },
                      shrinkWrap: true,
                      itemCount: list.length,
                    ),
                  ),
                  actions: [
                    TextButton(
                      child: const Text('Hủy'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    TextButton(
                      child: const Text('Xác nhận'),
                      onPressed: () {
                        getInfoStudent(context, state.idStudentSelected);
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );
              },
            ),
          );
        });
  }

  Future<void> getInfoStudent(BuildContext context, String idStudent) async {
    if (idStudent.isEmpty) return;
    final result = await _domain.studentRepository.getInfoStudent(idStudent);
    if (result.isSuccess) {
      emit(state.copyWith(student: result.data));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Error')));

      return;
    }
  }

  Future<void> updateRoom(BuildContext context) async {
    if (state.name.isEmpty || state.numberMember.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Error')));

      return;
    }
    final result = await _domain.roomRepository.postroom(state.room.copyWith(
      name: state.name,
      numberRoom: state.numberRoom,
      idStudent: state.student.id,
      numberMember: int.parse(state.numberMember),
    ));
    if (result.isSuccess) {
      context.read<RoomBloc>().getListRoom(state.room.idGroup ?? "");
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Success')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Error')));

      return;
    }
  }
}
