import 'package:flutter/material.dart';

class AuthDetails extends StatelessWidget {
  const AuthDetails({
    super.key,
    required this.size,
    required this.imageurl,
    required this.headText,
    required this.messageText,
  });

  final Size size;
  final String imageurl;
  final String headText;
  final String messageText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: size.width,
        height: size.height * 0.6,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.4,
              width: double.infinity,
              child: Image.asset(
                imageurl,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: size.height * 0.04),
            Text(
              headText,
              style: const TextStyle(
                  color: Color(0xff023047),
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  fontStyle: FontStyle.italic),
            ),
            SizedBox(height: size.height * 0.02),
            SizedBox(
              width: size.width * 0.6,
              child: Text(
                messageText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade500,
                ),
              ),
            ),
          ],
        ));
  }
}
