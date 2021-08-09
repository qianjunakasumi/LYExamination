import 'package:flutter/material.dart';
import 'package:lyexamination/messenger.dart';
import 'package:lyexamination/pages/_components/title.dart';

class ProgressErrorPage extends StatelessWidget {
  final String e;
  final StackTrace st;

  const ProgressErrorPage(this.e, this.st);

  @override
  Widget build(BuildContext context) {
    return MessengerWrapper(
      ListView(
        physics: BouncingScrollPhysics(),
        children: [
          TitleComponent('遇到错误'),
          Text('您可通过 “龙岩考试应用事务局” 反馈此问题。请检查以下记录：'),
          SizedBox(height: 24),
          Text('错误信息', textScaleFactor: 1.64),
          SizedBox(height: 12),
          Text(e),
          SizedBox(height: 24),
          Text('错误堆栈', textScaleFactor: 1.64),
          SizedBox(height: 12),
          Text(st.toString()),
        ],
      ),
    );
  }
}
