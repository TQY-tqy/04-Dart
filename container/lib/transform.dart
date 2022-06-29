import 'package:flutter/material.dart';
import 'dart:math' as math;

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
      home: const TransformPage(title: '变换！'),
    );
  }
}

class TransformPage extends StatefulWidget {
  const TransformPage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<TransformPage> createState() => _MytransformPage();
}

class _MytransformPage extends State<TransformPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Row(
            children: <Widget>[
              Container(
                color: Colors.black,
                child: Transform(
                  alignment: Alignment.topRight, //相对于坐标系原点的对齐方式
                  transform: Matrix4.skewY(0.5), //沿Y轴倾斜0.5弧度
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    color: Colors.deepOrange,
                    child: const Text('Do you know George?'),
                  ),
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DecoratedBox(
                      decoration: const BoxDecoration(color: Colors.red),
                      child: Transform.rotate(
                        //旋转90度
                        angle: math.pi / 2,
                        child: const Text("He is a little pink pig!"),
                      )),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  DecoratedBox(
                      decoration: const BoxDecoration(color: Colors.red),
                      child: Transform.scale(
                          scale: 1.5, //放大到1.5倍
                          child: const Text("What does George like"))),
                ],
              ),
              Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    DecoratedBox(
                        decoration:
                            const BoxDecoration(color: Colors.lightGreen),
                        //默认原点为左上角，左移20像素，向上平移5像素
                        child: Transform.translate(
                          offset: const Offset(-20.0, -5.0),
                          child: const Text("He likes dinosaurs!"),
                        ))
                  ])
            ],
          ),
        ));
  }
}
