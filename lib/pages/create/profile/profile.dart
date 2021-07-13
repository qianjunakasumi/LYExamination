import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lyexamination/pages/create/_components/title.dart';
import 'package:lyexamination/pages/create/profile/list.dart';
import 'package:lyexamination/service/profile.dart';

class ProfilePage extends StatelessWidget {
  final ProfileService profile = Get.find();

  @override
  Widget build(BuildContext context) {
    profile.fetchProfileFromRemote();

    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        TitleComponent('选择档案'),
        Text('稍后您随时可以添加新档案', style: TextStyle(color: Colors.grey)),
        SizedBox(height: 24),
        ProfileList(),
      ],
    );
  }
}
