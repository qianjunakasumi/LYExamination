import 'package:flutter/material.dart';
import 'package:lyexamination/apis/accounts/roles/switch/std.dart';
import 'package:lyexamination/apis/accounts/roles/switch/switch.dart';
import 'package:lyexamination/hives/roles/roles.dart';
import 'package:lyexamination/hives/roles/std.dart';
import 'package:lyexamination/hives/settings/settings.dart';
import 'package:lyexamination/messenger.dart';
import 'package:lyexamination/model/profile.dart';

class ButtonComponent extends StatefulWidget {
  final ProfileModel p;

  ButtonComponent(this.p);

  @override
  _ButtonComponentState createState() => _ButtonComponentState(p);
}

class _ButtonComponentState extends State<ButtonComponent> {
  final ProfileModel p;

  _ButtonComponentState(this.p);

  bool isPressed = false;

  void add() async {
    setState(() {
      isPressed = true;
    });

    final b = hiveRolesIsEmpty();

    try {
      await hiveRolesAddA(
        p.number,
        HiveRole(
          id: p.number,
          name: p.name,
          school: p.school,
          grade: p.grade,
          classNum: p.classNum,
          phone: p.phone,
        ),
      );
      if (b) {
        hiveSettingsSetDefaultRole(p.number);
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
