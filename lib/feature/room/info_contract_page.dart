// ignore_for_file: library_private_types_in_public_api, must_be_immutable

import 'package:app_qlphongtro_sv/feature/hopdong/create_hopdong_screen.dart';
import 'package:app_qlphongtro_sv/feature/room/logic/info_contract_bloc.dart';
import 'package:app_qlphongtro_sv/feature/room/logic/room_bloc.dart';
import 'package:app_qlphongtro_sv/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoContractPage extends StatelessWidget {
  final String idRoom;
  final BuildContext contextRoom;

  List<String> images = [
    'assets/Backgrounds/phongtro1.jpg',
    'assets/Backgrounds/phongtro2.jpg',
    'assets/Backgrounds/phongtro3.jpg',
    // Thêm đường dẫn hình ảnh vào danh sách
  ];

  InfoContractPage(
      {super.key, required this.idRoom, required this.contextRoom});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: contextRoom.read<RoomBloc>(),
      child: BlocBuilder<RoomBloc, RoomState>(
        builder: (context1, stateRoom) {
          return BlocProvider(
            create: (context) =>
                InfoContractBloc()..getInforoom(context, idRoom),
            child: BlocBuilder<InfoContractBloc, InfoContractState>(
              builder: (context, state) {
                return Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    title: Text(
                      'Thông Tin Phòng Trọ Số : ${state.numberRoom}',
                      style: const TextStyle(color: Colors.black),
                    ),
                    backgroundColor: const Color(0xFF6FC9E5),
                    elevation: 0,
                  ),
                  body: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Hình ảnh có thể lướt qua
                          Center(
                            child: SizedBox(
                              height: 200,
                              child: PageView.builder(
                                itemCount: images.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Image.asset(
                                        images[index],
                                        width: 500,
                                        height: 200,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          XInput(
                            value: state.name,
                            hintText: 'Tên phòng',
                            readOnly: !state.isEdit,
                            onChanged: (value) => context
                                .read<InfoContractBloc>()
                                .onChangedName(value),
                          ),
                          XInput(
                            value: state.numberMember,
                            keyboardType: TextInputType.number,
                            hintText: 'Số người',
                            readOnly: !state.isEdit,
                            onChanged: (value) => context
                                .read<InfoContractBloc>()
                                .onChangedNumberMember(value),
                          ),
                          XInput(
                            value: state.numberRoom,
                            keyboardType: TextInputType.number,
                            hintText: 'Số phòng',
                            readOnly: !state.isEdit,
                            onChanged: (value) => context
                                .read<InfoContractBloc>()
                                .onChangedNumberRoom(value),
                          ),
                          XInput(
                              value: state.student.name ?? "",
                              keyboardType: TextInputType.number,
                              hintText: 'Tên sinh viên',
                              readOnly: true,
                              onTap: () {
                                if (state.isEdit) {
                                  context
                                      .read<InfoContractBloc>()
                                      .showListStudent(context);
                                }
                              }),
                          const SizedBox(height: 16),
                          Text(
                            state.room.isEmpty == true
                                ? 'Trạng thái: Đã thuê'
                                : 'Trạng thái: Phòng trống',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: state.room.isEmpty == false
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                width: 150, // Đặt chiều rộng cố định cho nút
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const TaoHopDong(),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF6FC9E5),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                  ),
                                  child: const Text('Tạo hợp đồng'),
                                ),
                              ),
                              const SizedBox(
                                  width: 10), // Đặt khoảng cách giữa hai nút
                              SizedBox(
                                width: 150, // Đặt chiều rộng cố định cho nút
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (!state.isEdit) {
                                      context
                                          .read<InfoContractBloc>()
                                          .onChangedEdit();
                                    } else {
                                      context
                                          .read<InfoContractBloc>()
                                          .updateRoom(context);
                                      context
                                          .read<InfoContractBloc>()
                                          .onChangedEdit();
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50.0),
                                    ),
                                    backgroundColor: state.isEdit
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                  child: Text(state.isEdit ? 'Lưu' : 'Sửa'),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
