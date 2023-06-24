// ignore_for_file: use_build_context_synchronously

import 'package:app_qlphongtro_sv/network/domain_manager.dart';
import 'package:app_qlphongtro_sv/network/model/group.dart';
import 'package:app_qlphongtro_sv/widgets/input.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

part 'group_state.dart';

class GroupBloc extends Cubit<GroupState> {
  GroupBloc() : super(const GroupState()) {
    getListGroup();
  }
  DomainManager get _domain => GetIt.I<DomainManager>();

  void onFloadingButton(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return BlocProvider.value(
            value: context.read<GroupBloc>(),
            child: BlocBuilder<GroupBloc, GroupState>(
              builder: (context, state) {
                return AlertDialog(
                  title: const Text('Thêm khu trọ'),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      XInput(
                        value: state.name,
                        hintText: 'Tên khu trọ',
                        onChanged: (value) =>
                            context.read<GroupBloc>().onChangedName(value),
                      ),
                      const SizedBox(height: 5),
                      XInput(
                        value: state.place,
                        hintText: 'Địa chỉ',
                        onChanged: (value) =>
                            context.read<GroupBloc>().onChangedPlace(value),
                      ),
                      const SizedBox(height: 5),
                      XInput(
                        value: state.number,
                        keyboardType: TextInputType.number,
                        hintText: 'Số phòng',
                        onChanged: (value) =>
                            context.read<GroupBloc>().onChangedNumber(value),
                      ),
                      const SizedBox(height: 5),
                      XInput(
                        value: state.numberEmpty,
                        keyboardType: TextInputType.number,
                        hintText: 'Số phòng trống',
                        onChanged: (value) => context
                            .read<GroupBloc>()
                            .onChangedNumberEmpty(value),
                      ),
                    ],
                  ),
                  actions: <Widget>[
                    TextButton(
                      child: const Text('Hủy'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: const Text('Thêm'),
                      onPressed: () {
                        createStudent(context);
                      },
                    ),
                  ],
                );
              },
            ),
          );
        });
  }

  Future<void> getListGroup() async {
    final result = await _domain.groupRepository.getListGroup();
    if (result.isSuccess) {
      emit(state.copyWith(listGroup: result.data));
    }
  }

  void xoaKhuTro(BuildContext context, WGroup group) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Xác nhận xóa'),
          content: const Text('Bạn có chắc chắn muốn xóa khu trọ này?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Hủy'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Xóa'),
              onPressed: () {
                removeStudent(context, group.id);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> removeStudent(BuildContext context, String id) async {
    final result = await _domain.groupRepository.removeGroup(id);
    if (result.isSuccess) {
      getListGroup();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Success')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Error')));
    }
  }

  void onChangedName(String value) {
    emit(state.copyWith(name: value));
  }

  void onChangedPlace(String value) {
    emit(state.copyWith(place: value));
  }

  void onChangedNumber(String value) {
    emit(state.copyWith(number: value));
  }

  void onChangedNumberEmpty(String value) {
    emit(state.copyWith(numberEmpty: value));
  }

  Future<void> createStudent(BuildContext context) async {
    if (state.name.isEmpty ||
        state.place.isEmpty ||
        state.number.isEmpty ||
        state.numberEmpty.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Error')));

      return;
    }
    final result = await _domain.groupRepository.postGroup(WGroup(
      id: const Uuid().v4(),
      name: state.name,
      numberEmpty: int.parse(state.numberEmpty),
      place: state.place,
      numberRoom: int.parse(state.number),
    ));
    if (result.isSuccess) {
      getListGroup();
      Navigator.pop(context);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Success')));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Error')));

      return;
    }
  }
}
