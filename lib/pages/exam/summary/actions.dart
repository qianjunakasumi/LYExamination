import 'package:flutter/material.dart';
import 'package:lyexamination/messenger.dart';

class ActionsComponent extends StatelessWidget {
  const ActionsComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        OutlinedButton(
          onPressed: () => Messenger.snackBar('即将到来'),
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.grey),
            overlayColor: MaterialStateProperty.all(Colors.grey[100]),
            padding: MaterialStateProperty.all(
              EdgeInsets.only(top: 4, left: 12, right: 12, bottom: 4),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          child: Column(
            children: [
              Icon(Icons.school, size: 18),
              Text('历场考试'),
            ],
          ),
        ),
        SizedBox(width: 8),
        OutlinedButton(
          onPressed: () => Messenger.snackBar('即将到来'),
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.grey),
            overlayColor: MaterialStateProperty.all(Colors.grey[100]),
            padding: MaterialStateProperty.all(EdgeInsets.all(4)),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          child: Column(
            children: [
              Icon(Icons.navigate_next_rounded, size: 18),
              Text('设置'),
            ],
          ),
        ),
      ],
    );
  }
}
