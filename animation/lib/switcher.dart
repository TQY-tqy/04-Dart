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
      home: const MSAnimatedSwitcherDemo2(title: 'AnimatedSwitcher'),
    );
  }
}

class MSAnimatedSwitcherDemo2 extends StatefulWidget {
  const MSAnimatedSwitcherDemo2({Key? key, required this.title})
      : super(key: key);
  final String title;
  @override
  State<MSAnimatedSwitcherDemo2> createState() =>
      _MSAnimatedSwitcherDemo2State();
}

class _MSAnimatedSwitcherDemo2State extends State<MSAnimatedSwitcherDemo2> {
  var _count = 0;
  @override
  Widget build(BuildContext context) {
    final _text = _count < 10 ? "0$_count" : "$_count";
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        alignment: Alignment.center,
        child: AnimatedSwitcher(
          child: Text(
            _text,
            textScaleFactor: 5.0,
            key: ValueKey(_text),
          ),
          transitionBuilder: (child, anim1) {
            var tween =
                Tween(begin: const Offset(1, 0), end: const Offset(0, 0));
            return MSSlideTransition(
                child: child, position: tween.animate(anim1));
          },
          duration: const Duration(milliseconds: 300), //持续时间
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            _count++;
          });
        },
      ),
    );
  }
}

//从右往左
class MSSlideTransition extends AnimatedWidget {
  const MSSlideTransition({
    required this.child,
    required Animation<Offset> position,
    this.transformHitTests = true,
  }) : super(listenable: position);

  final bool transformHitTests;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final position = listenable as Animation<Offset>;
    Offset offset = position.value;
    if (position.status == AnimationStatus.reverse) {
      offset = Offset(-offset.dx, offset.dy);
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}
