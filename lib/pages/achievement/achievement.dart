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
    final APIAchievementsGetRspEData d = Get.arguments!;

    final ACHVPController c = Get.put(ACHVPController(d.id, d.name, d.date));

    c.loadAchievement();

    return ListView(
      physics: BouncingScrollPhysics(),
      children: [
        SizedBox(height: 64),
        Text(
          d.name,
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
          textScaleFactor: 1.48,
        ),
        SizedBox(height: 16),
        Divider(),
        SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Obx(() => Text(
                  '总分  ${c.points}',
                  style: TextStyle(color: Colors.black87),
                  textScaleFactor: 1.8,
                )),
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
                    Obx(() => Text(
                          c.averagePoints.string,
                          textScaleFactor: 1.72,
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(width: 6),
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
                    Obx(() => Text(
                          c.mostPoints.string,
                          textScaleFactor: 1.72,
                          style: TextStyle(color: Colors.white),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 32),
        Text(
          '学科',
          textScaleFactor: 1.32,
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
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
