import 'package:flutter/material.dart';

class AppBarComponent extends AppBar {
  AppBarComponent({Key? key})
      : super(
          key: key,
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          title: Text(
            'Fraction',
            style: TextStyle(color: Colors.grey),
          ),
          centerTitle: true,
          actionsIconTheme: IconThemeData(color: Colors.grey),
          actions: [
            PopupMenuButton<String>(
              color: Colors.white,
              itemBuilder: (context) => [
                PopupMenuItem<String>(
                  value: 'about',
                  child: Row(
                    children: [
                      Icon(
                        Icons.info,
                        color: Colors.grey,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'About',
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        );
}
