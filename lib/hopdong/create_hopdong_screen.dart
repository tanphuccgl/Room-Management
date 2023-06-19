import 'package:app_qlphongtro_sv/hopdong/ds_hopdong.dart';
import 'package:flutter/material.dart';

class TaoHopDong extends StatefulWidget {
  const TaoHopDong({super.key});

  @override
  State<TaoHopDong> createState() => _TaoHopDongState();
}

class _TaoHopDongState extends State<TaoHopDong> {
  String tenChuNha = '';
  String sdtChuNha = '';
  String diaChiChuNha = '';
  String emailChuNha = '';

  String tenSinhVien = '';
  String sdtSinhVien = '';
  String diaChiSinhVien = '';
  String emailSinhVien = '';
  String truongHoc = '';

  String diaChiTro = '';
  String thoiGianBatDau = '';
  String thoiGianKetThuc = '';
  String giaThue = '';
  String cachThanhToan = '';
  String cacKhoanPhiDiKem = '';
  String tienCoc = '';
  String quyDinhSuDung = '';
  String quyDinhSuaChua = '';
  String quyDinhChamDutHopDong = '';
  String trachNhiemTranhChap = '';

  @override
  Widget build(BuildContext context) {
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
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  tenChuNha = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Tên chủ nhà',
              ),
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  sdtChuNha = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Số điện thoại chủ nhà',
              ),
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  diaChiChuNha = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Địa chỉ chủ nhà',
              ),
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  emailChuNha = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Email chủ nhà',
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Bên thuê (Sinh viên):',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  tenSinhVien = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Tên sinh viên',
              ),
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  sdtSinhVien = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Số điện thoại sinh viên',
              ),
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  diaChiSinhVien = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Địa chỉ sinh viên',
              ),
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  emailSinhVien = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Email sinh viên',
              ),
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  truongHoc = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Trường đại học / Trung tâm đào tạo',
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Thông tin căn nhà/trọ:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  diaChiTro = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Địa chỉ căn nhà/trọ',
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Thời gian thuê:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  thoiGianBatDau = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Thời gian bắt đầu thuê',
              ),
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  thoiGianKetThuc = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Thời gian kết thúc thuê',
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Giá thuê và các khoản thanh toán:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  giaThue = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Giá thuê hàng tháng',
              ),
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  cachThanhToan = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Cách thanh toán',
              ),
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  cacKhoanPhiDiKem = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Các khoản phí đi kèm (nếu có)',
              ),
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  tienCoc = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Tiền cọc',
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Quy định sử dụng và quản lý:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  quyDinhSuDung = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Quy định sử dụng căn nhà/trọ',
              ),
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  quyDinhSuaChua = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Quy định về sửa chữa và bảo trì',
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Các điều khoản khác:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  quyDinhChamDutHopDong = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Quy định về chấm dứt hợp đồng trước thời hạn',
              ),
            ),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  trachNhiemTranhChap = value;
                });
              },
              decoration: const InputDecoration(
                labelText: 'Trách nhiệm trong trường hợp tranh chấp',
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Thực hiện lưu hợp đồng hoặc xử lý dữ liệu
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6FC9E5),
                  ),
                  child: const Text(
                    'Lưu Hợp Đồng',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const DSHopDong()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6FC9E5),
                  ),
                  child: const Text(
                    'Xem Danh Sách Hợp Đồng',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
