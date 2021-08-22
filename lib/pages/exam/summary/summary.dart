import 'package:flutter/material.dart';
import 'package:lyexamination/pages/exam/summary/actions.dart';
import 'package:lyexamination/pages/exam/summary/header.dart';
import 'package:lyexamination/pages/exam/summary/subject.dart';

class ExamSummaryPage extends StatelessWidget {
  const ExamSummaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        SizedBox(height: 32),
        Text(
          '考试摘要',
          style: TextStyle(color: Colors.black38),
          textScaleFactor: 0.8,
        ),
        SizedBox(height: 8),
        Text(
          '我是本次 2021~2022 考试名名称我是本次考试名称我是',
          style: TextStyle(color: Colors.black87),
          textScaleFactor: 1.48,
        ),
        SizedBox(height: 16),
        Divider(),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '总分  750',
              style: TextStyle(color: Colors.black87),
              textScaleFactor: 1.8,
            ),
            ActionsComponent(),
          ],
        ),
        SizedBox(height: 32),
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            TableRow(
              children: [
                HeaderComponent('考试科目'),
                HeaderComponent('你的分数'),
                HeaderComponent('平均分数'),
                HeaderComponent('最高分数'),
              ],
            ),
            SubjectScoreRow('语文', '120', '90', '150').to(),
            SubjectScoreRow('数学', '120', '90', '150').to(),
            SubjectScoreRow('英语', '120', '90', '150').to(),
            SubjectScoreRow('物理', '85', '60', '100').to(),
            SubjectScoreRow('生物', '80', '50', '100').to(),
            SubjectScoreRow('地理', '90', '60', '100').to(),
          ],
        ),
        SizedBox(height: 8),
        Divider(),
        Table(
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          children: [
            SubjectScoreRow('总分', '750', '660', '800').to(),
          ],
        ),
        SizedBox(height: 32),
        ElevatedButton(
          onPressed: () => print('即将到来'),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black87),
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
          child: Text('查看详情'),
        ),
        SizedBox(height: 64),
      ],
    );
  }
}
