import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController totalKhuTroController = TextEditingController();
  TextEditingController totalPhongTroController = TextEditingController();
  TextEditingController totalPhongDaThueController = TextEditingController();

  int? totalKhuTro;
  int? totalPhongTro;
  int? totalPhongDaThue;
  int? totalPhongConTrong;

  @override
  void initState() {
    super.initState();
    totalKhuTroController.addListener(calculateTotalPhongConTrong);
    totalPhongTroController.addListener(calculateTotalPhongConTrong);
    totalPhongDaThueController.addListener(calculateTotalPhongConTrong);
  }

  void calculateTotalPhongConTrong() {
    setState(() {
      totalKhuTro = int.tryParse(totalKhuTroController.text);
      totalPhongTro = int.tryParse(totalPhongTroController.text);
      totalPhongDaThue = int.tryParse(totalPhongDaThueController.text);

      if (totalPhongTro != null && totalPhongDaThue != null) {
        totalPhongConTrong = totalPhongTro! - totalPhongDaThue!;
      } else {
        totalPhongConTrong = null;
      }
    });
  }

  void saveProfileInformation() {
    // Perform the save operation here
    // For example, you can access the entered values using the TextEditingController and store them in variables or update them in a database

    // Show a snackbar or any other appropriate feedback to indicate the save operation is complete
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Profile đã được lưu')),
    );
  }

  @override
  void dispose() {
    totalKhuTroController.dispose();
    totalPhongTroController.dispose();
    totalPhongDaThueController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color(0xFF6FC9E5),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CircleAvatar(
                // Add image information from your data source
                backgroundImage: AssetImage('assets/icons/Iconavater.png'),
                radius: 50,
              ),
              const SizedBox(height: 15),
              const Text(
                'Profile Information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: TextField(
                  controller: totalKhuTroController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Tổng Khu Trọ',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: TextField(
                  controller: totalPhongTroController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Tổng Phòng Trọ',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: TextField(
                  controller: totalPhongDaThueController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Tổng Phòng Trọ Đã Được Thuê',
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Tổng số khu trọ hiện có'),
                subtitle: Text(totalKhuTro?.toString() ?? ''),
              ),
              ListTile(
                leading: const Icon(Icons.apartment),
                title: const Text('Tổng số phòng trọ hiện có'),
                subtitle: Text(totalPhongTro?.toString() ?? ''),
              ),
              ListTile(
                leading: const Icon(Icons.check),
                title: const Text('Tổng số phòng trọ đã được thuê'),
                subtitle: Text(totalPhongDaThue?.toString() ?? ''),
              ),
              ListTile(
                leading: const Icon(Icons.event_available),
                title: const Text('Tổng số phòng trọ còn trống'),
                subtitle: Text(totalPhongConTrong?.toString() ?? ''),
              ),
              ElevatedButton(
                onPressed: saveProfileInformation,
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
