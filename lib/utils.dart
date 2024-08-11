import 'package:custom_transition/revelcircle.dart';
import 'package:flutter/material.dart';

class LeftToRight extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;
  final Curve curve;

  const LeftToRight({
    super.key,
    required this.animation,
    required this.child,
    this.curve = Curves.elasticInOut,
  });

  @override
  Widget build(BuildContext context) {
    const begin = Offset(-1.0, 0.0);
    const end = Offset.zero;
    final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    final offsetAnimation = animation.drive(tween);
    return SlideTransition(
      position: offsetAnimation,
      child: child,
    );
  }
}

class RightToLeft extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;
  final Curve curve;

  const RightToLeft({
    super.key,
    required this.animation,
    required this.child,
    this.curve = Curves.elasticInOut,
  });

  @override
  Widget build(BuildContext context) {
    const begin = Offset(1.0, 0.0);
    const end = Offset.zero;
    final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    final offsetAnimation = animation.drive(tween);
    return SlideTransition(
      position: offsetAnimation,
      child: child,
    );
  }
}

class TopToBottom extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;
  final Curve curve;

  const TopToBottom({
    super.key,
    required this.animation,
    required this.child,
    this.curve = Curves.elasticInOut,
  });

  @override
  Widget build(BuildContext context) {
    const begin = Offset(0.0, 1.0);
    const end = Offset.zero;
    final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    final offsetAnimation = animation.drive(tween);
    return SlideTransition(
      position: offsetAnimation,
      child: child,
    );
  }
}

class BottomToTop extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;
  final Curve curve;

  const BottomToTop({
    super.key,
    required this.animation,
    required this.child,
    this.curve = Curves.elasticInOut,
  });

  @override
  Widget build(BuildContext context) {
    const begin = Offset(0.0, -1.0);
    const end = Offset.zero;
    final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    final offsetAnimation = animation.drive(tween);
    return SlideTransition(
      position: offsetAnimation,
      child: child,
    );
  }
}

class CreateScaleRoute extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;
  final Curve curve;

  const CreateScaleRoute({
    super.key,
    required this.animation,
    required this.child,
    this.curve = Curves.elasticInOut,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: curve,
        ),
      ),
      child: child,
    );
  }
}

class CreateRotateRoute extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;
  final Curve curve;

  const CreateRotateRoute({
    super.key,
    required this.animation,
    required this.child,
    this.curve = Curves.linear,
  });

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: curve,
        ),
      ),
      child: child,
    );
  }
}

class CreateFadeRoute extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;
  final Curve curve;

  const CreateFadeRoute({
    super.key,
    required this.animation,
    required this.child,
    this.curve = Curves.elasticInOut,
  });

  @override
  Widget build(BuildContext context) {
    Animation<double> opacityAnimation = CurvedAnimation(
      parent: animation,
      curve: curve,
    );
    return FadeTransition(
      opacity: opacityAnimation,
      child: child,
    );
  }
}

class CreateSizedRoute extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;
  final Curve curve;

  const CreateSizedRoute({
    super.key,
    required this.animation,
    required this.child,
    this.curve = Curves.elasticInOut,
  });

  @override
  Widget build(BuildContext context) {
    Animation<double> opacityAnimation = CurvedAnimation(
      parent: animation,
      curve: curve,
    );
    return SizeTransition(
      sizeFactor: opacityAnimation,
      child: child,
    );
  }
}

class CreateScaleRotateRoute extends StatelessWidget {
  final Animation<double> animation;
  final Animation<double> secondaryAnimation;
  final Widget child;
  final Curve curve;
  final Curve secondaryCurve;

  const CreateScaleRotateRoute({
    super.key,
    required this.animation,
    required this.secondaryAnimation,
    required this.child,
    this.curve = Curves.elasticInOut,
    this.secondaryCurve = Curves.fastOutSlowIn,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: curve,
        ),
      ),
      child: RotationTransition(
        turns: Tween<double>(
          begin: 0.0,
          end: 1.0,
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: secondaryCurve,
          ),
        ),
        child: child,
      ),
    );
  }
}

class CircularRevealAnimation extends StatelessWidget {
  final Animation<double> animation;
  final Widget child;
  final double maxRadius;
  final Curve curve;

  const CircularRevealAnimation({
    super.key,
    required this.animation,
    required this.child,
    this.maxRadius = 800.0,
    this.curve = Curves.elasticInOut,
  });

  @override
  Widget build(BuildContext context) {
    var animation3 = CurvedAnimation(curve: curve, parent: animation);
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return ClipPath(
          clipper:
              CircularRevealClipper(fraction: animation3.value, minRadius: 10),
          child: child,
        );
      },
      child: child,
    );
  }
}
