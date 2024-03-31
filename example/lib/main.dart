import 'package:custom_transition/custom_transition.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

///Example App
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

/// Example page
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: const Text('Page Transition'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            ElevatedButton(
              child: const Text('Fade Second Page - Default'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SecondPage(),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Left To Right Transition Second Page'),
              onPressed: () {
                Navigator.push(
                  context,
                  CustomAnimatedRoute.animatedroute(const SecondPage(),
                      animationType: RouteAnimationType.leftToRight
                      // type: PageTransitionType.leftToRight,

                      ),
                );
              },
            ),
            ElevatedButton(
              child: const Text(
                  'Right To Left Transition Second Page Ios SwipeBack'),
              onPressed: () {
                Navigator.push(
                  context,
                  CustomAnimatedRoute.animatedroute(
                    const SecondPage(),
                    animationType: RouteAnimationType.rightToLeft,
                  ),
                );
              },
            ),
            ElevatedButton(
              child: const Text('scale Transition Second Page'),
              onPressed: () {
                Navigator.push(
                  context,
                  CustomAnimatedRoute.animatedroute(
                    const SecondPage(),
                    animationType: RouteAnimationType.scale,
                  ),
                );
              },
            ),
            ElevatedButton(
              child: const Text('scale with rotate Transition Second Page'),
              onPressed: () {
                Navigator.push(
                  context,
                  CustomAnimatedRoute.animatedroute(
                    const SecondPage(),
                    animationType: RouteAnimationType.circularReveal,
                  ),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Scale Transition Second Page'),
              onPressed: () {
                Navigator.push(
                  context,
                  CustomAnimatedRoute.animatedroute(
                    const SecondPage(),
                    animationType: RouteAnimationType.scale,
                    duration: const Duration(milliseconds: 400),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: const Text('Rotate Transition Second Page'),
              onPressed: () {
                Navigator.push(
                  context,
                  CustomAnimatedRoute.animatedroute(
                    const SecondPage(),
                    curve: Curves.bounceOut,
                    animationType: RouteAnimationType.rotate,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

///Example second page
class SecondPage extends StatelessWidget {
  /// Page Title
  final String? title;

  /// second page constructor
  const SecondPage({super.key, this.title});
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.toString()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Second Page'),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Go Third Page'),
            )
          ],
        ),
      ),
    );
  }
}

/// third page
class ThirdPage extends StatelessWidget {
  /// Page Title
  final String title;

  /// second page constructor
  const ThirdPage({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Page Transition Plugin"),
      ),
      body: const Center(
        child: Text('ThirdPage Page'),
      ),
    );
  }
}
