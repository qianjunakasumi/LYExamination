import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lyexamination/messenger.dart';
import 'package:lyexamination/pages/achievement/std.dart';

class ACHVPSubjectCardComponent extends StatelessWidget {
  final Rx<ACHVPSubjectCardData> d;

  ACHVPSubjectCardComponent(this.d, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fixed = Colors.white.withOpacity(0.85);
    TextStyle headline2 = Get.textTheme.headline2!.copyWith(color: fixed);
    TextStyle headline3 = Get.textTheme.headline3!.copyWith(color: fixed);
    TextStyle headline6 = Get.textTheme.headline6!
        .copyWith(color: fixed, fontWeight: FontWeight.bold);

    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Get.theme.primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(d.value.name, style: headline3),
              ElevatedButton(
                  onPressed: () => Messenger.snackBar('在写了在写了'),
                  style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(
                        TextStyle(fontWeight: FontWeight.bold)),
                    foregroundColor:
                        MaterialStateProperty.all(Color(0xFF36CFC9)),
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    elevation: MaterialStateProperty.all(0),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.only(top: 8, left: 16, right: 16, bottom: 8),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(32),
                      ),
                    ),
                  ),
                  child: Text('查看详情')),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Obx(() => Text(d.value.points, style: headline2)),
                  Text(
                    '分',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                    textScaleFactor: 0.88,
                  ),
                ],
              ),
              Row(
                children: [
                  Obx(() => Text(
                        d.value.rankingZone,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                        textScaleFactor: 0.88,
                      )),
                  Obx(() => Text(d.value.ranking, style: headline2)),
                  Text(
                    '名',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                    textScaleFactor: 0.88,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Obx(() => Text(
                        d.value.averageZone + '\n平均',
                        style: headline6,
                        textScaleFactor: 0.88,
                      )),
                  SizedBox(width: 12),
                  Obx(() => Text(d.value.averagePoints, style: headline6)),
                ],
              ),
              Row(
                children: [
                  Obx(() => Text(
                        d.value.mostZone + '\n最高',
                        style: headline6,
                        textScaleFactor: 0.88,
                      )),
                  SizedBox(width: 12),
                  Obx(() => Text(d.value.mostPoints, style: headline6)),
                ],
              ),
              Row(
                children: [
                  Text(
                    '班级\n名次',
                    style: headline6,
                    textScaleFactor: 0.88,
                  ),
                  SizedBox(width: 12),
                  Obx(() => Text(d.value.classRanking, style: headline6)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
