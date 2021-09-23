import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lyexamination/pages/_components/title.dart';
import 'package:lyexamination/pages/exam/list/info.dart';
import 'package:lyexamination/service/hive.dart';

class ExamListPage extends StatefulWidget {
  @override
  _ExamListPageState createState() => _ExamListPageState();
}

class _ExamListPageState extends State<ExamListPage> {
  final HiveService h = Get.find(tag: 'hive');

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        TitleComponent('你的考试'),
        InfoComponent(),
      ],
    );
  }
}
