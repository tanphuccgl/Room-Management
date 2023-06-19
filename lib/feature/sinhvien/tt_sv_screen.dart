// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:app_qlphongtro_sv/feature/hopdong/tt_hopdong_sv.dart';
import 'package:flutter/material.dart';

class ThongTinSinhVienThue extends StatefulWidget {
  final String tenSinhVien;

  ThongTinSinhVienThue({required this.tenSinhVien});

  @override
  State<ThongTinSinhVienThue> createState() => _ThongTinSinhVienThueState();
}

class _ThongTinSinhVienThueState extends State<ThongTinSinhVienThue> {
  late TextEditingController ngayThangNamSinhController;
  late TextEditingController gioiTinhController;
  late TextEditingController soDienThoaiController;
  late TextEditingController emailController;
  late TextEditingController queQuanController;
  late TextEditingController soCMNDController;

  @override
  void initState() {
    super.initState();
    ngayThangNamSinhController = TextEditingController();
    gioiTinhController = TextEditingController();
    soDienThoaiController = TextEditingController();
    emailController = TextEditingController();
    queQuanController = TextEditingController();
    soCMNDController = TextEditingController();
  }

  @override
  void dispose() {
    ngayThangNamSinhController.dispose();
    gioiTinhController.dispose();
    soDienThoaiController.dispose();
    emailController.dispose();
    queQuanController.dispose();
    soCMNDController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Thông tin chi tiết sinh viên thuê: ${widget.tenSinhVien}',
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color(0xFF6FC9E5),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tên sinh viên: ${widget.tenSinhVien}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: ngayThangNamSinhController,
              decoration: InputDecoration(
                labelText: 'Ngày tháng năm sinh',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: gioiTinhController,
              decoration: InputDecoration(
                labelText: 'Giới tính',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: soDienThoaiController,
              decoration: InputDecoration(
                labelText: 'Số điện thoại',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: queQuanController,
              decoration: InputDecoration(
                labelText: 'Quê quán',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: soCMNDController,
              decoration: InputDecoration(
                labelText: 'Số CMND hoặc số CCCD',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color(0xFF6FC9E5),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ThongTinHopDongTungSV(
                      tenSinhVien: widget.tenSinhVien,
                    ),
                  ),
                );
              },
              child: const Text('Xem hợp đồng'),
            ),
          ],
        ),
      ),
    );
  }
}
