import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lyexamination/messenger.dart';
import 'package:lyexamination/service/hive.dart';

class InfoComponent extends StatelessWidget {
  final HiveService h = Get.find(tag: 'hive');

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
