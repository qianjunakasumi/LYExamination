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

  final examinationName = '龙岩市第一中学高一上学期期中质量检测';

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        elevation: 1,
        leading: Transform.rotate(
          // https://api.dart.dev/stable/2.12.2/dart-math/pi-constant.html
          angle: 3.1415926535897932 / 2,
          child: IconButton(
            padding: EdgeInsets.zero,
            tooltip: '考试',
            onPressed: () => {print('你点击了 Menu')},
            icon: Icon(
              Icons.bar_chart_rounded,
              size: 32,
              color: Colors.black87,
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            ListView(
              children: [
                Container(
                  margin: EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            examinationName,
                            textScaleFactor: 1.8,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.all(16),
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
                    backgroundColor: Color.fromRGBO(255, 255, 255, 0.92),
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.dashboard_rounded),
                        label: '速览',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.article_rounded),
                        label: '试卷',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.assistant_photo_rounded),
                        label: '错题',
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
