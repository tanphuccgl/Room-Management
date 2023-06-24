// ignore_for_file: use_build_context_synchronously

import 'package:app_qlphongtro_sv/network/domain_manager.dart';
import 'package:app_qlphongtro_sv/network/model/user.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part "profile_state.dart";

class ProfileBloc extends Cubit<ProfileState> {
  ProfileBloc() : super(ProfileState(user: WUser.empty()));

  DomainManager get _domain => GetIt.I<DomainManager>();

  void onChangedUser(WUser user) {
    emit(state.copyWith(user: user));
  }

  void onChangedGroup(String value) {
    emit(state.copyWith(totalGroup: value));
  }

  void onChangedRoom(String value) {
    emit(state.copyWith(totalRoom: value));
  }

  void onChangedRoomFull(String value) {
    emit(state.copyWith(totalRoomFull: value));
  }

  Future<void> onSave(BuildContext context) async {
    final result = await _domain.userRepository.signIn(state.user.copyWith(
      totalGroup: state.totalGroup,
      totalRoom: state.totalRoom,
      totalRoomFull: state.totalRoomFull,
    ));
    if (result.isSuccess) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Profile đã được lưu')),
      );
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Error')));
    }
  }
}
