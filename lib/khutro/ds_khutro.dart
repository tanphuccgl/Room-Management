import 'package:app_qlphongtro_sv/phongtro/ds_phongtro.dart';
import 'package:flutter/material.dart';

class DSKhuTro extends StatefulWidget {
  const DSKhuTro({super.key});

  @override
  State<DSKhuTro> createState() => _DSKhuTroState();
}

class _DSKhuTroState extends State<DSKhuTro> {
  List<KhuTro> danhSachKhuTro = [
    KhuTro(
      ten: 'Khu trọ A',
      diaChi: 'Địa chỉ A',
      soPhong: 5,
      soPhongTrong: 3,
    ),
    KhuTro(
      ten: 'Khu trọ B',
      diaChi: 'Địa chỉ B',
      soPhong: 10,
      soPhongTrong: 0,
    ),
    KhuTro(
      ten: 'Khu trọ C',
      diaChi: 'Địa chỉ C',
      soPhong: 8,
      soPhongTrong: 2,
    ),
  ];

  int editingIndex = -1;

  void themKhuTro(String ten, String diaChi, int soPhong, int soPhongTrong) {
    setState(() {
      danhSachKhuTro.add(
        KhuTro(
          ten: ten,
          diaChi: diaChi,
          soPhong: soPhong,
          soPhongTrong: soPhongTrong,
        ),
      );
    });
  }

  void capNhatKhuTro(int index, String ten, String diaChi) {
    setState(() {
      danhSachKhuTro[index].ten = ten;
      danhSachKhuTro[index].diaChi = diaChi;
      editingIndex = -1;
    });
  }

  void xoaKhuTro(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Xác nhận xóa'),
          content: const Text('Bạn có chắc chắn muốn xóa khu trọ này?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Hủy'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Xóa'),
              onPressed: () {
                setState(() {
                  danhSachKhuTro.removeAt(index);
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Danh Sách Khu Trọ',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: const Color(0xFF6FC9E5),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: danhSachKhuTro.length,
        itemBuilder: (context, index) {
          KhuTro khuTro = danhSachKhuTro[index];
          bool isEditing = editingIndex == index;
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DSPhongTro(),
                ),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 2,
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              color: Colors.white,
              child: ListTile(
                leading: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black, // Border color
                      width: 2, // Border width
                    ),
                    borderRadius: BorderRadius.circular(5), // Border radius
                  ),
                  child: const Icon(
                    Icons.home,
                    color: Colors.blue,
                  ),
                ),
                title: isEditing
                    ? TextField(
                        controller: TextEditingController(text: khuTro.ten),
                        onChanged: (value) {
                          danhSachKhuTro[index].ten = value;
                        },
                      )
                    : Text(
                        khuTro.ten,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    isEditing
                        ? TextField(
                            controller:
                                TextEditingController(text: khuTro.diaChi),
                            onChanged: (value) {
                              danhSachKhuTro[index].diaChi = value;
                            },
                          )
                        : Text(
                            khuTro.diaChi,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                    const SizedBox(height: 5),
                    khuTro.soPhongTrong > 0
                        ? Text(
                            'Còn ${khuTro.soPhongTrong} phòng',
                            style: const TextStyle(
                              color: Colors.green,
                            ),
                          )
                        : const Text(
                            'Hết phòng',
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (isEditing)
                      IconButton(
                        icon: const Icon(Icons.check),
                        color: Colors.green,
                        onPressed: () {
                          capNhatKhuTro(index, khuTro.ten, khuTro.diaChi);
                        },
                      )
                    else
                      IconButton(
                        icon: const Icon(Icons.edit),
                        color: const Color(0xFF6FC9E5),
                        onPressed: () {
                          setState(() {
                            editingIndex = index;
                          });
                        },
                      ),
                    IconButton(
                      icon: const Icon(Icons.delete),
                      color: Colors.grey,
                      onPressed: () {
                        xoaKhuTro(index);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF6FC9E5),
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              TextEditingController tenController = TextEditingController();
              TextEditingController diaChiController = TextEditingController();
              TextEditingController soPhongController = TextEditingController();
              TextEditingController soPhongTrongController =
                  TextEditingController();
              return AlertDialog(
                title: const Text('Thêm khu trọ'),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: tenController,
                      decoration: const InputDecoration(
                        labelText: 'Tên khu trọ',
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      controller: diaChiController,
                      decoration: const InputDecoration(
                        labelText: 'Địa chỉ',
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      controller: soPhongController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Số phòng',
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      controller: soPhongTrongController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Số phòng trống',
                      ),
                    ),
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    child: const Text('Hủy'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('Thêm'),
                    onPressed: () {
                      String ten = tenController.text;
                      String diaChi = diaChiController.text;
                      int soPhong = int.tryParse(soPhongController.text) ?? 0;
                      int soPhongTrong =
                          int.tryParse(soPhongTrongController.text) ?? 0;
                      themKhuTro(ten, diaChi, soPhong, soPhongTrong);
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}

class KhuTro {
  String ten;
  String diaChi;
  int soPhong;
  int soPhongTrong;

  KhuTro({
    required this.ten,
    required this.diaChi,
    required this.soPhong,
    required this.soPhongTrong,
  });
}
