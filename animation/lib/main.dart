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
      home: const HomeContent(),
    );
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Hero'),
      ),
      body:
          const HeroAnimationRouteA(), //想切换动画效果时，只需将HeroAnimationRouteB替换AnimatedSwitcherCounterRoute即可
    );
  }
}

/// Hero动画
class HeroAnimationRouteA extends StatelessWidget {
  const HeroAnimationRouteA({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            InkWell(
              child: Hero(
                tag: 'avatar', //唯一标记，前后两个路由页Hero的tag必须相同
                //裁剪成圆形
                child: ClipOval(
                  child: Image.asset(
                    "images/ADHX.jpg",
                    width: 100,
                    height: 100,
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(context, PageRouteBuilder(
                  pageBuilder:
                      (BuildContext context, animation, secondaryAnimation) {
                    return FadeTransition(
                      opacity: animation,
                      child: Scaffold(
                        appBar: AppBar(
                          title: const Text('爱德华薛'),
                        ),
                        body: const HeroAnimationRouteB(),
                      ),
                    );
                  },
                ));
              },
            ),
            const Padding(
              padding: EdgeInsets.only(top: 150.0),
              child: Text('点击头像',
                  style: TextStyle(
                    fontFamily: 'hyzzsdx',
                    fontSize: 50,
                  )),
            ),
          ],
        ));
  }
}

class HeroAnimationRouteB extends StatelessWidget {
  const HeroAnimationRouteB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: "avatar", //唯一标记，前后两个路由页Hero的tag必须相同
        child: Image.asset(
          "images/ADHX.jpg",
        ),
      ),
    );
  }
}
