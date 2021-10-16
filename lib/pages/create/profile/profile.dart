import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lyexamination/apis/accounts/roles/get/get.dart';
import 'package:lyexamination/apis/accounts/roles/get/std.dart';
import 'package:lyexamination/hives/roles/roles.dart';
import 'package:lyexamination/hives/settings/settings.dart';
import 'package:lyexamination/messenger.dart';
import 'package:lyexamination/model/profile.dart';
import 'package:lyexamination/pages/_components/title.dart';
import 'package:lyexamination/pages/create/profile/list.dart';

class CreateProfilePage extends StatefulWidget {
  @override
  _CreateProfilePageState createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  List<ProfileModel> profiles = [];

  _CreateProfilePageState() {
    fetchProfiles();
  }

  void fetchProfiles() async {
    List<ProfileModel> p = [];

    final a = APIACCNTsRolesGet(APIACCNTsRolesGetReq());
    try {
      await a.wait();
      final ph = hiveSettingsGetCurrentAccount();
      a.rsp.roles.forEach((d) {
        p.add(ProfileModel(d.id, d.name, d.school, d.grade, d.c, phone: ph));
      });
    } catch (e) {
      Messenger.snackBar(e.toString(), feedback: true);
    }

    setState(() {
      profiles = p;
    });
  }

  void checked() {
    if (hiveRolesIsEmpty()) {
      Messenger.snackBar('您尚未选择档案');
      return;
    }

    Get.offAllNamed('/progress/login');
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        TitleComponent('选择档案'),
        Text('稍后您随时可以添加新档案', style: TextStyle(color: Colors.grey)),
        SizedBox(height: 32),
        ListComponent(profiles),
        SizedBox(height: 32),
        ElevatedButton(
          onPressed: checked,
          child: Text('选好啦'),
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            padding: MaterialStateProperty.all(
              EdgeInsets.only(top: 12, bottom: 12),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),
          ),
        ),
        SizedBox(height: 64),
      ],
    );
  }
}
