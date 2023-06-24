// ignore_for_file: use_build_context_synchronously

import 'package:app_qlphongtro_sv/network/domain_manager.dart';
import 'package:app_qlphongtro_sv/network/model/room.dart';
import 'package:app_qlphongtro_sv/widgets/input.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

part 'room_state.dart';

class RoomBloc extends Cubit<RoomState> {
  final String idGroup;
  RoomBloc(this.idGroup) : super(RoomState(updateroom: WRoom.empty())) {
    getListRoom(idGroup);
  }
  DomainManager get _domain => GetIt.I<DomainManager>();

  Future<void> getInforoom(BuildContext context, String id) async {
    final result = await _domain.roomRepository.getInforoom(id);
    if (result.isSuccess) {
      emit(state.copyWith(updateroom: result.data));
      onChangedName(result.data!.name ?? "");

      onChangedNumberMember(result.data!.numberMember.toString());

      onChangedRoomEmpty(result.data!.isEmpty!);
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Error')));

      return;
    }
  }

  void onFloadingButton(BuildContext context, String idGroup) {
    showDialog(
      context: context,
      builder: (_) {
        return BlocProvider.value(
          value: context.read<RoomBloc>(),
          child: BlocBuilder<RoomBloc, RoomState>(
            builder: (context, state) {
              return AlertDialog(
                title: const Text('Thêm phòng'),
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      XInput(
                        value: state.name,
                        hintText: 'Tên phòng',
                        onChanged: (value) =>
                            context.read<RoomBloc>().onChangedName(value),
                      ),
                      const SizedBox(height: 5),
                      XInput(
                        value: state.numberMember,
                        keyboardType: TextInputType.number,
                        hintText: 'Số người',
                        onChanged: (value) => context
                            .read<RoomBloc>()
                            .onChangedNumberMember(value),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const Text('Đã thuê:'),
                          Checkbox(
                            value: state.roomEmpty,
                            onChanged: (bool? value) {
                              context
                                  .read<RoomBloc>()
                                  .onChangedRoomEmpty(value!);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    child: const Text('Hủy'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  TextButton(
                    child: const Text('Thêm'),
                    onPressed: () {
                      createStudent(context, idGroup);
                    },
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  void onUpdateButton(BuildContext context, WRoom room) async {
    await getInforoom(context, room.id);

    showDialog(
      context: context,
      builder: (_) {
        return BlocProvider.value(
          value: context.read<RoomBloc>(),
          child: BlocBuilder<RoomBloc, RoomState>(
            builder: (context, state) {
              return AlertDialog(
                title: const Text('Chỉnh sửa phòng'),
                content: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      XInput(
                        value: state.name,
                        hintText: 'Tên phòng',
                        onChanged: (value) =>
                            context.read<RoomBloc>().onChangedName(value),
                      ),
                      const SizedBox(height: 5),
                      XInput(
                        value: state.numberMember,
                        keyboardType: TextInputType.number,
                        hintText: 'Số người',
                        onChanged: (value) => context
                            .read<RoomBloc>()
                            .onChangedNumberMember(value),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          const Text('Đã thuê:'),
                          Checkbox(
                            value: state.roomEmpty,
                            onChanged: (bool? value) {
                              context
                                  .read<RoomBloc>()
                                  .onChangedRoomEmpty(value!);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    child: const Text('Hủy'),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  TextButton(
                    child: const Text('Lưu'),
                    onPressed: () {
                      updateStudent(context);
                    },
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  Future<void> getListRoom(String idGroup) async {
    final result = await _domain.roomRepository.getListroom(idGroup);
    if (result.isSuccess) {
      emit(state.copyWith(listroom: result.data));
    } else {}
  }

  void xoaPhongtro(BuildContext context, WRoom room) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Xóa phòng'),
          content:
              Text('Bạn có chắc chắn muốn xóa phòng "${room.name}" không?'),
          actions: [
            TextButton(
              child: const Text('Hủy'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Xóa'),
              onPressed: () {
                removeRoom(context, room.id);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> removeRoom(BuildContext context, String id) async {
    final result = await _domain.roomRepository.removeroom(id);
    if (result.isSuccess) {
      getListRoom(idGroup);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Success')));
      emit(RoomState(updateroom: WRoom.empty()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Error')));
      emit(RoomState(updateroom: WRoom.empty()));
    }
  }

  void onChangedName(String value) {
    emit(state.copyWith(name: value));
  }

  void onChangedRoomEmpty(bool value) {
    emit(state.copyWith(roomEmpty: value));
  }

  void onChangedNumberMember(String value) {
    emit(state.copyWith(numberMember: value));
  }

  Future<void> createStudent(BuildContext context, String idGroup) async {
    if (state.name.isEmpty || state.numberMember.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Error')));

      return;
    }
    final result = await _domain.roomRepository.postroom(WRoom(
      id: const Uuid().v4(),
      name: state.name,
      idGroup: idGroup,
      isEmpty: state.roomEmpty,
      numberMember: int.parse(state.numberMember),
    ));
    if (result.isSuccess) {
      getListRoom(idGroup);
      Navigator.pop(context);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Success')));
      emit(RoomState(updateroom: WRoom.empty()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Error')));
      emit(RoomState(updateroom: WRoom.empty()));

      return;
    }
  }

  Future<void> updateStudent(BuildContext context) async {
    if (state.name.isEmpty || state.numberMember.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Error')));

      return;
    }
    final result =
        await _domain.roomRepository.postroom(state.updateroom.copyWith(
      name: state.name,
      isEmpty: state.roomEmpty,
      numberMember: int.parse(state.numberMember),
    ));
    if (result.isSuccess) {
      getListRoom(idGroup);
      Navigator.pop(context);
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Success')));
      emit(RoomState(updateroom: WRoom.empty()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Error')));
      emit(RoomState(updateroom: WRoom.empty()));

      return;
    }
  }
}
