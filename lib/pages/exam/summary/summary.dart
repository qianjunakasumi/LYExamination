import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lyexamination/apis/achievements/get/std.dart';
import 'package:lyexamination/messenger.dart';
import 'package:lyexamination/model/exam_summary.dart';
import 'package:lyexamination/pages/exam/summary/actions.dart';
import 'package:lyexamination/pages/exam/summary/table.dart';

class ExamSummaryPage extends StatelessWidget {
  const ExamSummaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ExamSummary data = Get.arguments!;

    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        SizedBox(height: 32),
        Text(
          '考试摘要',
          style: TextStyle(color: Colors.black38),
          textScaleFactor: 0.8,
        ),
        SizedBox(height: 6),
        Text(
          data.name,
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
          textScaleFactor: 1.48,
        ),
        SizedBox(height: 16),
        Divider(),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '总分  ${data.result}',
              style: TextStyle(color: Colors.black87),
              textScaleFactor: 1.8,
            ),
            ActionsComponent(),
          ],
        ),
        SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xFF36cfc9),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('平\n均', style: TextStyle(color: Colors.white)),
                    Text(data.average,
                        textScaleFactor: 1.72,
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Color(0xFF36cfc9),
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('最\n高', style: TextStyle(color: Colors.white)),
                    Text(data.maximum,
                        textScaleFactor: 1.72,
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 32),
        Text(
          '学科分数',
          textScaleFactor: 1.48,
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 24),
        SubjectTableComponent(data.subject),
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
        ElevatedButton(
          onPressed: () => Get.toNamed('/exam/list'),
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
          child: Text('测试，请勿使用'),
        ),
        SizedBox(height: 64),
      ],
    );
  }
}
