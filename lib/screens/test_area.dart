import 'dart:math';

import 'package:demo/paint/arc.dart';
import 'package:flutter/material.dart';

enum DrawArc { inner, middle, outer }

class TestArea extends StatefulWidget {
  const TestArea({super.key});

  @override
  State<TestArea> createState() => _TestAreaState();
}

class _TestAreaState extends State<TestArea> with TickerProviderStateMixin {
  late final AnimationController _animController;

  final _arcOneTween = Tween<double>(begin: pi / 12, end: pi / 2);
  final _arcTwoTween = Tween<double>(begin: pi / 10, end: pi);
  final _arcThreeTween = Tween<double>(begin: pi / 8, end: 3 * pi / 2);

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
      reverseDuration: const Duration(milliseconds: 1500),
    );

    _animController.forward();

    _animController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _animController,
            builder: (context, c) => Center(
              child: SizedBox(
                height: 100,
                width: 100,
                child: Stack(
                  children: [
                    CustomPaint(
                      painter: Arc(
                          endValue: _arcOneTween.animate(
                                CurvedAnimation(
                                    parent: _animController,
                                    curve: Curves.fastOutSlowIn),
                              ).value,
                          width: 30,
                          height: 30),
                      child: c,
                    ),
                    CustomPaint(
                      painter: Arc(
                          endValue: _arcTwoTween.animate(
                                CurvedAnimation(
                                    parent: _animController,
                                    curve: Curves.fastOutSlowIn),
                              ).value,
                          width: 40,
                          height: 40),
                      child: c,
                    ),
                    CustomPaint(
                      painter: Arc(
                          endValue: _arcThreeTween
                              .animate(
                                CurvedAnimation(
                                    parent: _animController,
                                    curve: Curves.fastOutSlowIn),
                              )
                              .value,
                          width: 50,
                          height: 50),
                      child: c,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}
