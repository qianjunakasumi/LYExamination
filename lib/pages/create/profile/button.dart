import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lyexamination/model/profile.dart';
import 'package:lyexamination/service/hive.dart';

class ButtonComponent extends StatefulWidget {
  final ProfileModel p;

  ButtonComponent(this.p);

  @override
  _ButtonComponentState createState() => _ButtonComponentState(p);
}

class _ButtonComponentState extends State<ButtonComponent> {
  final ProfileModel p;

  _ButtonComponentState(this.p);

  final HiveService h = Get.find(tag: 'hive');

  bool isPressed = false;

  void check() {
    h.fileProfile(p);
    setState(() {
      isPressed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isPressed) {
      return ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
        ),
        onPressed: null,
        child: Text('已选择'),
      );
    }

    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
      ),
      onPressed: check,
      child: Text('选择'),
    );
  }
}
