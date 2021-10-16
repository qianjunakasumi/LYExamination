import 'package:flutter/material.dart';
import 'package:lyexamination/pages/_components/title.dart';
import 'package:lyexamination/pages/exam/list/info.dart';

class ExamListPage extends StatefulWidget {
  @override
  _ExamListPageState createState() => _ExamListPageState();
}

class _ExamListPageState extends State<ExamListPage> {
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
