import 'package:app_qlphongtro_sv/feature/forgot_password/logic/new_password_bloc.dart';
import 'package:app_qlphongtro_sv/network/model/user.dart';
import 'package:app_qlphongtro_sv/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewPasswordPage extends StatelessWidget {
  final WUser user;
  const NewPasswordPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewPasswordBloc(),
      child: BlocBuilder<NewPasswordBloc, NewPasswordState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              iconTheme: const IconThemeData(
                color: Colors.black,
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.9,
                          child: const Text(
                            "Tạo mật khẩu mới",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Text(
                          "Mật khẩu mới của bạn phải khác với những mật khẩu đã sử dụng trước đó.",
                          style: TextStyle(
                            color: Color(0xFF8391A1),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),

                      XInput(
                        value: state.pw,
                        hintText: 'New Password',
                        onChanged: (value) => context
                            .read<NewPasswordBloc>()
                            .onChangedPassword(value),
                      ),

                      XInput(
                        value: state.confirmPw,
                        hintText: 'Confirm password',
                        onChanged: (value) => context
                            .read<NewPasswordBloc>()
                            .onChangedConfirmPassword(value),
                      ),
                      const SizedBox(height: 40),
                      //register button
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: MaterialButton(
                                color: const Color(0xFF6FC9E5),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                onPressed: () {
                                  context
                                      .read<NewPasswordBloc>()
                                      .onResetPassword(context, user);
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Text(
                                    "Reset Password",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
