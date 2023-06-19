import 'package:flutter/material.dart';

class DichVuScreen extends StatefulWidget {
  const DichVuScreen({super.key});

  @override
  State<DichVuScreen> createState() => _DichVuScreenState();
}

class _DichVuScreenState extends State<DichVuScreen> {
  List<BacDien> danhSachBacDien = [
    BacDien('Bậc 1 (0 - 50kWh)', '1.678'),
    BacDien('Bậc 2 (51 - 100kWh)', '1.734'),
    BacDien('Bậc 3 (101 - 200kWh)', '2.014'),
    BacDien('Bậc 4 (201 - 300kWh)', '2.536'),
    BacDien('Bậc 5 (301- 400kWh)', '2.834'),
    BacDien('Bậc 6 (401kWh trở lên)', '2.927'),
  ];

  List<BacNuoc> danhSachBacNuoc = [
    BacNuoc('Mức nước đầu tiên (0 - 10m3)', '5.973'),
    BacNuoc('Mức nước thứ hai (10 - 20m3)', '7.052'),
    BacNuoc('Mức nước thứ ba (20 - 30m3)', '8.669'),
    BacNuoc('Mức nước cuối cùng (trên 30m3)', '15.929'),
  ];

  List<BacInternet> danhSachBacInternet = [
    BacInternet('Gói Internet A', '100.000'),
    BacInternet('Gói Internet B', '200.000'),
    BacInternet('Gói Internet C', '300.000'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Dịch Vụ',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color(0xFF6FC9E5),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            const Text(
              'Giá điện',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            DataTable(
              columns: const [
                DataColumn(
                    label: Text('Bậc',
                        style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Giá (đồng/kWh)',
                        style: TextStyle(fontWeight: FontWeight.bold))),
              ],
              rows: danhSachBacDien.map((bac) {
                return DataRow(cells: [
                  DataCell(Text(bac.tenBac)),
                  DataCell(
                    TextFormField(
                      initialValue: bac.gia,
                      onChanged: (value) => bac.gia = value,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        isDense: true,
                        border: InputBorder.none,
                      ),
                      textAlign: TextAlign.end,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ]);
              }).toList(),
            ),
            const SizedBox(height: 16),
            const Text(
              'Giá nước',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            DataTable(
              columns: const [
                DataColumn(
                    label: Text('Mức',
                        style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Giá (đồng/m3)',
                        style: TextStyle(fontWeight: FontWeight.bold))),
              ],
              rows: danhSachBacNuoc.map((bac) {
                return DataRow(cells: [
                  DataCell(Text(bac.tenBac)),
                  DataCell(
                    TextFormField(
                      initialValue: bac.gia,
                      onChanged: (value) => bac.gia = value,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        isDense: true,
                        border: InputBorder.none,
                      ),
                      textAlign: TextAlign.end,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ]);
              }).toList(),
            ),
            const SizedBox(height: 16),
            const Text(
              'Giá Internet',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            DataTable(
              columns: const [
                DataColumn(
                    label: Text('Gói',
                        style: TextStyle(fontWeight: FontWeight.bold))),
                DataColumn(
                    label: Text('Giá (đồng/tháng)',
                        style: TextStyle(fontWeight: FontWeight.bold))),
              ],
              rows: danhSachBacInternet.map((bac) {
                return DataRow(cells: [
                  DataCell(Text(bac.tenGoi)),
                  DataCell(
                    TextFormField(
                      initialValue: bac.gia,
                      onChanged: (value) => bac.gia = value,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        isDense: true,
                        border: InputBorder.none,
                      ),
                      textAlign: TextAlign.end,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ]);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class BacDien {
  String tenBac;
  String gia;

  BacDien(this.tenBac, this.gia);
}

class BacNuoc {
  String tenBac;
  String gia;

  BacNuoc(this.tenBac, this.gia);
}

class BacInternet {
  String tenGoi;
  String gia;

  BacInternet(this.tenGoi, this.gia);
}
