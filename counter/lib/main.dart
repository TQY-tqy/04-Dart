import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeContent(title: 'Super Counter'),
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<HomeContent> createState() => HeroAnimationRouteA();
}

/// Hero动画
class HeroAnimationRouteA extends State<HomeContent> {
  int _counter = 0;
  int num = 0;
  String _path = "images/PZX.jpg";

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _clearCounter() {
    setState(() {
      _counter = 0;
    });
  }

  void _changeImage() {
    setState(() {
      num++;
      if (num % 4 == 0) {
        _path = "images/PZX.jpg";
      }
      if (num % 4 == 1) {
        _path = "images/SWL.jpg";
      }
      if (num % 4 == 2) {
        _path = "images/GTL.jpg";
      }
      if (num % 4 == 3) {
        _path = "images/LQX.jpg";
      }
    });
  }

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
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: InkWell(
                child: Hero(
                  tag: 'avatar', //唯一标记，前后两个路由页Hero的tag必须相同
                  //裁剪成圆形
                  child: ClipOval(
                    child: Image.asset(
                      "$_path",
                      width: 200,
                      height: 200,
                    ),
                  ),
                ),
                onTap: () {
                  if (num % 4 == 0) {
                    Navigator.push(context, PageRouteBuilder(
                      pageBuilder: (BuildContext context, animation,
                          secondaryAnimation) {
                        return FadeTransition(
                          opacity: animation,
                          child: Scaffold(
                            appBar: AppBar(
                              title: const Text('裴珠泫'),
                            ),
                            body: const HeroAnimationRouteB(),
                          ),
                        );
                      },
                    ));
                  }
                  if (num % 4 == 1) {
                    Navigator.push(context, PageRouteBuilder(
                      pageBuilder: (BuildContext context, animation,
                          secondaryAnimation) {
                        return FadeTransition(
                          opacity: animation,
                          child: Scaffold(
                            appBar: AppBar(
                              title: const Text('宋威龙'),
                            ),
                            body: const HeroAnimationRouteC(),
                          ),
                        );
                      },
                    ));
                  }
                  if (num % 4 == 2) {
                    Navigator.push(context, PageRouteBuilder(
                      pageBuilder: (BuildContext context, animation,
                          secondaryAnimation) {
                        return FadeTransition(
                          opacity: animation,
                          child: Scaffold(
                            appBar: AppBar(
                              title: const Text('古天乐'),
                            ),
                            body: const HeroAnimationRouteD(),
                          ),
                        );
                      },
                    ));
                  }
                  if (num % 4 == 3) {
                    Navigator.push(context, PageRouteBuilder(
                      pageBuilder: (BuildContext context, animation,
                          secondaryAnimation) {
                        return FadeTransition(
                          opacity: animation,
                          child: Scaffold(
                            appBar: AppBar(
                              title: const Text('林青霞'),
                            ),
                            body: const HeroAnimationRouteE(),
                          ),
                        );
                      },
                    ));
                  }
                },
              ),
            ),
            Column(
              children: [
                const Text(
                  'You have supported us for many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: ElevatedButton(
                    onPressed: _clearCounter,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    child: const Text(
                      "清零",
                      style: TextStyle(
                        fontFamily: "hyzzsdx",
                      ),
                      textScaleFactor: 1.5,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, left: 20.0),
                  child: ElevatedButton(
                    onPressed: _changeImage,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(100, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    child: const Text(
                      "更换图片",
                      style: TextStyle(
                        fontFamily: "hyzzzqpk",
                      ),
                      textScaleFactor: 1.5,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class HeroAnimationRouteB extends StatelessWidget {
  const HeroAnimationRouteB({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Hero(
        tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
        child: Image.asset(
          "images/PZX.jpg",
        ),
      ),
    ]);
  }
}

class HeroAnimationRouteC extends StatelessWidget {
  const HeroAnimationRouteC({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Hero(
        tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
        child: Image.asset(
          "images/SWL.jpg",
        ),
      ),
    ]);
  }
}

class HeroAnimationRouteD extends StatelessWidget {
  const HeroAnimationRouteD({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Hero(
        tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
        child: Image.asset(
          "images/GTL.jpg",
        ),
      ),
    ]);
  }
}

class HeroAnimationRouteE extends StatelessWidget {
  const HeroAnimationRouteE({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Hero(
        tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
        child: Image.asset(
          "images/LQX.jpg",
          width: 400,
          height: 400,
        ),
      ),
    ]);
  }
}
