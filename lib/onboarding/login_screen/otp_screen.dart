import 'package:app_qlphongtro_sv/onboarding/login_screen/new_password_screen.dart';
import 'package:flutter/material.dart';

class Otp extends StatelessWidget {
  const Otp({
    Key? key,
    required this.otpController,
  }) : super(key: key);
  final TextEditingController otpController;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 50,
      height: 50,
      child: TextFormField(
        controller: otpController,
        keyboardType: TextInputType.number,
        // ignore: deprecated_member_use
        style: Theme.of(context).textTheme.headline6,
        textAlign: TextAlign.center,
        inputFormatters: const [
          // LengthLimitingTextInputFormatter(1),
          // FilteringTextInputFormatter.digitsOnly
        ],
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
          if (value.isEmpty) {
            FocusScope.of(context).previousFocus();
          }
        },
        decoration: const InputDecoration(
          hintText: ('0'),
        ),
        onSaved: (value) {},
      ),
    );
  }
}

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  TextEditingController otp1Controller = TextEditingController();
  TextEditingController otp2Controller = TextEditingController();
  TextEditingController otp3Controller = TextEditingController();
  TextEditingController otp4Controller = TextEditingController();
  String otpController = "1234";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
                      Otp(
                        otpController: otp1Controller,
                      ),
                      Otp(
                        otpController: otp2Controller,
                      ),
                      Otp(
                        otpController: otp3Controller,
                      ),
                      Otp(
                        otpController: otp4Controller,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  const Text(
                    "Rider can't find a pin",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const NewPasswordScreen()));
                      // if (await widget.myauth.verifyOTP(otp: otp1Controller.text +
                      //         otp2Controller.text +
                      //         otp3Controller.text +
                      //         otp4Controller.text) == true) {
                      //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      //       content: Text("OTP is verified"),
                      //     ));
                      //     Navigator.push(context,
                      //         MaterialPageRoute(builder: (context) => const Home()));
                      //   } else {
                      //     ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      //       content: Text("Invalid OTP"),
                      //     ));
                      //   }
                    },
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
  }
}
