import 'package:app_qlphongtro_sv/feature/group/group_bloc.dart';
import 'package:app_qlphongtro_sv/feature/phongtro/ds_phongtro.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListGroupPage extends StatelessWidget {
  const ListGroupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GroupBloc(),
      child: BlocBuilder<GroupBloc, GroupState>(
        builder: (context, state) {
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
              itemCount: state.listGroup.length,
              itemBuilder: (context, index) {
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
                    margin:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    color: Colors.white,
                    child: ListTile(
                      leading: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black, // Border color
                            width: 2, // Border width
                          ),
                          borderRadius:
                              BorderRadius.circular(5), // Border radius
                        ),
                        child: const Icon(
                          Icons.home,
                          color: Colors.blue,
                        ),
                      ),
                      title: Text(
                        state.listGroup[index].name ?? "",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state.listGroup[index].place ?? "",
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                          const SizedBox(height: 5),
                          (state.listGroup[index].numberEmpty ?? 0) > 0
                              ? Text(
                                  'Còn ${state.listGroup[index].numberEmpty} phòng',
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
                          IconButton(
                            icon: const Icon(Icons.edit),
                            color: const Color(0xFF6FC9E5),
                            onPressed: () {
                              context.read<GroupBloc>().onUpdateButton(
                                  context, state.listGroup[index]);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            color: Colors.grey,
                            onPressed: () {
                              context
                                  .read<GroupBloc>()
                                  .xoaKhuTro(context, state.listGroup[index]);
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
                context.read<GroupBloc>().onFloadingButton(context);
              },
            ),
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
