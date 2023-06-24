import 'package:app_qlphongtro_sv/feature/bill/create_hoadon.dart';
import 'package:app_qlphongtro_sv/feature/bill/logic/list_bill_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListBillPage extends StatelessWidget {
  const ListBillPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BillBloc(),
      child: BlocBuilder<BillBloc, BillState>(
        builder: (context1, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text(
                'Danh Sách Hóa Đơn',
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: const Color(0xFF6FC9E5),
              elevation: 0,
            ),
            body: state.listBill.isEmpty // Kiểm tra danh sách hóa đơn rỗng
                ? const Center(
                    child: Text('Không có hóa đơn'),
                  )
                : ListView.builder(
                    itemCount: state.listBill.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text('Hóa đơn ${state.listBill[index].id}'),
                        subtitle: Text(
                            'Tổng tiền: ${state.listBill[index].total} VNĐ'),
                      );
                    },
                  ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(
                  context1,
                  MaterialPageRoute(
                      builder: (context) => TaoHoaDon(
                            contextBill: context1,
                          )), // Navigate to the TaoHoaDon page
                );
              },
              label: const Text('Tạo hóa đơn'),
              icon: const Icon(Icons.add),
              backgroundColor: const Color(0xFF6FC9E5),
            ),
          );
        },
      ),
    );
  }
}

class HoaDon {
  // Define your HoaDon class properties here
  int id;
  int tongTien;

  HoaDon({required this.id, required this.tongTien});
}
