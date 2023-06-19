// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

class DSHopDong extends StatefulWidget {
  const DSHopDong({Key? key}) : super(key: key);

  @override
  _DSHopDongState createState() => _DSHopDongState();
}

class _DSHopDongState extends State<DSHopDong> {
  List<String> danhSachHopDong = [
    'Hợp đồng 1',
    'Hợp đồng 2',
    'Hợp đồng 3',
    // Add more contract names here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Danh Sách Hợp Đồng',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color(0xFF6FC9E5),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: danhSachHopDong.length,
        itemBuilder: (context, index) {
          final contractName = danhSachHopDong[index];
          return ListTile(
            title: Text(contractName),
            onTap: () {
              // Handle tapping on a contract
              // You can navigate to a contract details screen or perform any other action
            },
          );
        },
      ),
    );
  }
}
