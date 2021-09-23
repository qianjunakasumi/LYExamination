import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lyexamination/apis/accounts/roles/switch/std.dart';
import 'package:lyexamination/apis/accounts/roles/switch/switch.dart';
import 'package:lyexamination/messenger.dart';
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

  void add() async {
    setState(() {
      isPressed = true;
    });

    final b = h.isProfilesEmpty();

    try {
      final key = await h.fileProfile(p);
      if (b) {
        h.setDefaultProfile(key);
        Messenger.snackBar('已设为默认档案。如需修改请稍后转到设置');
        await APIACCNTsRolesSwitch(APIACCNTsRolesSwitchReq(p.number, p.name))
            .wait();
      }
    } catch (e) {
      Messenger.snackBar(e.toString(), feedback: true);
    }
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
      onPressed: add,
      child: Text('选择'),
    );
  }
}
