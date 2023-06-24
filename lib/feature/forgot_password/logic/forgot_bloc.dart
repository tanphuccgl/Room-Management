// ignore_for_file: use_build_context_synchronously

import 'package:app_qlphongtro_sv/feature/forgot_password/otp_page.dart';
import 'package:app_qlphongtro_sv/network/domain_manager.dart';
import 'package:app_qlphongtro_sv/network/model/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part "forgot_state.dart";

class ForgotPasswordBloc extends Cubit<ForgotPasswordState> {
  ForgotPasswordBloc()
      : super(ForgotPasswordState(
          user: WUser.empty(),
        ));

  DomainManager get _domain => GetIt.I<DomainManager>();

  void onChangedEmail(String value) {
    emit(state.copyWith(email: value));
  }

  Future<void> onForgotButton(BuildContext context) async {
    if (state.email.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Error')));

      return;
    }

    final result = await _domain.userRepository.queryEmail(state.email);
    if (result.isSuccess) {
      emit(state.copyWith(user: result.data));
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OTPPage(
                    user: result.data!,
                  )));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Error')));
    }
  }
}
