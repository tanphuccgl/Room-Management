// ignore_for_file: use_build_context_synchronously

import 'package:app_qlphongtro_sv/feature/bill/list_bill_page.dart';
import 'package:app_qlphongtro_sv/feature/bill/logic/list_bill_bloc.dart';
import 'package:app_qlphongtro_sv/network/domain_manager.dart';
import 'package:app_qlphongtro_sv/network/model/bill.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:uuid/uuid.dart';

class BacDien {
  String ten;
  double giaTien;

  BacDien(this.ten, this.giaTien);
}

class BacNuoc {
  String ten;
  double giaTien;

  BacNuoc(this.ten, this.giaTien);
}

class BacInternet {
  String ten;
  double giaTien;

  BacInternet(this.ten, this.giaTien);
}

class TaoHoaDon extends StatefulWidget {
  final BuildContext contextBill;
  const TaoHoaDon({Key? key, required this.contextBill}) : super(key: key);

  @override
  State<TaoHoaDon> createState() => _TaoHoaDonState();
}

class _TaoHoaDonState extends State<TaoHoaDon> {
  List<BacDien> danhSachBacDien = [
    BacDien('Bậc 1 (0 - 50kWh)', 1.678),
    BacDien('Bậc 2 (51 - 100kWh)', 1.734),
    BacDien('Bậc 3 (101 - 200kWh)', 2.014),
    BacDien('Bậc 4 (201 - 300kWh)', 2.536),
    BacDien('Bậc 5 (301- 400kWh)', 2.834),
    BacDien('Bậc 6 (401kWh trở lên)', 2.927),
  ];

  List<BacNuoc> danhSachBacNuoc = [
    BacNuoc('Mức nước đầu tiên (0 - 10m3)', 5.973),
    BacNuoc('Mức nước thứ hai (10 - 20m3)', 7.052),
    BacNuoc('Mức nước thứ ba (20 - 30m3)', 8.669),
    BacNuoc('Mức nước cuối cùng (trên 30m3)', 15.929),
  ];

  List<BacInternet> danhSachBacInternet = [
    BacInternet('Gói Internet A', 100000),
    BacInternet('Gói Internet B', 200000),
    BacInternet('Gói Internet C', 300000),
  ];

  double soM3SuDung = 0;
  double soKWhSuDung = 0;
  double tienNuoc = 0;
  double tienDien = 0;
  double tienInternet = 0;
  double tienTroThang = 0;
  double tongTienTro = 0;

  String khuPhong = '';
  String tenPhong = '';

  void tinhTienNuoc() {
    // ignore: dead_code
    for (int i = 0; i < danhSachBacNuoc.length; i++) {
      BacNuoc bacNuoc = danhSachBacNuoc[i];
      if (soM3SuDung <= 10) {
        tienNuoc = soM3SuDung * bacNuoc.giaTien;
        break;
      } else if (soM3SuDung <= 20) {
        tienNuoc = 10 * bacNuoc.giaTien;
        break;
      } else if (soM3SuDung <= 30) {
        tienNuoc = 10 * danhSachBacNuoc[1].giaTien +
            (soM3SuDung - 20) * bacNuoc.giaTien;
        break;
      } else {
        tienNuoc = 10 * danhSachBacNuoc[1].giaTien +
            10 * danhSachBacNuoc[2].giaTien +
            (soM3SuDung - 30) * bacNuoc.giaTien;
        break;
      }
    }
  }

  void tinhTienDien() {
    // ignore: dead_code
    for (int i = 0; i < danhSachBacDien.length; i++) {
      BacDien bacDien = danhSachBacDien[i];
      if (soKWhSuDung <= 50) {
        tienDien = soKWhSuDung * bacDien.giaTien;
        break;
      } else if (soKWhSuDung <= 100) {
        tienDien = 50 * bacDien.giaTien;
        break;
      } else if (soKWhSuDung <= 200) {
        tienDien = 50 * danhSachBacDien[1].giaTien +
            (soKWhSuDung - 100) * bacDien.giaTien;
        break;
      } else if (soKWhSuDung <= 300) {
        tienDien = 50 * danhSachBacDien[1].giaTien +
            100 * danhSachBacDien[2].giaTien +
            (soKWhSuDung - 200) * bacDien.giaTien;
        break;
      } else if (soKWhSuDung <= 400) {
        tienDien = 50 * danhSachBacDien[1].giaTien +
            100 * danhSachBacDien[2].giaTien +
            100 * danhSachBacDien[3].giaTien +
            (soKWhSuDung - 300) * bacDien.giaTien;
        break;
      } else {
        tienDien = 50 * danhSachBacDien[1].giaTien +
            100 * danhSachBacDien[2].giaTien +
            100 * danhSachBacDien[3].giaTien +
            100 * danhSachBacDien[4].giaTien +
            (soKWhSuDung - 400) * bacDien.giaTien;
        break;
      }
    }
  }

