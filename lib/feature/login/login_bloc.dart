// ignore_for_file: use_build_context_synchronously

import 'package:app_qlphongtro_sv/feature/onboarding/login_screen/home_page_screen.dart';
import 'package:app_qlphongtro_sv/feature/profile/logic/profile_bloc.dart';
import 'package:app_qlphongtro_sv/network/domain_manager.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'login_state.dart';

class LoginBloc extends Cubit<LoginState> {
  LoginBloc() : super(const LoginState());

  DomainManager get _domain => GetIt.I<DomainManager>();

  void onChangedEmail(String value) {
    emit(state.copyWith(email: value));
  }

  void onChangedPassword(String value) {
    emit(state.copyWith(password: value));
  }

  Future<void> onLogin(BuildContext context) async {
    emit(state.copyWith(isLoading: true));
    if (state.email.isEmpty || state.password.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Error')));

      emit(state.copyWith(isLoading: false));
      return;
    }

    final result = await _domain.userRepository.login(
      password: state.password,
      email: state.email,
    );
    if (result.isSuccess) {
      await Future.sync(
          () => context.read<ProfileBloc>().onChangedUser(result.data!));
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const HomePageScreen()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Error')));
    }

    emit(state.copyWith(isLoading: false));
  }
}
