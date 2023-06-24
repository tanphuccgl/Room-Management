// ignore_for_file: use_build_context_synchronously

import 'package:app_qlphongtro_sv/feature/room/logic/info_contract_bloc.dart';
import 'package:app_qlphongtro_sv/network/domain_manager.dart';
import 'package:app_qlphongtro_sv/network/model/contract.dart';
import 'package:app_qlphongtro_sv/network/model/room.dart';
import 'package:app_qlphongtro_sv/network/model/student.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

part "create_contract_state.dart";

class CreateContractBloc extends Cubit<CreateContractState> {
  final WRoom room;
  CreateContractBloc(this.room)
      : super(CreateContractState(student: WStudent.empty()));

  DomainManager get _domain => GetIt.I<DomainManager>();

  void onChangedhostName(String value) {
    emit(state.copyWith(hostName: value));
  }

  void onChangedhostPhone(String value) {
    emit(state.copyWith(hostPhone: value));
  }

  void onChangedhostPlace(String value) {
    emit(state.copyWith(hostPlace: value));
  }

  void onChangedhostEmail(String value) {
    emit(state.copyWith(hostEmail: value));
  }

  void onChangedroomPlace(String value) {
    emit(state.copyWith(roomPlace: value));
  }

  void onChangedroomStart(String value) {
    emit(state.copyWith(roomStart: value));
  }

  void onChangedroomEnd(String value) {
    emit(state.copyWith(roomEnd: value));
  }

  void onChangedroomPrice(String value) {
    emit(state.copyWith(roomPrice: value));
  }

  void onChangedroomPay(String value) {
    emit(state.copyWith(roomPay: value));
  }

  void onChangedroomOtherFees(String value) {
    emit(state.copyWith(roomOtherFees: value));
  }

  void onChangedroomDeposit(String value) {
    emit(state.copyWith(roomDeposit: value));
  }

  void onChangedroomRule(String value) {
    emit(state.copyWith(roomRule: value));
  }

  void onChangedroomFix(String value) {
    emit(state.copyWith(roomFix: value));
  }

  void onChangedroomContractTerminatio(String value) {
    emit(state.copyWith(roomContractTerminatio: value));
  }

  void onChangedroomDispute(String value) {
    emit(state.copyWith(roomDispute: value));
  }

  Future<void> onCreateButton(BuildContext context, BuildContext contextRoom,
      BuildContext contextInfo) async {
    if (state.hostName.isEmpty ||
        state.hostPhone.isEmpty ||
        state.hostPlace.isEmpty ||
        state.hostEmail.isEmpty ||
        state.roomPlace.isEmpty ||
        state.roomStart.isEmpty ||
        state.roomEnd.isEmpty ||
        state.roomPrice.isEmpty ||
        state.roomPay.isEmpty ||
        state.roomOtherFees.isEmpty ||
        state.roomDeposit.isEmpty ||
        state.roomRule.isEmpty ||
        state.roomFix.isEmpty ||
        state.roomContractTerminatio.isEmpty ||
        state.roomDispute.isEmpty ||
        state.student.id.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Error')));

      return;
    }
    final id = const Uuid().v4();
    final result = await _domain.contractRepository.postGroup(WContract(
        id: id,
        idRoom: room.id,
        idStudent: room.idStudent ?? "",
        hostName: state.hostName,
        hostPhone: state.hostPhone,
        hostPlace: state.hostPlace,
        hostEmail: state.hostEmail,
        roomPlace: state.roomPlace,
        roomStart: state.roomStart,
        roomEnd: state.roomEnd,
        roomPrice: state.roomPrice,
        roomPay: state.roomPay,
        roomOtherFees: state.roomOtherFees,
        roomDeposit: state.roomDeposit,
        roomRule: state.roomRule,
        roomFix: state.roomFix,
        roomContractTerminatio: state.roomContractTerminatio,
        roomDispute: state.roomDispute));
    if (result.isSuccess) {
      contextInfo
          .read<InfoContractBloc>()
          .updateContractToRoom(contextRoom, room, id);
      contextInfo.read<InfoContractBloc>().getInforoom(contextRoom, room.id);
      await _domain.studentRepository
          .postStudent(state.student.copyWith(idContract: id));
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Error')));
    }
  }

  Future<void> getInfoStudent(BuildContext context, String id) async {
    if (id.isEmpty) return;
    final result = await _domain.studentRepository.getInfoStudent(id);
    if (result.isSuccess) {
      emit(state.copyWith(student: result.data));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Error')));

      return;
    }
  }
}
