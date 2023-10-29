import 'package:flutter/material.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({Key? key}) : super(key: key);

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with TickerProviderStateMixin {
  late AnimationController _breathingController;
  late AnimationController _gradientController;
  late Animation<Alignment> _topAlignmentAnimation;
  late Animation<Alignment> _bottomAlignmentAnimation;
  late double _breathe;

  @override
  void initState() {
    super.initState();

    _breathingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    _breathingController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _breathingController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _breathingController.forward();
      }
    });

    _breathingController.addListener(() {
      setState(() {
        _breathe = _breathingController.value;
      });
    });

    _breathingController.forward();
    _breathe = _breathingController.value;

    _gradientController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    );
    _topAlignmentAnimation = TweenSequence<Alignment>([
      tweenSequenceItem(Alignment.bottomLeft, Alignment.topRight),
      tweenSequenceItem(Alignment.topRight, Alignment.bottomRight),
      tweenSequenceItem(Alignment.bottomRight, Alignment.bottomLeft),
      tweenSequenceItem(Alignment.bottomLeft, Alignment.topLeft),
    ]).animate(_gradientController);

    _bottomAlignmentAnimation = TweenSequence<Alignment>([
      tweenSequenceItem(Alignment.bottomRight, Alignment.bottomLeft),
      tweenSequenceItem(Alignment.bottomLeft, Alignment.topLeft),
      tweenSequenceItem(Alignment.topLeft, Alignment.topRight),
      tweenSequenceItem(Alignment.topRight, Alignment.bottomRight),
    ]).animate(_gradientController);

    _gradientController.repeat(reverse: true);
  }

  TweenSequenceItem<Alignment> tweenSequenceItem(
      Alignment begin, Alignment end) {
    return TweenSequenceItem(
        tween: Tween<Alignment>(
          begin: begin,
          end: end,
        ),
        weight: 1);
  }

  @override
  void dispose() {
    _breathingController.dispose();
    _gradientController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = 400.0 - 100.0 * _breathe;
    final width = 200.0 - 100.0 * _breathe;

    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: AnimatedBuilder(
              animation: _gradientController,
              builder: (context, _) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: const [Colors.green, Colors.black],
                      begin: _topAlignmentAnimation.value,
                      end: _bottomAlignmentAnimation.value,
                    ),
                  ),
                );
              },
              child: Container(
                decoration: const BoxDecoration(gradient: gradientBackground),
              ),
            ),
          ),
          breathingAnimation(height * 1.2, width, gradientWithOpacity(),
              -height / 2, -height / 2),
          breathingAnimation(height * 1, width, gradientWithOpacity(),
              -height / 2, -height / 10),
          breathingAnimation(height * 1, width, gradientWithOpacity(),
              -height / 16, -height / 2),
          breathingAnimation(height * 1, width, gradientWithOpacity(),
              width / 0.2, -width * 2),
          breathingAnimation(height * 1, width, gradientWithOpacity(),
              height / 0.7, -height / 1.5),
          breathingAnimation(height * 1, width, gradientWithOpacity(),
              height / 0.45, -height / 0.75),
          breathingAnimation(height * 1, width, gradientWithOpacity(),
              height / 0.5, -width / 0.6),
        ],
      ),
    );
  }

  Color gradientWithOpacity() => Colors.green.withOpacity(0.4);

  Positioned breathingAnimation(
    double elementSize,
    double width,
    Color color,
    double top,
    double right,
  ) {
    return Positioned(
      top: top,
      right: right,
      child: Container(
        height: elementSize,
        width: elementSize,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    colors: [color, Colors.transparent],
                    stops: const [0.0, 1.0],
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

const gradientBackground = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    colors: [Colors.green, Colors.black]);
