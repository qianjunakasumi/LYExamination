import 'package:flutter/material.dart';
import 'package:lyexamination/model/profile.dart';

class ProfileList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      List<Widget> v = [];

      for (ProfileModel p in profile.profileList) {
        v.add(
          OutlinedButton(
            onPressed: () => profile.addProfile(p),
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    bottomLeft: Radius.circular(32),
                  ),
                ),
              ),
            ),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () => profile.addProfile(p),
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.only(top: 24, bottom: 24),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(32),
                          bottomLeft: Radius.circular(32),
                        ),
                      ),
                    ),
                  ),
                  child: SizedBox(
                    width: 128,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text(p.name, textScaleFactor: 1.48)],
                    ),
                  ),
                ),
                SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(p.school),
                        SizedBox(width: 8),
                        Text('${p.grade}(${p.classNum})班'),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text('考号：${p.number}', textScaleFactor: 0.96),
                  ],
                ),
              ],
            ),
          ),
        );
        v.add(SizedBox(height: 12));
      }

      return Column(children: v);
    });
  }
}
