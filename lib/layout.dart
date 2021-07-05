import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper(this.child);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 24, right: 24),
          child: child,
        ),
      ),
    );
  }
}
