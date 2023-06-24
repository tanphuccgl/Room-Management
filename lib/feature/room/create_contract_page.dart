import 'package:app_qlphongtro_sv/feature/room/logic/create_contract_bloc.dart';
import 'package:app_qlphongtro_sv/feature/room/logic/info_contract_bloc.dart';
import 'package:app_qlphongtro_sv/feature/room/logic/room_bloc.dart';
import 'package:app_qlphongtro_sv/network/model/room.dart';
import 'package:app_qlphongtro_sv/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateContractPage extends StatelessWidget {
  final WRoom room;
  final BuildContext contextInfoContract;
  final BuildContext contextRoom;
  const CreateContractPage(
      {super.key,
      required this.room,
      required this.contextInfoContract,
      required this.contextRoom});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: contextRoom.read<RoomBloc>(),
      child: BlocBuilder<RoomBloc, RoomState>(
        builder: (context2, state) {
          return BlocProvider.value(
            value: contextInfoContract.read<InfoContractBloc>(),
            child: BlocBuilder<InfoContractBloc, InfoContractState>(
              builder: (context1, state1) {
                return BlocProvider(
                  create: (context) => CreateContractBloc(room)
                    ..getInfoStudent(context, room.idStudent ?? ""),
                  child: BlocBuilder<CreateContractBloc, CreateContractState>(
                    builder: (context, state) {
                      return Scaffold(
                        backgroundColor: Colors.white,
                        appBar: AppBar(
                          title: const Text(
                            'Tạo Hợp Đồng Thuê Trọ',
                            style: TextStyle(color: Colors.black),
                          ),
                          backgroundColor: const Color(0xFF6FC9E5),
                          elevation: 0,
                        ),
                        body: SingleChildScrollView(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Bên cho thuê (Chủ nhà):',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              XInput(
                                value: state.hostName,
                                hintText: 'Tên chủ nhà',
                                onChanged: (value) => context
                                    .read<CreateContractBloc>()
                                    .onChangedhostName(value),
                              ),
                              XInput(
                                value: state.hostPhone,
                                hintText: 'Số điện thoại chủ nhà',
                                keyboardType: TextInputType.number,
                                onChanged: (value) => context
                                    .read<CreateContractBloc>()
                                    .onChangedhostPhone(value),
                              ),
                              XInput(
                                value: state.hostPlace,
                                hintText: 'Địa chỉ chủ nhà',
                                onChanged: (value) => context
                                    .read<CreateContractBloc>()
                                    .onChangedhostPlace(value),
                              ),
                              XInput(
                                value: state.hostEmail,
                                hintText: 'Email chủ nhà',
                                onChanged: (value) => context
                                    .read<CreateContractBloc>()
                                    .onChangedhostEmail(value),
                              ),
                              const Row(
                                children: [
                                  Text(
                                    'Bên thuê (Sinh viên):',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'Chọn sinh viên',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blue),
                                  ),
                                ],
                              ),
                              XInput(
                                value: state.student.name ?? "",
                                hintText: 'Tên sinh viên',
                                readOnly: true,
                              ),
                              XInput(
                                value: state.student.phone ?? "",
                                hintText: 'Số điện thoại sinh viên',
                                readOnly: true,
                              ),
                              XInput(
                                value: state.student.place ?? "",
                                hintText: 'Địa chỉ sinh viên',
                                readOnly: true,
                              ),
                              XInput(
                                value: state.student.email ?? "",
                                hintText: 'Email sinh viên',
                                readOnly: true,
                              ),
                              const Text(
                                'Thông tin căn nhà/trọ:',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              XInput(
                                value: state.roomPlace,
                                hintText: 'Địa chỉ căn nhà/trọ',
                                onChanged: (value) => context
                                    .read<CreateContractBloc>()
                                    .onChangedroomPlace(value),
                              ),
                              const Text(
                                'Thời gian thuê:',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              XInput(
                                value: state.roomStart,
                                hintText: 'Thời gian bắt đầu thuê',
                                onChanged: (value) => context
                                    .read<CreateContractBloc>()
                                    .onChangedroomStart(value),
                              ),
                              XInput(
                                value: state.roomEnd,
                                hintText: 'Thời gian kết thúc thuê',
                                onChanged: (value) => context
                                    .read<CreateContractBloc>()
                                    .onChangedroomEnd(value),
                              ),
                              const Text(
                                'Giá thuê và các khoản thanh toán:',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              XInput(
                                value: state.roomPrice,
                                hintText: 'Giá thuê hàng tháng',
                                keyboardType: TextInputType.number,
                                onChanged: (value) => context
                                    .read<CreateContractBloc>()
                                    .onChangedroomPrice(value),
                              ),
                              XInput(
                                value: state.roomPay,
                                hintText: 'Cách thanh toán',
                                onChanged: (value) => context
                                    .read<CreateContractBloc>()
                                    .onChangedroomPay(value),
                              ),
                              XInput(
                                value: state.roomOtherFees,
                                hintText: 'Các khoản phí đi kèm (nếu có)',
                                keyboardType: TextInputType.number,
                                onChanged: (value) => context
                                    .read<CreateContractBloc>()
                                    .onChangedroomOtherFees(value),
                              ),
                              XInput(
                                value: state.roomDeposit,
                                hintText: 'Tiền cọc',
                                keyboardType: TextInputType.number,
                                onChanged: (value) => context
                                    .read<CreateContractBloc>()
                                    .onChangedroomDeposit(value),
                              ),
                              const Text(
                                'Quy định sử dụng và quản lý:',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8.0),
                              XInput(
                                value: state.roomRule,
                                hintText: 'Quy định sử dụng căn nhà/trọ',
                                onChanged: (value) => context
                                    .read<CreateContractBloc>()
                                    .onChangedroomRule(value),
                              ),
                              XInput(
                                value: state.roomFix,
                                hintText: 'Quy định về sửa chữa và bảo trì',
                                onChanged: (value) => context
                                    .read<CreateContractBloc>()
                                    .onChangedroomFix(value),
                              ),
                              const Text(
                                'Các điều khoản khác:',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8.0),
                              XInput(
                                value: state.roomContractTerminatio,
                                hintText:
                                    'Quy định về chấm dứt hợp đồng trước thời hạn',
                                onChanged: (value) => context
                                    .read<CreateContractBloc>()
                                    .onChangedroomContractTerminatio(value),
                              ),
                              XInput(
                                value: state.roomDispute,
                                hintText:
                                    'Trách nhiệm trong trường hợp tranh chấp',
                                onChanged: (value) => context
                                    .read<CreateContractBloc>()
                                    .onChangedroomDispute(value),
                              ),
                              Center(
                                child: ElevatedButton(
                                  onPressed: () {
                                    context
                                        .read<CreateContractBloc>()
                                        .onCreateButton(context1, contextRoom,
                                            contextInfoContract);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF6FC9E5),
                                  ),
                                  child: const Text(
                                    'Tạo Hợp Đồng',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
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
