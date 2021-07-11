import 'package:flutter/material.dart';

class TitleComponent extends StatelessWidget {
  final String title;

  const TitleComponent(this.title);

  @override
  Widget build(_) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 64),
        Text(
          title,
          textScaleFactor: 2.16,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 24),
        Divider(),
        SizedBox(height: 24),
      ],
    );
  }
}
