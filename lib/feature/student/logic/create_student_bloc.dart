// ignore_for_file: use_build_context_synchronously

import 'package:app_qlphongtro_sv/network/domain_manager.dart';
import 'package:app_qlphongtro_sv/network/model/student.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

part 'create_student_state.dart';

class CreateStudentBloc extends Cubit<CreateStudentState> {
  CreateStudentBloc() : super(const CreateStudentState());

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

  Future<void> createStudent(BuildContext context) async {
    emit(state.copyWith(isLoading: true));
    if (state.name.isEmpty ||
        state.gender.isEmpty ||
        state.phone.isEmpty ||
        state.email.isEmpty ||
        state.place.isEmpty ||
        state.numberId.isEmpty ||
        state.dateOfBirth.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Error')));

      emit(state.copyWith(isLoading: false));
      return;
    }
    final result = await _domain.studentRepository.postStudent(WStudent(
      id: const Uuid().v4(),
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

      emit(state.copyWith(isLoading: false));
      return;
    }
    emit(state.copyWith(isLoading: false));
  }
}
