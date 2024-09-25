// Widget componentizado para o efeito Splash Ripple
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:midjourney_app/modules/midjourney/presentation/widgets/const_colors.dart';

class AnimatedLoader extends StatefulWidget {
  const AnimatedLoader({super.key});

  @override
  AnimatedLoaderState createState() => AnimatedLoaderState();
}

class AnimatedLoaderState extends State<AnimatedLoader> with TickerProviderStateMixin {
  late AnimationController firstRippleController;
  late AnimationController secondRippleController;
  late AnimationController thirdRippleController;
  late AnimationController centerCircleController;

  late Animation<double> firstRippleRadiusAnimation;
  late Animation<double> firstRippleOpacityAnimation;
  late Animation<double> firstRippleWidthAnimation;

  late Animation<double> secondRippleRadiusAnimation;
  late Animation<double> secondRippleOpacityAnimation;
  late Animation<double> secondRippleWidthAnimation;

  late Animation<double> thirdRippleRadiusAnimation;
  late Animation<double> thirdRippleOpacityAnimation;
  late Animation<double> thirdRippleWidthAnimation;

  late Animation<double> centerCircleRadiusAnimation;

  @override
  void initState() {
    super.initState();

    // Primeira animação
    firstRippleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    firstRippleRadiusAnimation = Tween<double>(begin: 0, end: 150).animate(
      CurvedAnimation(parent: firstRippleController, curve: Curves.ease),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          firstRippleController.repeat();
        } else if (status == AnimationStatus.dismissed) {
          firstRippleController.forward();
        }
      });

    firstRippleOpacityAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: firstRippleController, curve: Curves.ease),
    )..addListener(() {
        setState(() {});
      });

    firstRippleWidthAnimation = Tween<double>(begin: 10, end: 0).animate(
      CurvedAnimation(parent: firstRippleController, curve: Curves.ease),
    )..addListener(() {
        setState(() {});
      });

    // Segunda animação
    secondRippleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    secondRippleRadiusAnimation = Tween<double>(begin: 0, end: 150).animate(
      CurvedAnimation(parent: secondRippleController, curve: Curves.ease),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          secondRippleController.repeat();
        } else if (status == AnimationStatus.dismissed) {
          secondRippleController.forward();
        }
      });

    secondRippleOpacityAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: secondRippleController, curve: Curves.ease),
    )..addListener(() {
        setState(() {});
      });

    secondRippleWidthAnimation = Tween<double>(begin: 10, end: 0).animate(
      CurvedAnimation(parent: secondRippleController, curve: Curves.ease),
    )..addListener(() {
        setState(() {});
      });

    // Terceira animação
    thirdRippleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    thirdRippleRadiusAnimation = Tween<double>(begin: 0, end: 150).animate(
      CurvedAnimation(parent: thirdRippleController, curve: Curves.ease),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          thirdRippleController.repeat();
        } else if (status == AnimationStatus.dismissed) {
          thirdRippleController.forward();
        }
      });

    thirdRippleOpacityAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(parent: thirdRippleController, curve: Curves.ease),
    )..addListener(() {
        setState(() {});
      });

    thirdRippleWidthAnimation = Tween<double>(begin: 10, end: 0).animate(
      CurvedAnimation(parent: thirdRippleController, curve: Curves.ease),
    )..addListener(() {
        setState(() {});
      });

    // Animação do círculo central
    centerCircleController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );

    centerCircleRadiusAnimation = Tween<double>(begin: 35, end: 50).animate(
      CurvedAnimation(parent: centerCircleController, curve: Curves.fastOutSlowIn),
    )
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          centerCircleController.reverse();
        } else if (status == AnimationStatus.dismissed) {
          centerCircleController.forward();
        }
      });

    // Inicia as animações
    firstRippleController.forward();
    Timer(const Duration(milliseconds: 765), () => secondRippleController.forward());
    Timer(const Duration(milliseconds: 1050), () => thirdRippleController.forward());
    centerCircleController.forward();
  }

  @override
  void dispose() {
    firstRippleController.dispose();
    secondRippleController.dispose();
    thirdRippleController.dispose();
    centerCircleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: MyPainter(
        firstRippleRadiusAnimation.value,
        firstRippleOpacityAnimation.value,
        firstRippleWidthAnimation.value,
        secondRippleRadiusAnimation.value,
        secondRippleOpacityAnimation.value,
        secondRippleWidthAnimation.value,
        thirdRippleRadiusAnimation.value,
        thirdRippleOpacityAnimation.value,
        thirdRippleWidthAnimation.value,
        centerCircleRadiusAnimation.value,
      ),
    );
  }
}

// O painter que desenha os círculos
class MyPainter extends CustomPainter {
  final double firstRippleRadius;
  final double firstRippleOpacity;
  final double firstRippleStrokeWidth;
  final double secondRippleRadius;
  final double secondRippleOpacity;
  final double secondRippleStrokeWidth;
  final double thirdRippleRadius;
  final double thirdRippleOpacity;
  final double thirdRippleStrokeWidth;
  final double centerCircleRadius;

  MyPainter(
    this.firstRippleRadius,
    this.firstRippleOpacity,
    this.firstRippleStrokeWidth,
    this.secondRippleRadius,
    this.secondRippleOpacity,
    this.secondRippleStrokeWidth,
    this.thirdRippleRadius,
    this.thirdRippleOpacity,
    this.thirdRippleStrokeWidth,
    this.centerCircleRadius,
  );

  @override
  void paint(Canvas canvas, Size size) {
    Color myColor = mainGreen;

    Paint firstPaint = Paint();
    firstPaint.color = myColor.withOpacity(firstRippleOpacity);
    firstPaint.style = PaintingStyle.stroke;
    firstPaint.strokeWidth = firstRippleStrokeWidth;

    canvas.drawCircle(Offset.zero, firstRippleRadius, firstPaint);

    Paint secondPaint = Paint();
    secondPaint.color = myColor.withOpacity(secondRippleOpacity);
    secondPaint.style = PaintingStyle.stroke;
    secondPaint.strokeWidth = secondRippleStrokeWidth;

    canvas.drawCircle(Offset.zero, secondRippleRadius, secondPaint);

    Paint thirdPaint = Paint();
    thirdPaint.color = myColor.withOpacity(thirdRippleOpacity);
    thirdPaint.style = PaintingStyle.stroke;
    thirdPaint.strokeWidth = thirdRippleStrokeWidth;

    canvas.drawCircle(Offset.zero, thirdRippleRadius, thirdPaint);

    Paint fourthPaint = Paint();
    fourthPaint.color = myColor;
    fourthPaint.style = PaintingStyle.fill;

    canvas.drawCircle(Offset.zero, centerCircleRadius, fourthPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
