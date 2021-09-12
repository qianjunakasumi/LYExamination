import 'package:flutter/material.dart';
import 'package:lyexamination/model/exam_summary.dart';
import 'package:lyexamination/pages/exam/summary/header.dart';
import 'package:lyexamination/pages/exam/summary/result.dart';

class SubjectTableComponent extends StatelessWidget {
  final List<ExamSubjectResult> data;

  const SubjectTableComponent(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
          children: [
            SubjectHeaderComponent('考试科目'),
            SubjectHeaderComponent('你的分数'),
            SubjectHeaderComponent('平均分数'),
            SubjectHeaderComponent('最高分数'),
          ],
        ),
        for (ExamSubjectResult r in data)
          TableRow(
            children: [
              Container(
                padding: EdgeInsets.only(top: 10, bottom: 10),
                margin: EdgeInsets.only(top: 4, bottom: 4),
                decoration: BoxDecoration(
                  color: Color(0xFF36CFC9),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    r.name,
                    style: TextStyle(color: Colors.white),
                    textScaleFactor: 1.24,
                  ),
                ),
              ),
              SubjectResultComponent(r.result),
              SubjectResultComponent(r.average),
              SubjectResultComponent(r.maximum),
            ],
          ),
      ],
    );
  }
}
