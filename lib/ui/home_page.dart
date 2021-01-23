import 'package:custom_painter_demo/ui/my_painter.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  Animation<double> _path0Animation;
  Animation<double> _path1Animation;
  Animation<double> _path2Animation;
  Animation<double> _opacitynimation;

  @override
  void initState() {
    final _controller = AnimationController(
      duration: Duration(milliseconds: 3000),
      vsync: this,
    );
    final _controller1 = AnimationController(
      duration: Duration(milliseconds: 2000),
      vsync: this,
    );
    final _controller2 = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    );
    final _controller3 = AnimationController(
      duration: Duration(milliseconds: 1000),
      vsync: this,
    );
    _path0Animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) _controller1.forward();
      })
      ..addListener(() {
        setState(() {});
      });
    _path1Animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller1)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) _controller2.forward();
      })
      ..addListener(() {
        setState(() {});
      });
    _path2Animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller2)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) _controller3.forward();
      })
      ..addListener(() {
        setState(() {});
      });
    _opacitynimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller3)
      ..addListener(() {
        setState(() {});
      });
    _controller.forward();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              child: CustomPaint(
                size: Size(700,
                    800), //You can Replace this with your desired WIDTH and HEIGHT
                painter: RPSCustomPainter(
                  _path0Animation.value,
                  _path1Animation.value,
                  _path2Animation.value,
                ),
              ),
            ),
          ),
          Opacity(
            opacity: _opacitynimation.value,
            child: Center(
              child: Image.asset(
                'images/pngegg.png',
                height: 200,
                width: 180,
              ),
            ),
          )
        ],
      ),
    );
  }
}
