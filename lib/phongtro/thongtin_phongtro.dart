// ignore_for_file: library_private_types_in_public_api

import 'package:app_qlphongtro_sv/hopdong/create_hopdong_screen.dart';
import 'package:app_qlphongtro_sv/sinhvien/tt_sv_screen.dart';
import 'package:flutter/material.dart';

class ThongTinChiTietPhong extends StatefulWidget {
  final String tenPhong;
  final int soNguoi;
  final bool daThue;
  final int? soPhong;
  final String tenSinhVien;

  const ThongTinChiTietPhong({
    Key? key,
    required this.tenPhong,
    required this.soNguoi,
    required this.daThue,
    this.soPhong,
    required this.tenSinhVien,
  }) : super(key: key);

  @override
  _ThongTinChiTietPhongState createState() => _ThongTinChiTietPhongState();
}

class _ThongTinChiTietPhongState extends State<ThongTinChiTietPhong> {
  bool isEditing = false;
  late TextEditingController tenPhongController;
  late TextEditingController soNguoiController;
  late TextEditingController soPhongController;
  late TextEditingController tenSinhVienController;

  List<String> images = [
    'assets/Backgrounds/phongtro1.jpg',
    'assets/Backgrounds/phongtro2.jpg',
    'assets/Backgrounds/phongtro3.jpg',
    // Thêm đường dẫn hình ảnh vào danh sách
  ];

  @override
  void initState() {
    super.initState();
    tenPhongController = TextEditingController(text: widget.tenPhong);
    soNguoiController = TextEditingController(text: widget.soNguoi.toString());
    soPhongController =
        TextEditingController(text: widget.soPhong?.toString() ?? '');
    tenSinhVienController = TextEditingController(text: widget.tenSinhVien);
  }

  @override
  void dispose() {
    tenPhongController.dispose();
    soNguoiController.dispose();
    soPhongController.dispose();
    tenSinhVienController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Thông Tin Phòng Trọ Số : ',
          style: TextStyle(color: Colors.black),
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
              TextField(
                controller: tenPhongController,
                decoration: InputDecoration(
                  labelText: 'Tên phòng',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                enabled: isEditing,
              ),
              const SizedBox(height: 8),
              TextField(
                controller: soNguoiController,
                decoration: InputDecoration(
                  labelText: 'Số người',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.number,
                enabled: isEditing,
              ),
              const SizedBox(height: 8),
              TextField(
                controller: soPhongController,
                decoration: InputDecoration(
                  labelText: 'Số phòng',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                keyboardType: TextInputType.number,
                enabled: isEditing,
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ThongTinSinhVienThue(
                        tenSinhVien: widget.tenSinhVien,
                      ),
                    ),
                  );
                },
                child: TextField(
                  controller: tenSinhVienController,
                  decoration: InputDecoration(
                    labelText: 'Tên sinh viên',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  enabled: isEditing,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                widget.daThue
                    ? 'Trạng thái: Đã thuê'
                    : 'Trạng thái: Phòng trống',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: widget.daThue ? Colors.green : Colors.red,
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
                            builder: (context) => const TaoHopDong(),
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
                  const SizedBox(width: 10), // Đặt khoảng cách giữa hai nút
                  SizedBox(
                    width: 150, // Đặt chiều rộng cố định cho nút
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isEditing = !isEditing;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        backgroundColor: isEditing ? Colors.green : Colors.red,
                      ),
                      child: Text(isEditing ? 'Lưu' : 'Sửa'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
