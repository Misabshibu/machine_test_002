import 'package:flutter/material.dart';
import 'package:machine_test_login/screens/auth%20screen/otp_screen.dart';
import 'package:machine_test_login/screens/auth%20screen/widgets/auth_button.dart';
import 'package:machine_test_login/screens/auth%20screen/widgets/auth_details.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:machine_test_login/screens/home%20screen/home_screen.dart';

class PhoneNumberScreen extends StatelessWidget {
  const PhoneNumberScreen({super.key});
  static String phoneNumber = '';
  static String verify = '';

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
                imageurl: 'assets/images/phoneScreen.png',
                headText: 'Verify Your Number',
                messageText:
                    'please enter your country code & your phone number'),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: IntlPhoneField(
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'IN',
                onChanged: (phone) {
                  print(phone.completeNumber);
                  phoneNumber = phone.completeNumber;
                },
              ),
            ),
            SizedBox(height: size.height * 0.04),
            AuthButton(
              size: size,
              buttonText: 'Send',
              onclickFunction: () async {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const OtpScreen()));
                await FirebaseAuth.instance.verifyPhoneNumber(
                  phoneNumber: phoneNumber,
                  verificationCompleted: (PhoneAuthCredential credential) {},
                  verificationFailed: (FirebaseAuthException e) {},
                  codeSent: (String verificationId, int? resendToken) {
                    verify = verificationId;
                  },
                  codeAutoRetrievalTimeout: (String verificationId) {},
                );
              },
            ),
            SizedBox(height: size.height * 0.02),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const HomeScreen()));
                },
                child: const Text('Skip'))
          ],
        ),
      ),
    ));
  }
}
