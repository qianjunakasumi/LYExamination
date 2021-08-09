import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lyexamination/messenger.dart';
import 'package:lyexamination/pages/_components/title.dart';
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
        Row(
          children: [
            Expanded(
              child: DottedBorder(
                color: Colors.grey[300]!,
                borderType: BorderType.RRect,
                dashPattern: [5, 5],
                padding: EdgeInsets.all(18),
                radius: Radius.circular(8),
                child: Text(
                  '${h.getCurrentProfile().name}   ${h.getCurrentProfile().grade}（${h.getCurrentProfile().classNum}）班',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(width: 12),
            OutlinedButton(
              onPressed: () => Messenger.snackBar('即将到来'),
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.grey),
                padding: MaterialStateProperty.all(EdgeInsets.all(8)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              child: Column(
                children: [
                  Icon(Icons.navigate_next_rounded),
                  Text('设置'),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
