import 'package:flutter/material.dart';

class SubjectHeaderComponent extends StatelessWidget {
  final String name;

  const SubjectHeaderComponent(this.name, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      child: Center(
        child: Text(
          name,
          textScaleFactor: 1.08,
          style: TextStyle(
            color: Color(0xFF13C2C2),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
