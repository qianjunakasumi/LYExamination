import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lyexamination/messenger.dart';
import 'package:lyexamination/pages/achievement/std.dart';

class ACHVPSubjectCardComponent extends StatelessWidget {
  final Rx<ACHVPSubjectCardData> d;

  ACHVPSubjectCardComponent(this.d, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Color(0xFF36CFC9),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                d.value.name,
                textScaleFactor: 1.64,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                  onPressed: () => Messenger.snackBar('先想好，我没时间写'),
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
                  Obx(() => Text(
                        d.value.points,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                        textScaleFactor: 3,
                      )),
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
                  Obx(() => Text(
                        d.value.ranking,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                        textScaleFactor: 3,
                      )),
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
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                        textScaleFactor: 0.88,
                      )),
                  SizedBox(width: 12),
                  Obx(() => Text(
                        d.value.averagePoints,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                ],
              ),
              Row(
                children: [
                  Obx(() => Text(
                        d.value.mostZone + '\n最高',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                        textScaleFactor: 0.88,
                      )),
                  SizedBox(width: 12),
                  Obx(() => Text(
                        d.value.mostPoints,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                ],
              ),
              Row(
                children: [
                  Text(
                    '班级\n名次',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                    textScaleFactor: 0.88,
                  ),
                  SizedBox(width: 12),
                  Obx(() => Text(
                        d.value.classRanking,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      )),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
