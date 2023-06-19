// ignore_for_file: sort_child_properties_last

import 'package:app_qlphongtro_sv/feature/phongtro/thongtin_phongtro.dart';
import 'package:flutter/material.dart';

class DSPhongTro extends StatefulWidget {
  const DSPhongTro({super.key});

  @override
  State<DSPhongTro> createState() => _DSPhongTroState();
}

class _DSPhongTroState extends State<DSPhongTro> {
  List<PhongTro> danhSachPhong = [
    PhongTro('Phòng 1', false, soNguoi: 1),
    PhongTro('Phòng 2', true, soNguoi: 2),
    PhongTro('Phòng 3', false, soNguoi: 1),
  ];

  @override
  Widget build(BuildContext context) {
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
        itemCount: danhSachPhong.length,
        itemBuilder: (context, index) {
          PhongTro phong = danhSachPhong[index];
          bool daThue = phong.hopDong != null;
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ThongTinChiTietPhong(
                      tenPhong: phong.tenPhong,
                      soNguoi: phong.soNguoi,
                      daThue: daThue,
                      soPhong: phong.soPhong,
                      tenSinhVien: '',
                    ),
                  ),
                );
              },
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
                            color: daThue ? Colors.red : Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                  title: Text(
                    phong.tenPhong,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Số người: ${phong.soNguoi}',
                        style: const TextStyle(
                          color: Colors.purple,
                        ),
                      ),
                      Text(
                        daThue ? 'Đã thuê' : 'Phòng trống',
                        style: TextStyle(
                          color: daThue ? Colors.green : Colors.red,
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
                          _chinhSuaPhong(phong);
                        },
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        color: Colors.grey,
                        onPressed: () {
                          _xoaPhong(phong);
                        },
                      ),
                    ],
                  ),
                  onLongPress: () {
                    _capNhatTrangThaiThue(phong);
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
        onPressed: _themPhong,
      ),
    );
  }

  void _themPhong() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String tenPhong = '';
        int soNguoi = 0;
        bool daThue = false;
        return AlertDialog(
          title: const Text('Thêm phòng'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  tenPhong = value;
                },
                decoration: const InputDecoration(
                  hintText: 'Tên phòng',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                onChanged: (value) {
                  soNguoi = int.tryParse(value) ?? 0;
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Số người',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Text('Đã thuê:'),
                  Checkbox(
                    value: daThue,
                    onChanged: (bool? value) {
                      setState(() {
                        daThue = value ?? false;
                      });
                    },
                  ),
                ],
              ),
            ],
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
                if (tenPhong.isNotEmpty) {
                  setState(() {
                    PhongTro newPhong =
                        PhongTro(tenPhong, daThue, soNguoi: soNguoi);
                    danhSachPhong.add(newPhong);
                  });
                  Navigator.pop(context);
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _xoaPhong(PhongTro phong) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Xóa phòng'),
          content: Text(
              'Bạn có chắc chắn muốn xóa phòng "${phong.tenPhong}" không?'),
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
                setState(() {
                  danhSachPhong.remove(phong);
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _capNhatTrangThaiThue(PhongTro phong) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Cập nhật trạng thái thuê'),
          content: Text(
              'Bạn có chắc chắn muốn cập nhật trạng thái thuê của phòng "${phong.tenPhong}" không?'),
          actions: [
            TextButton(
              child: const Text('Hủy'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: const Text('Cập nhật'),
              onPressed: () {
                setState(() {
                  if (phong.hopDong != null) {
                    phong.hopDong = null;
                  } else {
                    phong.hopDong = HopDong('Ngày bắt đầu', 'Ngày kết thúc');
                  }
                });
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void _chinhSuaPhong(PhongTro phong) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String tenPhong = phong.tenPhong;
        int soNguoi = phong.soNguoi;
        bool daThue = phong.hopDong != null;
        return AlertDialog(
          title: const Text('Chỉnh sửa phòng'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                onChanged: (value) {
                  tenPhong = value;
                },
                controller: TextEditingController(text: tenPhong),
                decoration: const InputDecoration(
                  hintText: 'Tên phòng',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                onChanged: (value) {
                  soNguoi = int.tryParse(value) ?? 0;
                },
                keyboardType: TextInputType.number,
                controller: TextEditingController(text: soNguoi.toString()),
                decoration: const InputDecoration(
                  hintText: 'Số người',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Text('Đã thuê:'),
                  Checkbox(
                    value: daThue,
                    onChanged: (bool? value) {
                      setState(() {
                        daThue = value ?? false;
                      });
                    },
                  ),
                ],
              ),
            ],
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
                if (tenPhong.isNotEmpty) {
                  setState(() {
                    phong.tenPhong = tenPhong;
                    phong.soNguoi = soNguoi;
                    if (daThue) {
                      phong.hopDong ??=
                          HopDong('Ngày bắt đầu', 'Ngày kết thúc');
                    } else {
                      phong.hopDong = null;
                    }
                  });
                  Navigator.pop(context);
                }
              },
            ),
          ],
        );
      },
    );
  }
}

class PhongTro {
  String tenPhong;
  bool daThue;
  int soNguoi;
  HopDong? hopDong;

  PhongTro(this.tenPhong, this.daThue, {this.soNguoi = 0, this.hopDong});

  get soPhong => null;
}

class HopDong {
  String ngayBatDau;
  String ngayKetThuc;

  HopDong(this.ngayBatDau, this.ngayKetThuc);
}
