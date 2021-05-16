import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '龙岩考试',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final avatar = 'https://avatars.githubusercontent.com/u/53565118';

  final examinationName = '龙岩市第一中学2020-2021高一上学期期中质量检测';

  static const List<String> pageTitles = ['速览', '试卷', '错题', '我的'];

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
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
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
                      color: Color.fromRGBO(0, 0, 0, 0.08),
                      offset: Offset(0, -6),
                      blurRadius: 16,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                  child: BottomNavigationBar(
                    onTap: switchPages,
                    currentIndex: pageIndex,
                    type: BottomNavigationBarType.fixed,
                    backgroundColor: Color.fromRGBO(255, 255, 255, 0.88),
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
