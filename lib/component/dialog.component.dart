import 'package:flutter/material.dart';

class DialogComponent extends StatelessWidget {
  const DialogComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      title: Text(
        "About",
        style: TextStyle(color: Colors.black),
      ),
      content: SingleChildScrollView(
        child: Wrap(
          children: [
            Text(
              "Thank you for using the fraction calculator developed by MandalarSoft. "
              "The fraction calculator is the easiest and simplest way to deal with the fraction world. "
              "Free to contact us for any problem related to the application. Since the application is the first release, "
              "be sure to double-check for safety.",
              style: TextStyle(color: Colors.black),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                "Instruction",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,
              ),
            ),
            Image(image: AssetImage('assets/tutorial.jpg')),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text(
                "Contact",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.right,
              ),
            ),
            Text(
              "mandalarsoft@gmail.com",
              style: TextStyle(color: Colors.black),
            ),
            Text(
              "www.mandalarsoft.com",
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Okay'),
          onPressed: () => Navigator.of(context).pop(),
        )
      ],
    );
  }
}
