import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAchievementPage extends StatelessWidget {
  const HomeAchievementPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 32),
          child: Column(
            children: [
              name,
              card,
            ],
          ),
        ),
      ],
    );
  }

  Widget get name => Container(
        margin: EdgeInsets.all(16),
        child: Text(
          '福建省龙岩市第114514中学2077届高四九八五(中)期中质量检测',
          style: Get.textTheme.headline5,
        ),
      );

  Widget get card => Container(
        margin: EdgeInsets.only(left: 16, right: 16),
        child: Row(
          children: [
            Expanded(
                child: Card(
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        children: [
                          Text('总分'),
                          Text('888'),
                        ],
                      ),
                    ))),
            Expanded(
                child: Card(
              child: Column(
                children: [
                  Text('总排名'),
                  Text('11'),
                ],
              ),
            )),
          ],
        ),
      );
}
