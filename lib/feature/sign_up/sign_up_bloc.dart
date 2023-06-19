// ignore_for_file: use_build_context_synchronously

import 'package:app_qlphongtro_sv/network/domain_manager.dart';
import 'package:app_qlphongtro_sv/network/model/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

part "sign_up_state.dart";

class SignUpBloc extends Cubit<SignUpState> {
  SignUpBloc() : super(const SignUpState());

  DomainManager get _domain => GetIt.I<DomainManager>();

  void onChangedUsername(String value) {
    emit(state.copyWith(username: value));
  }

  void onChangedEmail(String value) {
    emit(state.copyWith(email: value));
  }

  void onChangedPassword(String value) {
    emit(state.copyWith(password: value));
  }

  void onChangedRePassword(String value) {
    emit(state.copyWith(rePassword: value));
  }

  Future<void> onRegister(BuildContext context) async {
    emit(state.copyWith(isLoading: true));
    if (state.username.isEmpty ||
        state.password.isEmpty ||
        state.rePassword.isEmpty ||
        state.email.isEmpty ||
        state.password != state.rePassword) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Error')));

      emit(state.copyWith(isLoading: false));
      return;
    }

    final result = await _domain.userRepository.signIn(WUser(
      id: const Uuid().v4(),
      email: state.email,
      password: state.password,
      username: state.username,
    ));
    if (result.isSuccess) {
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Error')));

      emit(state.copyWith(isLoading: false));
    }

    emit(state.copyWith(isLoading: false));
  }
}
