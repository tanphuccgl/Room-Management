import 'package:app_qlphongtro_sv/feature/profile/logic/profile_bloc.dart';
import 'package:app_qlphongtro_sv/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
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
                  XInput(
                    value: state.totalGroup,
                    keyboardType: TextInputType.number,
                    hintText: 'Tổng Khu Trọ',
                    onChanged: (value) =>
                        context.read<ProfileBloc>().onChangedGroup(value),
                  ),
                  XInput(
                    value: state.totalRoom,
                    keyboardType: TextInputType.number,
                    hintText: 'Tổng Phòng Trọ',
                    onChanged: (value) =>
                        context.read<ProfileBloc>().onChangedRoom(value),
                  ),
                  XInput(
                    value: state.totalRoomFull,
                    keyboardType: TextInputType.number,
                    hintText: 'Tổng Phòng Trọ Đã Được Thuê',
                    onChanged: (value) =>
                        context.read<ProfileBloc>().onChangedRoomFull(value),
                  ),
                  ListTile(
                    leading: const Icon(Icons.home),
                    title: const Text('Tổng số khu trọ hiện có'),
                    subtitle: Text(state.totalGroup.toString()),
                  ),
                  ListTile(
                    leading: const Icon(Icons.apartment),
                    title: const Text('Tổng số phòng trọ hiện có'),
                    subtitle: Text(state.totalRoom.toString()),
                  ),
                  ListTile(
                    leading: const Icon(Icons.check),
                    title: const Text('Tổng số phòng trọ đã được thuê'),
                    subtitle: Text(state.totalRoomFull.toString()),
                  ),
                  ElevatedButton(
                    onPressed: () =>
                        context.read<ProfileBloc>().onSave(context),
                    child: const Text('Save'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
