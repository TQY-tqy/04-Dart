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
      home: const MyHomePage(title: 'TEXT'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
            Text(
              //文本的对齐方式；可以选择左对齐、右对齐还是居中。
              //对齐的参考系是Text widget 本身。
              "HELLO!我是唐庆勇" * 6,
              textAlign: TextAlign.center,
              // 指定最大行数
              maxLines: 3,
              // 截断多余的文本，默认采用直接截断
              overflow: TextOverflow.ellipsis,
              // 相对于当前字体大小的缩放因子
              textScaleFactor: 2.0,
            ),
            // style 用于指定文本显示的样式如颜色、字体、粗细、背景等
            const Text(
              "是一名计科系的学生",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "hyzzsdx", //定义字体1
                  fontSize: 20.0,
                  height: 1.2,
                  decorationStyle: TextDecorationStyle.dashed),
            ),
            // TextSpan 实现了一个Text 内容的不同部分按照不同的样式显示
            const Text.rich(TextSpan(children: [
              TextSpan(
                  text: "我喜欢的游戏有: ",
                  style: TextStyle(
                    color: Colors.blue,
                    fontFamily: "hyzzzqpk", //定义字体1
                    fontSize: 15.0,
                  )),
              TextSpan(
                text: "kingdomrush, pvz ,rocokingdom",
                style: TextStyle(
                  color: Colors.red,
                  fontFamily: "hyzzsdx", //定义字体1
                  fontSize: 15.0,
                ),
              ),
            ])),
            DefaultTextStyle(
              //1.设置文本默认样式
              style: const TextStyle(
                color: Colors.green,
                fontSize: 20.0,
              ),
              textAlign: TextAlign.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text("我有一定的强迫症"),
                  Text("做力所能及的事情会尽量追求完美"),
                  Text(
                    "很高兴认识你",
                    style: TextStyle(
                        inherit: false, //2.不继承默认样式
                        color: Colors.purple),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
