import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:fraction/provider/brain.provider.dart';
import 'package:provider/provider.dart';

class DisplayComponent extends StatefulWidget {
  const DisplayComponent({Key? key}) : super(key: key);

  @override
  _DisplayComponentState createState() => _DisplayComponentState();
}

class _DisplayComponentState extends State<DisplayComponent> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BrainProvider>(
      builder: (context, value, _) {
        return Container(
          width: double.infinity,
          margin: EdgeInsets.all(8),
          child: AutoSizeText(
            value.display,
            style: TextStyle(
              color: Colors.black,
              fontSize: 64,
            ),
            textAlign: TextAlign.right,
            maxLines: 2,
          ),
        );
      },
    );
  }
}
