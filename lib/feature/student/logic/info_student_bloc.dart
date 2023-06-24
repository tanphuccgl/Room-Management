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

  void onChangedName(String value) {
    emit(state.copyWith(name: value));
  }

  void onChangedGener(String value) {
    emit(state.copyWith(gender: value));
  }

  void onChangedPhone(String value) {
    emit(state.copyWith(phone: value));
  }

  void onChangedEmail(String value) {
    emit(state.copyWith(email: value));
  }

  void onChangedPlace(String value) {
    emit(state.copyWith(place: value));
  }

  void onChangedNumberId(String value) {
    emit(state.copyWith(numberId: value));
  }

  void onChangedDateOfBirth(String value) {
    emit(state.copyWith(dateOfBirth: value));
  }

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

  Future<void> getInfoStudent1(BuildContext context) async {
    final result = await _domain.studentRepository.getInfoStudent(id);
    if (result.isSuccess) {
      onChangedName(result.data!.name ?? "");
      onChangedEmail(result.data!.email ?? "");
      onChangedGener(result.data!.gender ?? "");
      onChangedNumberId(result.data!.numberId ?? "");
      onChangedPhone(result.data!.phone ?? "");
      onChangedPlace(result.data!.place ?? "");
      onChangedDateOfBirth(result.data!.dateOfBirth ?? "");
      emit(state.copyWith(student: result.data));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Error')));

      return;
    }
  }

  Future<void> updateStudent(BuildContext context) async {
    if (state.name.isEmpty ||
        state.gender.isEmpty ||
        state.phone.isEmpty ||
        state.email.isEmpty ||
        state.place.isEmpty ||
        state.numberId.isEmpty ||
        state.dateOfBirth.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Error')));

      return;
    }
    final result =
        await _domain.studentRepository.postStudent(state.student.copyWith(
      email: state.email,
      gender: state.gender,
      name: state.name,
      numberId: state.numberId,
      phone: state.phone,
      place: state.place,
      dateOfBirth: state.dateOfBirth,
    ));
    if (result.isSuccess) {
      Navigator.pop(context);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Success')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Error')));

      return;
    }
  }
}
