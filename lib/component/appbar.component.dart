import 'package:flutter/material.dart';

import 'dialog.component.dart';

class AppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  const AppBarComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      shadowColor: Colors.transparent,
      title: Text(
        'Fraction',
        style: TextStyle(color: Colors.grey),
      ),
      centerTitle: true,
      actions: [
        InkWell(
          onTap: () => showDialog(
            context: context,
            builder: (c) => DialogComponent(),
          ),
          child: const Icon(
            Icons.info_outline,
            size: 24,
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          width: 15,
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
