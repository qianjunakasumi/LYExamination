import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final avatar = 'https://avatars.githubusercontent.com/u/53565118';

  static const List<String> pageTitles = ['速览', '试卷', '错题', '我的'];

  String examinationName = '龙岩市第一中学2020-2021高一上学期期中质量检测';
  static int pageIndex = 0;
  static String pageTitle = pageTitles[0];

  void switchPages(int i) {
    if (i == pageIndex) {
      return;
    }

    setState(() {
      pageIndex = i;
      pageTitle = pageTitles[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              padding: EdgeInsets.only(top: 8, left: 16, right: 16),
              children: [
                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 16),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '2021年5月31日',
                                textScaleFactor: 0.88,
                              ),
                              Icon(Icons.keyboard_arrow_right_rounded),
                            ],
                          ),
                          Divider(),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              examinationName,
                              textScaleFactor: 1.4,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        pageTitle,
                        textScaleFactor: 2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.12),
                      offset: Offset(0, 3),
                      blurRadius: 6,
                      spreadRadius: -4,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  child: BottomNavigationBar(
                    onTap: switchPages,
                    currentIndex: pageIndex,
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: Colors.white,
                    selectedItemColor: Colors.black87,
                    unselectedItemColor: Colors.grey,
                    showUnselectedLabels: false,
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.dashboard_rounded),
                        label: pageTitles[0],
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.article_rounded),
                        label: pageTitles[1],
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.assistant_photo_rounded),
                        label: pageTitles[2],
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.account_circle_rounded),
                        label: pageTitles[3],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
