import 'package:app_qlphongtro_sv/feature/forgot_password/logic/otp_bloc.dart';
import 'package:app_qlphongtro_sv/network/model/user.dart';

import 'package:app_qlphongtro_sv/widgets/input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OTPPage extends StatelessWidget {
  final WUser user;
  const OTPPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OTPBloc(),
      child: BlocBuilder<OTPBloc, OTPState>(
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
            body: Padding(
              padding: const EdgeInsets.all(15),
              child: ListView(shrinkWrap: true, children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/Backgrounds/otp.png',
                          height: 300,
                          width: 300,
                        ),
                        const Text(
                          "Enter Mary's PIN",
                          style: TextStyle(fontSize: 40),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 50,
                              height: 100,
                              child: XInput(
                                value: state.text1,
                                keyboardType: TextInputType.number,
                                onChanged: (value) => context
                                    .read<OTPBloc>()
                                    .onChangedText1(value),
                                hintText: "0",
                              ),
                            ),
                            SizedBox(
                              width: 50,
                              height: 100,
                              child: XInput(
                                value: state.text2,
                                keyboardType: TextInputType.number,
                                inputFormatters: const [],
                                onChanged: (value) => context
                                    .read<OTPBloc>()
                                    .onChangedText2(value),
                                hintText: "0",
                              ),
                            ),
                            SizedBox(
                              width: 50,
                              height: 100,
                              child: XInput(
                                value: state.text3,
                                keyboardType: TextInputType.number,
                                inputFormatters: const [],
                                onChanged: (value) => context
                                    .read<OTPBloc>()
                                    .onChangedText3(value),
                                hintText: "0",
                              ),
                            ),
                            SizedBox(
                              width: 50,
                              height: 100,
                              child: XInput(
                                value: state.text4,
                                keyboardType: TextInputType.number,
                                inputFormatters: const [],
                                onChanged: (value) => context
                                    .read<OTPBloc>()
                                    .onChangedText4(value),
                                hintText: "0",
                              ),
                            ),
                          ],
                        ),
                        const Text(
                          "Rider can't find a pin",
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          onPressed: () => context
                              .read<OTPBloc>()
                              .onConfirmButton(context, user),
                          child: const Text(
                            "Confirm",
                            style: TextStyle(fontSize: 20),
                          ),
                        )
                      ],
                    )),
              ]),
            ),
          );
        },
      ),
    );
  }
}
