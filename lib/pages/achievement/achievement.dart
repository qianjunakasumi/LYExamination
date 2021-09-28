import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lyexamination/apis/achievements/get/std.dart';
import 'package:lyexamination/pages/achievement/card.dart';
import 'package:lyexamination/pages/achievement/controller.dart';
import 'package:lyexamination/pages/achievement/std.dart';
import 'package:lyexamination/pages/exam/summary/actions.dart';

class AchievementPage extends StatelessWidget {
  const AchievementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final APIAchievementsGetREData d = Get.arguments!;

    final ACHVPController c = Get.put(ACHVPController(d.id, d.name, d.date));

    c.loadAchievement();

    final fixed = Colors.white.withOpacity(0.85);
    TextStyle headline3 = Get.textTheme.headline3!.copyWith(color: fixed);
    TextStyle headline6 = Get.textTheme.headline6!.copyWith(color: fixed);

    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        SizedBox(height: 64),
        Text(d.name, style: Get.theme.textTheme.headline3),
        SizedBox(height: 48),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(() => Text('总分  ${c.points}', style: Get.textTheme.headline4)),
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
                  color: Get.theme.primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('平\n均', style: headline6),
                    Obx(() => Text(c.averagePoints.string, style: headline3)),
                  ],
                ),
              ),
            ),
            SizedBox(width: 6),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Get.theme.primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('最\n高', style: headline6),
                    Obx(() => Text(c.mostPoints.string, style: headline3)),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 32),
        Text('学科', style: Get.theme.textTheme.headline5),
        SizedBox(height: 24),
        Obx(() => Column(
              children: [
                for (Rx<ACHVPSubjectCardData> d in c.subjectsPoints.values)
                  ACHVPSubjectCardComponent(d),
              ],
            )),
        SizedBox(height: 24),
      ],
    );
  }
}