  void chonGoiInternet() {
    tienInternet = danhSachBacInternet[0].giaTien; // Chọn gói Internet A
  }

  void tinhTongTienTro() {
    setState(() {
      tongTienTro = tienTroThang + tienNuoc + tienDien + tienInternet;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.contextBill.read<BillBloc>(),
      child: BlocBuilder<BillBloc, BillState>(
        builder: (context1, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text(
                'Tạo Hóa Đơn',
                style: TextStyle(color: Colors.black),
              ),
              backgroundColor: const Color(0xFF6FC9E5),
              elevation: 0,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Khu Trọ',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Nhập khu phòng',
                      ),
                      onChanged: (value) {
                        setState(() {
                          khuPhong = value;
                        });
                      },
                    ),
                    const SizedBox(height: 8.0),
                    const Text(
                      'Tên phòng',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Nhập tên phòng',
                      ),
                      onChanged: (value) {
                        setState(() {
                          tenPhong = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Thông tin hóa đơn',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Tiền trọ tháng',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Nhập tiền trọ tháng',
                      ),
                      onChanged: (value) {
                        setState(() {
                          tienTroThang = double.parse(value);
                          tinhTienNuoc();
                          tinhTienDien();
                          tinhTongTienTro();
                        });
                      },
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Số điện sử dụng',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Nhập số điện sử dụng',
                      ),
                      onChanged: (value) {
                        setState(() {
                          soKWhSuDung = double.parse(value);
                          tinhTienNuoc();
                          tinhTienDien();
                          tinhTongTienTro();
                        });
                      },
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Số nước sử dụng',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Nhập số nước sử dụng',
                      ),
                      onChanged: (value) {
                        setState(() {
                          soM3SuDung = double.parse(value);
                          tinhTienNuoc();
                          tinhTienDien();
                          tinhTongTienTro();
                        });
                      },
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Internet',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    DropdownButtonFormField<BacInternet>(
                      decoration: const InputDecoration(
                        hintText: 'Chọn gói Internet',
                      ),
                      value: danhSachBacInternet[0],
                      items: danhSachBacInternet.map((BacInternet bacInternet) {
                        return DropdownMenuItem<BacInternet>(
                          value: bacInternet,
                          child: Text(bacInternet.ten),
                        );
                      }).toList(),
                      onChanged: (BacInternet? value) {
                        setState(() {
                          chonGoiInternet();
                          tinhTienNuoc();
                          tinhTienDien();
                          tinhTongTienTro();
                        });
                      },
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              tinhTienNuoc();
                              tinhTienDien();
                              tinhTongTienTro();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF6FC9E5),
                          ),
                          child: const Text(
                            'Tính tổng tiền',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ListBillPage()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF6FC9E5),
                          ),
                          child: const Text(
                            'Xem danh sách hóa đơn',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Khu trọ:',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      khuPhong,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    const Text(
                      'Tên phòng:',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      tenPhong,
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Tổng tiền trọ',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      '${tongTienTro.toStringAsFixed(2)} VNĐ',
                      style: const TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: MaterialButton(
                            color: const Color(0xFF6FC9E5),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            onPressed: () async {
                              await GetIt.I<DomainManager>().bill.postGroup(
                                  WBill(
                                      id: const Uuid().v4(),
                                      total: tongTienTro.toString()));

                              widget.contextBill
                                  .read<BillBloc>()
                                  .getListGroup();
                              Navigator.pop(context);
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(25.0),
                              child: Text(
                                "Tạo hóa đơn",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                ),
                              ),
                            ),
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
  }
}
