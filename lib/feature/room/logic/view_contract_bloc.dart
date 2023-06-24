// ignore_for_file: use_build_context_synchronously

import 'package:app_qlphongtro_sv/network/domain_manager.dart';
import 'package:app_qlphongtro_sv/network/model/contract.dart';
import 'package:app_qlphongtro_sv/network/model/student.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part "view_contract_state.dart";

class ViewContractBloc extends Cubit<ViewContractState> {
  ViewContractBloc()
      : super(ViewContractState(
            student: WStudent.empty(), contract: WContract.empty()));

  DomainManager get _domain => GetIt.I<DomainManager>();

  Future<void> getContract(BuildContext context, String idContract) async {
    final result = await _domain.contractRepository.getInfoGroup(idContract);
    if (result.isSuccess) {
      emit(state.copyWith(contract: result.data!));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Error')));
    }
  }

  Future<void> getInfoStudent(BuildContext context, String id) async {
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
