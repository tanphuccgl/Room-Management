import 'package:flutter/material.dart';

class ThongTinHopDongTungSV extends StatefulWidget {
  final String tenSinhVien;

  // ignore: prefer_const_constructors_in_immutables
  ThongTinHopDongTungSV({Key? key, required this.tenSinhVien})
      : super(key: key);

  @override
  State<ThongTinHopDongTungSV> createState() => _ThongTinHopDongTungSVState();
}

class _ThongTinHopDongTungSVState extends State<ThongTinHopDongTungSV> {
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
    );
  }
}
