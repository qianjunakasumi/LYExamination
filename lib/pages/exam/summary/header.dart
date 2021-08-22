import 'package:flutter/material.dart';

class HeaderComponent extends StatelessWidget {
  final String name;

  const HeaderComponent(this.name, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Center(
        child: Text(name),
      ),
    );
  }
}
