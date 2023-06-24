import 'package:app_qlphongtro_sv/feature/dichvu_profile/dichvu_screen.dart';
import 'package:app_qlphongtro_sv/feature/group/list_group_page.dart';
import 'package:app_qlphongtro_sv/feature/profile/profile_page.dart';
import 'package:app_qlphongtro_sv/feature/hoadon/ds_hoadon.dart';
import 'package:app_qlphongtro_sv/feature/student/list_student_page.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  int _currentSlideIndex = 0;

  final List<String> slideImages = [
    'assets/Banners/banner1.png',
    'assets/Banners/banner2.png',
    'assets/Banners/banner3.png',
    'assets/Banners/banner4.png',
    'assets/Banners/banner5.png',
  ];

  get header => null;

  get subHeader => null;

  get subHeaderSelected => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF6FC9E5),
      bottomNavigationBar: Container(
        height: 80,
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        color: const Color(0xFF6FC9E5),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            CarouselSlider(
              items: slideImages.map((slide) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Image.asset(
                        slide,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                );
              }).toList(),
              options: CarouselOptions(
                height: 180.0,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                viewportFraction: 0.95,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentSlideIndex = index;
                  });
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: slideImages.map((slide) {
                int index = slideImages.indexOf(slide);
                return Container(
                  width: 8.0,
                  height: 8.0,
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _currentSlideIndex == index
                        ? Colors.white
                        : Colors.grey,
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 50),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProfileScreen()),
                            );
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(24),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            width: double.infinity,
                            child: Column(
                              children: [
                                Image.asset('assets/icons/icon1.png',
                                    height: 50),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'My Profile',
                                  style: subHeader,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Flexible(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ListStudentPage()),
                            );
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.all(
                                Radius.circular(24),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            width: double.infinity,
                            child: Column(
                              children: [
                                Image.asset('assets/icons/icon2.png',
                                    height: 50),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Danh sách Sinh viên',
                                  style: subHeaderSelected,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Flexible(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ListGroupPage()));
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(24),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            width: double.infinity,
                            child: Column(
                              children: [
                                Image.asset('assets/icons/icon3.png',
                                    height: 50),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Khu trọ',
                                  style: subHeader,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Flexible(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const DSHoaDon()));
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(24),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            width: double.infinity,
                            child: Column(
                              children: [
                                Image.asset('assets/icons/icon4.png',
                                    height: 50),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Hóa Đơn',
                                  style: subHeader,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Flexible(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const DichVuScreen()));
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.all(
                                Radius.circular(24),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            width: double.infinity,
                            child: Column(
                              children: [
                                Image.asset('assets/icons/logo5.png',
                                    height: 50),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Dịch vụ',
                                  style: subHeader,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
