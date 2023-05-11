import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  const AuthButton({
    super.key,
    required this.size,
    required this.buttonText,
    required this.onclickFunction,
  });

  final Size size;
  final String buttonText;
  final Function() onclickFunction;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onclickFunction,
      child: Container(
        width: size.width * 0.85,
        height: size.height * 0.08,
        decoration: BoxDecoration(
          color: const Color(0xff219ebc),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
            child: Text(
          buttonText,
          style: const TextStyle(fontSize: 20),
        )),
      ),
    );
  }
}
