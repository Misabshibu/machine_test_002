import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:machine_test_login/screens/auth%20screen/phone_screen.dart';
import 'package:machine_test_login/screens/auth%20screen/widgets/auth_button.dart';
import 'package:machine_test_login/screens/auth%20screen/widgets/auth_details.dart';
import 'package:machine_test_login/screens/home%20screen/home_screen.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});
  static FirebaseAuth auth = FirebaseAuth.instance;
  static String otpCode = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              AuthDetails(
                  size: size,
                  imageurl: 'assets/images/otpScreen.png',
                  headText: 'Verification Code',
                  messageText: 'please enter code sent to your number'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                    onChanged: (value) {
                      otpCode = value;
                    },
                    decoration: const InputDecoration(
                      hintText: 'Enter otp here',
                    ),
                    keyboardType: TextInputType.number),
              ),
              SizedBox(height: size.height * 0.04),
              AuthButton(
                size: size,
                buttonText: 'Verify',
                onclickFunction: () async {
                  try {
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                            verificationId: PhoneNumberScreen.verify,
                            smsCode: otpCode);

                    await auth.signInWithCredential(credential);
                    log('veryfied phonr');

                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()),
                        (route) => false);
                  } catch (e) {
                    log('wrong Otp');
                  }
                },
              ),
              SizedBox(height: size.height * 0.02),
              InkWell(
                onTap: () async {
                  await FirebaseAuth.instance.verifyPhoneNumber(
                    phoneNumber: PhoneNumberScreen.phoneNumber,
                    verificationCompleted: (PhoneAuthCredential credential) {},
                    verificationFailed: (FirebaseAuthException e) {},
                    codeSent: (String verificationId, int? resendToken) {
                      PhoneNumberScreen.verify = verificationId;
                    },
                    codeAutoRetrievalTimeout: (String verificationId) {},
                  );
                },
                child: const Text(
                  'Resent Otp',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
