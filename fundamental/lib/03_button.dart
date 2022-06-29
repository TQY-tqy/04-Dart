import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyBottomPage(title: '按钮'),
    );
  }
}

class MyBottomPage extends StatefulWidget {
  const MyBottomPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyBottomPage> createState() => _MyButtomPageState();
}

class _MyButtomPageState extends State<MyBottomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "你支持“人之初，性本善”这一句话吗？",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "hyzzsdx", //定义字体1
                  fontSize: 20.0,
                  height: 1.2,
                  decorationStyle: TextDecorationStyle.dashed),
            ),
            ElevatedButton(
              child: const Text("支持"),
              onPressed: () {},
            ),
            TextButton(
              child: const Text("反对"),
              onPressed: () {},
            ),
            OutlineButton(
              child: const Text("弃权"),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.thumb_up),
              onPressed: () {},
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.send),
              label: const Text("发送"),
              onPressed: () {},
            ),
            OutlineButton.icon(
              icon: const Icon(Icons.add),
              label: const Text("添加"),
              onPressed: () {},
            ),
            TextButton.icon(
              icon: const Icon(Icons.info),
              label: const Text("详情"),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
