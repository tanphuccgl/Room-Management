import 'package:app_qlphongtro_sv/feature/forgot_password/logic/forgot_bloc.dart';
import 'package:app_qlphongtro_sv/feature/login/login_page.dart';
import 'package:app_qlphongtro_sv/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ForgotPasswordBloc(),
      child: BlocBuilder<ForgotPasswordBloc, ForgotPasswordState>(
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
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: ListView(shrinkWrap: true, children: [
                  const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 300,
                            width: 400,
                            child: Image(
                                image: AssetImage(
                                    "assets/Backgrounds/forgotpassword.png"),
                                fit: BoxFit.cover),
                          ),
                        ],
                      )),
                  const Center(
                    child: Text(
                      "         Forgot Password ? \nEnter your Email to get Code",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  XInput(
                    value: state.email,
                    onChanged: (value) => context
                        .read<ForgotPasswordBloc>()
                        .onChangedEmail(value),
                    hintText: "Email Address",
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: MaterialButton(
                          color: const Color(0xFF6FC9E5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          onPressed: () => context
                              .read<ForgotPasswordBloc>()
                              .onForgotButton(context),
                          child: const Padding(
                            padding: EdgeInsets.all(25.0),
                            child: Text(
                              "Forgot Password",
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
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Remember Password ?",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()));
                          },
                          child: const Text(
                            "  Login Now",
                            style: TextStyle(
                                color: Color(0xff35C2C1),
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ],
                    ),
                  )
                ]),
              ),
            ),
          );
        },
      ),
    );
  }
}
