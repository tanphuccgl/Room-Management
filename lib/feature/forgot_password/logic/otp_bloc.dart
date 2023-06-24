import 'package:app_qlphongtro_sv/feature/forgot_password/new_password_page.dart';
import 'package:app_qlphongtro_sv/network/model/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part "otp_state.dart";

class OTPBloc extends Cubit<OTPState> {
  OTPBloc() : super(const OTPState());

  void onChangedText1(String value) {
    emit(state.copyWith(text1: value));
  }

  void onChangedText2(String value) {
    emit(state.copyWith(text2: value));
  }

  void onChangedText3(String value) {
    emit(state.copyWith(text3: value));
  }

  void onChangedText4(String value) {
    emit(state.copyWith(text4: value));
  }

  Future<void> onConfirmButton(BuildContext context, WUser user) async {
    if (state.text1.isEmpty ||
        state.text2.isEmpty ||
        state.text3.isEmpty ||
        state.text4.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Error')));

      return;
    }

    if (state.text1 == "1" &&
        state.text2 == "2" &&
        state.text3 == "3" &&
        state.text4 == "4") {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => NewPasswordPage(
                    user: user,
                  )));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Error')));
    }
  }
}
