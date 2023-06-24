// ignore_for_file: sort_child_properties_last

import 'package:app_qlphongtro_sv/feature/room/logic/room_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DSPhongTro extends StatelessWidget {
  final String idGroup;
  const DSPhongTro({super.key, required this.idGroup});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RoomBloc(idGroup),
      child: BlocBuilder<RoomBloc, RoomState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text(
                'Danh Sách Phòng Trọ',
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: const Color(0xFF6FC9E5),
              elevation: 0,
            ),
            body: ListView.builder(
              itemCount: state.listroom.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => ThongTinChiTietPhong(
                    //       tenPhong: phong.tenPhong,
                    //       soNguoi: phong.soNguoi,
                    //       daThue: daThue,
                    //       soPhong: phong.soPhong,
                    //       tenSinhVien: '',
                    //     ),
                    //   ),
                    // );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ListTile(
                        leading: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: const Icon(
                                Icons.home,
                                color: Colors.blue,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: state.listroom[index].isEmpty == true
                                      ? Colors.red
                                      : Colors.green,
                                ),
                              ),
                            ),
                          ],
                        ),
                        title: Text(
                          state.listroom[index].name ?? "",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Số người: ${state.listroom[index].numberMember}',
                              style: const TextStyle(
                                color: Colors.purple,
                              ),
                            ),
                            Text(
                              state.listroom[index].isEmpty == true
                                  ? 'Đã thuê'
                                  : 'Phòng trống',
                              style: TextStyle(
                                color: state.listroom[index].isEmpty == false
                                    ? Colors.green
                                    : Colors.red,
                              ),
                            ),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              color: const Color(0xFF6FC9E5),
                              onPressed: () {
                                context.read<RoomBloc>().onUpdateButton(
                                    context, state.listroom[index]);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              color: Colors.grey,
                              onPressed: () {
                                context.read<RoomBloc>().xoaPhongtro(
                                    context, state.listroom[index]);
                              },
                            ),
                          ],
                        ),
                        onLongPress: () {
                          //    _capNhatTrangThaiThue(phong);
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.add, color: Colors.black),
              backgroundColor: const Color(0xFF6FC9E5),
              onPressed: () =>
                  context.read<RoomBloc>().onFloadingButton(context, idGroup),
            ),
          );
        },
      ),
    );
  }
}

// class PhongTro {
//   String tenPhong;
//   bool daThue;
//   int soNguoi;
//   HopDong? hopDong;

//   PhongTro(this.tenPhong, this.daThue, {this.soNguoi = 0, this.hopDong});

//   get soPhong => null;
// }

// class HopDong {
//   String ngayBatDau;
//   String ngayKetThuc;

//   HopDong(this.ngayBatDau, this.ngayKetThuc);
// }
