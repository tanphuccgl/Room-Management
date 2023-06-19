import 'package:app_qlphongtro_sv/onboarding/login_screen/login_screen.dart';
import 'package:app_qlphongtro_sv/onboarding/login_screen/otp_screen.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController email = TextEditingController();
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
          const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 350,
                    width: 400,
                    child: Image(
                        image:
                            AssetImage("assets/Backgrounds/forgotpassword.png"),
                        fit: BoxFit.cover),
                  ),
                ],
              )),
          const SizedBox(
            height: 60,
            child: Text(
              "         Forgot Password ? \nEnter your Email to get Code",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Card(
            child: Column(
              children: [
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.mail,
                    ),
                    suffixIcon: IconButton(
                        onPressed: () {
                          //   myauth.setConfig(
                          //       appEmail: "contact@hdevcoder.com",
                          //       appName: "Email OTP",
                          //       userEmail: email.text,
                          //       otpLength: 4,
                          //       otpType: OTPType.digitsOnly);
                          //   if (await myauth.sendOTP() == true) {
                          //     ScaffoldMessenger.of(context)
                          //         .showSnackBar(const SnackBar(
                          //       content: Text("OTP has been sent"),
                          //     ));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const OTPScreen()));
                          //   } else {
                          //     ScaffoldMessenger.of(context)
                          //         .showSnackBar(const SnackBar(
                          //       content: Text("Oops, OTP send failed"),
                          //     ));
                          //   }
                        },
                        icon: const Icon(
                          Icons.send_rounded,
                          color: Colors.teal,
                        )),
                    hintText: "Email Address",
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Remember Password ?",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()));
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
    );
  }
}
