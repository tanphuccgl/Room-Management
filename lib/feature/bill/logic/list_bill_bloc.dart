// ignore_for_file: use_build_context_synchronously

import 'package:app_qlphongtro_sv/network/domain_manager.dart';
import 'package:app_qlphongtro_sv/network/model/bill.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'list_bill_state.dart';

class BillBloc extends Cubit<BillState> {
  BillBloc() : super(const BillState()) {
    getListGroup();
  }
  DomainManager get _domain => GetIt.I<DomainManager>();

  Future<void> getListGroup() async {
    final result = await _domain.bill.getListGroup();
    if (result.isSuccess) {
      emit(state.copyWith(listBill: result.data));
    }
  }
}
