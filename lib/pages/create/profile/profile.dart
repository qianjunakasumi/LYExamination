import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lyexamination/messenger.dart';
import 'package:lyexamination/model/profile.dart';
import 'package:lyexamination/pages/create/_components/title.dart';
import 'package:lyexamination/pages/create/profile/list.dart';
import 'package:lyexamination/service/api.dart';
import 'package:lyexamination/service/hive.dart';

class CreateProfilePage extends StatefulWidget {
  @override
  _CreateProfilePageState createState() => _CreateProfilePageState();
}

class _CreateProfilePageState extends State<CreateProfilePage> {
  final APIService a = Get.find(tag: 'api');
  final HiveService h = Get.find(tag: 'hive');

  List<ProfileModel> profiles = [];

  _CreateProfilePageState() {
    fetchProfiles();
  }

  void fetchProfiles() async {
    late List<ProfileModel> p;

    try {
      p = await a.fetchProfiles();
    } on APIError catch (e) {
      Messenger.snackBar(e.message, feedback: e.feedback);
    } catch (e) {
      Messenger.snackBar(e.toString(), feedback: true);
    }

    setState(() {
      profiles = p;
    });
  }

  void checked() {
    if (h.isProfilesEmpty()) {
      Messenger.snackBar('您尚未选择档案');
      return;
    }

    Get.offAllNamed('/home');
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
