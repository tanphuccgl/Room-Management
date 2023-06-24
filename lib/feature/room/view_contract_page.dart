import 'package:app_qlphongtro_sv/feature/room/logic/create_contract_bloc.dart';
import 'package:app_qlphongtro_sv/feature/room/logic/view_contract_bloc.dart';
import 'package:app_qlphongtro_sv/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewContractPage extends StatelessWidget {
  final String idContract;
  final String idStudent;

  const ViewContractPage({
    super.key,
    required this.idContract,
    required this.idStudent,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ViewContractBloc()
        ..getContract(context, idContract)
        ..getInfoStudent(context, idStudent),
      child: BlocBuilder<ViewContractBloc, ViewContractState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text(
                'Thông tin Hợp Đồng Thuê Trọ',
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  XInput(
                    value: state.contract.hostName,
                    readOnly: true,
                    hintText: 'Tên chủ nhà',
                    onChanged: (value) => context
                        .read<CreateContractBloc>()
                        .onChangedhostName(value),
                  ),
                  XInput(
                    value: state.contract.hostPhone,
                    hintText: 'Số điện thoại chủ nhà',
                    readOnly: true,
                    keyboardType: TextInputType.number,
                    onChanged: (value) => context
                        .read<CreateContractBloc>()
                        .onChangedhostPhone(value),
                  ),
                  XInput(
                    value: state.contract.hostPlace,
                    hintText: 'Địa chỉ chủ nhà',
                    readOnly: true,
                    onChanged: (value) => context
                        .read<CreateContractBloc>()
                        .onChangedhostPlace(value),
                  ),
                  XInput(
                    value: state.contract.hostEmail,
                    hintText: 'Email chủ nhà',
                    readOnly: true,
                    onChanged: (value) => context
                        .read<CreateContractBloc>()
                        .onChangedhostEmail(value),
                  ),
                  const Text(
                    'Bên thuê (Sinh viên):',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  XInput(
                    value: state.contract.roomPlace,
                    readOnly: true,
                    hintText: 'Địa chỉ căn nhà/trọ',
                    onChanged: (value) => context
                        .read<CreateContractBloc>()
                        .onChangedroomPlace(value),
                  ),
                  const Text(
                    'Thời gian thuê:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  XInput(
                    value: state.contract.roomStart,
                    readOnly: true,
                    hintText: 'Thời gian bắt đầu thuê',
                    onChanged: (value) => context
                        .read<CreateContractBloc>()
                        .onChangedroomStart(value),
                  ),
                  XInput(
                    value: state.contract.roomEnd,
                    readOnly: true,
                    hintText: 'Thời gian kết thúc thuê',
                    onChanged: (value) => context
                        .read<CreateContractBloc>()
                        .onChangedroomEnd(value),
                  ),
                  const Text(
                    'Giá thuê và các khoản thanh toán:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  XInput(
                    value: state.contract.roomPrice,
                    readOnly: true,
                    hintText: 'Giá thuê hàng tháng',
                    keyboardType: TextInputType.number,
                    onChanged: (value) => context
                        .read<CreateContractBloc>()
                        .onChangedroomPrice(value),
                  ),
                  XInput(
                    value: state.contract.roomPay,
                    readOnly: true,
                    hintText: 'Cách thanh toán',
                    onChanged: (value) => context
                        .read<CreateContractBloc>()
                        .onChangedroomPay(value),
                  ),
                  XInput(
                    value: state.contract.roomOtherFees,
                    readOnly: true,
                    hintText: 'Các khoản phí đi kèm (nếu có)',
                    keyboardType: TextInputType.number,
                    onChanged: (value) => context
                        .read<CreateContractBloc>()
                        .onChangedroomOtherFees(value),
                  ),
                  XInput(
                    value: state.contract.roomDeposit,
                    readOnly: true,
                    hintText: 'Tiền cọc',
                    keyboardType: TextInputType.number,
                    onChanged: (value) => context
                        .read<CreateContractBloc>()
                        .onChangedroomDeposit(value),
                  ),
                  const Text(
                    'Quy định sử dụng và quản lý:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  XInput(
                    readOnly: true,
                    value: state.contract.roomRule,
                    hintText: 'Quy định sử dụng căn nhà/trọ',
                    onChanged: (value) => context
                        .read<CreateContractBloc>()
                        .onChangedroomRule(value),
                  ),
                  XInput(
                    readOnly: true,
                    value: state.contract.roomFix,
                    hintText: 'Quy định về sửa chữa và bảo trì',
                    onChanged: (value) => context
                        .read<CreateContractBloc>()
                        .onChangedroomFix(value),
                  ),
                  const Text(
                    'Các điều khoản khác:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8.0),
                  XInput(
                    value: state.contract.roomContractTerminatio,
                    readOnly: true,
                    hintText: 'Quy định về chấm dứt hợp đồng trước thời hạn',
                    onChanged: (value) => context
                        .read<CreateContractBloc>()
                        .onChangedroomContractTerminatio(value),
                  ),
                  XInput(
                    value: state.contract.roomDispute,
                    readOnly: true,
                    hintText: 'Trách nhiệm trong trường hợp tranh chấp',
                    onChanged: (value) => context
                        .read<CreateContractBloc>()
                        .onChangedroomDispute(value),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
