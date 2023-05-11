import 'package:flutter/material.dart';
import 'package:machine_test_login/screens/auth%20screen/phone_screen.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xff003049),
      title: const Text('Top Movies (IMDB)'),
      actions: [
        InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Signout'),
                      content:
                          const Text('Do you want to signout from the app?'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'cancel',
                              style: TextStyle(fontSize: 18),
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);

                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const PhoneNumberScreen()),
                                  (route) => false);
                            },
                            child: const Text(
                              'signout',
                              style: TextStyle(fontSize: 18, color: Colors.red),
                            ))
                      ],
                    );
                  });
            },
            child: const Icon(Icons.info_outline)),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }
}
