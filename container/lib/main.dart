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
      home: const ClipPage(title: '裁剪！'),
    );
  }
}

class ClipPage extends StatefulWidget {
  const ClipPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<ClipPage> createState() => _MyClipPage();
}

class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) => const Rect.fromLTWH(20.0, 15.0, 30.0, 30.0);

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => false;
}

class _MyClipPage extends State<ClipPage> {
  @override
  Widget build(BuildContext context) {
    // 头像
    Widget avatar = Image.asset("images/George.jpg", width: 60.0);
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              avatar, //不剪裁
              ClipOval(child: avatar), //剪裁为圆形
              ClipRRect(
                //剪裁为圆角矩形
                borderRadius: BorderRadius.circular(5.0),
                child: avatar,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topLeft,
                    widthFactor: .5, //宽度设为原来宽度一半，另一半会溢出
                    child: avatar,
                  ),
                  const Text(
                    "你好乔治",
                    style: TextStyle(color: Colors.green),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipRect(
                    //将溢出部分剪裁
                    child: Align(
                      alignment: Alignment.topLeft,
                      widthFactor: .5, //宽度设为原来宽度一半
                      child: avatar,
                    ),
                  ),
                  const Text("你好乔治", style: TextStyle(color: Colors.blue))
                ],
              ),
              DecoratedBox(
                decoration: const BoxDecoration(color: Colors.yellow),
                child: ClipRect(
                    clipper: MyClipper(), //使用自定义的clipper
                    child: avatar),
              )
            ],
          ),
        ));
  }
}
