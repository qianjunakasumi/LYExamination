import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:lyexamination/hives/settings/settings.dart';
import 'package:lyexamination/messenger.dart';

class InfoComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final r = hiveSettingsGetCurrentRole();

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
              '${r.name}   ${r.grade}（${r.classNum}）班',
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
