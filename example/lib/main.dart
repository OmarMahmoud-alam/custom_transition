import 'package:custom_transition/custom_transition.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

///Example App
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Custom Animated Route Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/second':
            final RouteAnimationType animationType = settings.arguments as RouteAnimationType;
            return PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) => const SecondPage(),
              transitionsBuilder: animatedTransition(animationType),
              transitionDuration:const  Duration(milliseconds: 300),
              reverseTransitionDuration:const Duration(milliseconds: 300),
            );
          default:
            return null;
        }
      },
      routes: {
        '/': (context) => const HomeScreen(),
      },
    );
  }
}

/// Example page
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<RouteAnimationType, String> animationMap = {
      RouteAnimationType.leftToRight: 'Left to Right Transition',
      RouteAnimationType.fade: 'Fade Transition',
      RouteAnimationType.rightToLeft: 'Right to Left Transition',
      RouteAnimationType.bottomToTop: 'Bottom to Top Transition',
      RouteAnimationType.topToBottom: 'Top to Bottom Transition',
      RouteAnimationType.scale: 'Scale Transition',
      RouteAnimationType.zoom: 'Zoom Transition',
      RouteAnimationType.circularReveal: 'Circular Reveal Transition',
      RouteAnimationType.none: 'No Transition',
      RouteAnimationType.rotate: 'Rotate Transition',
      RouteAnimationType.scaleRotate: 'Scale Rotate Transition',
      // Add other transitions as needed
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Screen'),
      ),
      body: Expanded(
        child: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: animationMap.length+2,
          itemBuilder: (context, index) {
          
if(index==animationMap.length){
  return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                     '/second',
                      arguments:  RouteAnimationType.leftToRight,

                  );
                },
                child: const Text('navigate by name'),
              ),
            );
}
else if(index==animationMap.length+1){
  return  Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) => const SecondPage(),
                      transitionsBuilder: animatedTransition(RouteAnimationType.rotate,curve: Curves.easeInOutBack),
                      transitionDuration: const Duration(milliseconds: 800),
                      reverseTransitionDuration: const Duration(milliseconds: 800),
                    ),
                  );
                },
                child: const Text("with curve"),
              ),
            );
}
  final animationType = animationMap.keys.elementAt(index);
            final animationLabel = animationMap.values.elementAt(index);
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) => const SecondPage(),
                      transitionsBuilder: animatedTransition(animationType,curve: Curves.linear),
                      transitionDuration: const Duration(milliseconds: 800),
                      reverseTransitionDuration: const Duration(milliseconds: 800),
                    ),
                  );
                },
                child: Text(animationLabel),
              ),
            );
          },
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
      backgroundColor: Colors.greenAccent,
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
