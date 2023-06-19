import 'package:app_qlphongtro_sv/hoadon/create_hoadon.dart';
import 'package:flutter/material.dart';

class DSHoaDon extends StatefulWidget {
  const DSHoaDon({super.key});

  @override
  State<DSHoaDon> createState() => _DSHoaDonState();
}

class _DSHoaDonState extends State<DSHoaDon> {
  List<HoaDon> danhSachHoaDon = []; // Danh sách hóa đơn
  @override
  Widget build(BuildContext context) {
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
      body: danhSachHoaDon.isEmpty // Kiểm tra danh sách hóa đơn rỗng
          ? const Center(
              child: Text('Không có hóa đơn'),
            )
          : ListView.builder(
              itemCount: danhSachHoaDon.length,
              itemBuilder: (context, index) {
                HoaDon hoaDon = danhSachHoaDon[index];
                return ListTile(
                  title: Text('Hóa đơn ${hoaDon.id}'),
                  subtitle: Text('Tổng tiền: ${hoaDon.tongTien} VNĐ'),
                );
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    const TaoHoaDon()), // Navigate to the TaoHoaDon page
          );
        },
        label: const Text('Tạo hóa đơn'),
        icon: const Icon(Icons.add),
        backgroundColor: const Color(0xFF6FC9E5),
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
