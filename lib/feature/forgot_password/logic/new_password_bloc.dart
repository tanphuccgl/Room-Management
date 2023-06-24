// ignore_for_file: use_build_context_synchronously

import 'package:app_qlphongtro_sv/feature/onboarding/login_screen/created_password_screen.dart';
import 'package:app_qlphongtro_sv/network/domain_manager.dart';
import 'package:app_qlphongtro_sv/network/model/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part "new_password_state.dart";

class NewPasswordBloc extends Cubit<NewPasswordState> {
  NewPasswordBloc() : super(const NewPasswordState());

  DomainManager get _domain => GetIt.I<DomainManager>();

  void onChangedPassword(String value) {
    emit(state.copyWith(pw: value));
  }

  void onChangedConfirmPassword(String value) {
    emit(state.copyWith(confirmPw: value));
  }

  Future<void> onResetPassword(BuildContext context, WUser user) async {
    if (state.pw.isEmpty || state.confirmPw.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Error')));

      return;
    }
    if (state.pw != state.confirmPw) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Error')));

      return;
    }

    final result =
        await _domain.userRepository.resetPassword(user, state.confirmPw);
    if (result.isSuccess) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const PasswordChangedScreen()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Error')));
    }
  }
}
