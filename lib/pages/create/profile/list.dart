import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:lyexamination/model/profile.dart';
import 'package:lyexamination/pages/create/profile/button.dart';

class ListComponent extends StatelessWidget {
  final List<ProfileModel> profiles;

  ListComponent(this.profiles);

  @override
  Widget build(BuildContext context) {
    List<Widget> v = [];
    profiles.forEach((p) {
      v.add(
        DottedBorder(
          borderType: BorderType.RRect,
          dashPattern: [5, 5],
          radius: Radius.circular(8),
          padding: EdgeInsets.all(16),
          color: Colors.grey[300]!,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(p.name, textScaleFactor: 2),
                  ButtonComponent(p),
                ],
              ),
              SizedBox(height: 8),
              Divider(),
              SizedBox(height: 8),
              Text('考号：${p.number}'),
              Text('学校：${p.school}'),
              Text('年段：${p.grade}'),
              Text('班级：${p.classNum}'),
            ],
          ),
        ),
      );

      v.add(SizedBox(height: 24));
    });

    return Column(children: v);
  }
}
