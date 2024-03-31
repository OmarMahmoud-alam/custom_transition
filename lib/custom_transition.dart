library custom_transition;

import 'package:custom_transition/revelcircle.dart';
import 'package:flutter/material.dart';

///this make  animation in page transition
/// RouteAnimationType is enum class i make to enter the type of animation
/// Duration is the duration of page transition
/// it better to be in multi page so fell free to clean the code
///
class CustomAnimatedRoute {
  static PageRouteBuilder<dynamic> animatedroute(
    Widget screen, {
    required RouteAnimationType animationType,
    duration = const Duration(milliseconds: 300),
    curve = Curves.elasticInOut,
    secondarycurve = Curves.fastOutSlowIn, //use only for routescale
  }) {
    return PageRouteBuilder(
        transitionDuration: duration,
        reverseTransitionDuration: duration,
        pageBuilder: (context, animation, secondaryAnimation) => screen,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          switch (animationType) {
            case RouteAnimationType.leftToRight:
              return lefttoright(context, animation, secondaryAnimation, child,
                  duration, curve);
            case RouteAnimationType.rightToLeft:
              return righttoleft(context, animation, secondaryAnimation, child,
                  duration, curve);
            case RouteAnimationType.bottomToTop:
              return bottomtotop(context, animation, secondaryAnimation, child,
                  duration, curve);
            case RouteAnimationType.topToBottom:
              return toptobottom(context, animation, secondaryAnimation, child,
                  duration, curve);
            case RouteAnimationType.scale:
              return creatScaleRoute(context, animation, secondaryAnimation,
                  child, duration, curve);
            case RouteAnimationType.zoom:
              return creatScaleRoute(context, animation, secondaryAnimation,
                  child, duration, curve);
            case RouteAnimationType.fade:
              return creatfateRoute(context, animation, secondaryAnimation,
                  child, duration, curve);
            case RouteAnimationType.circularReveal:
              return CircularRevealAnimation(
                animation: animation,
                curve: curve,
                child: child,
              );

            case RouteAnimationType.none:
              return child; 
            case RouteAnimationType.rotate:
              return creatrotateRoute(context, animation, secondaryAnimation,
                  child, duration, curve);
            case RouteAnimationType.scaleRotate:
              return creatScaleRotateRoute(context, animation,
                  secondaryAnimation, child, duration, curve, secondarycurve);
            case RouteAnimationType.zoomcircle:
              return creatZoomcircleRoute(context, animation,
                  secondaryAnimation, child, duration, curve);

            default:
              return child;
          }
        });
  }
}
// Creates a slide transition that slides the child widget from left to right based on the provided animation, secondaryAnimation, duration, and curve.

Widget lefttoright(
  context,
  animation,
  secondaryAnimation,
  child,
  duration,
  curve,
) {
  const begin = Offset(-1.0, 0.0);
  const end = Offset.zero;
  final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  final offsetAnimation = animation.drive(tween);
  return SlideTransition(
    position: offsetAnimation,
    child: child,
  );
}

// Function for creating a SlideTransition with a given animation, position, and child widget.
Widget righttoleft(
  context,
  animation,
  secondaryAnimation,
  child,
  duration,
  curve,
) {
  const begin = Offset(1.0, 0.0);
  const end = Offset.zero;
  final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  final offsetAnimation = animation.drive(tween);
  return SlideTransition(
    position: offsetAnimation,
    child: child,
  );
}
// Creates a SlideTransition that moves the child widget from the top to the bottom using the given animation, secondaryAnimation, duration, and curve.

Widget toptobottom(
  context,
  animation,
  secondaryAnimation,
  child,
  duration,
  curve,
) {
  const begin = Offset(0.0, 1.0);
  const end = Offset.zero;
  final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  final offsetAnimation = animation.drive(tween);
  return SlideTransition(
    position: offsetAnimation,
    child: child,
  );
}

Widget bottomtotop(
  context,
  animation,
  secondaryAnimation,
  child,
  duration,
  curve,
) {
  const begin = Offset(0.0, -1.0);
  const end = Offset.zero;
  final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  final offsetAnimation = animation.drive(tween);
  return SlideTransition(
    position: offsetAnimation,
    child: child,
  );
}

Widget creatScaleRoute(
  context,
  animation,
  secondaryAnimation,
  child,
  duration,
  curve,
) {
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

Widget creatrotateRoute(
  context,
  animation,
  secondaryAnimation,
  child,
  duration,
  curve,
) {
  return RotationTransition(
    turns: Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: animation,
        curve: Curves.linear,
      ),
    ),
    child: child,
  );
}

Widget creatfateRoute(
  context,
  animation,
  secondaryAnimation,
  child,
  duration,
  curve,
) {
  Animation<double> opacityAnimation = CurvedAnimation(
    parent: animation,
    curve: curve,
  );
  return FadeTransition(
    opacity: opacityAnimation,
    child: child,
  );
}

Widget creatsizedRoute(
  context,
  animation,
  secondaryAnimation,
  child,
  duration,
  curve,
) {
  Animation<double> opacityAnimation = CurvedAnimation(
    parent: animation,
    curve: curve,
  );
  return SizeTransition(
    sizeFactor: opacityAnimation,
    child: child,
  );
}

Widget creatZoomcircleRoute(
  context,
  animation,
  secondaryAnimation,
  child,
  duration,
  curve,
) {
  const begin = Offset(0, 0); // Center of the screen
  const end = Offset(1, 1); // Expanding from center
  final tween = Tween(begin: begin, end: end);
  final offsetAnimation = animation.drive(tween);

  return ClipOval(
    child: Align(
      alignment: Alignment.center,
      child: AnimatedBuilder(
          animation: offsetAnimation,
          builder: (context, child2) {
            return SizedBox(
              width:
                  MediaQuery.of(context).size.width * offsetAnimation.value.dx,
              //height: MediaQuery.of(context).size.height * animation.value.dx,
              child: child,
            );
          }),
    ),
  );
}

Widget creatScaleRotateRoute(
  context,
  animation,
  secondaryAnimation,
  child,
  duration,
  curve,
  secondarycurve,
) {
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
          curve: secondarycurve,
        ),
      ),
      child: child,
    ),
  );
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
    required this.curve,
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

enum RouteAnimationType {
  fade, // Example: FadeTransition
  scaleRotate, // Example: Scale and Rotation combined
  leftToRight, // Example: Slide from left to right
  rightToLeft, // Example: Slide from right to left
  topToBottom, // Example: Slide from top to bottom
  bottomToTop, // Example: Slide from bottom to top
  scale, // Example: Scale
  rotate, // Example: Rotation
  zoom, // Example: Size
  zoomcircle, // Example: Size
  none,
  circularReveal,
}
