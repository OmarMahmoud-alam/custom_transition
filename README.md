<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->
# File with heading

this package is use to make animated transition between page this is first version,
 I will add other transition soon
know whether this package might be useful for them.
/*
# CustomAnimatedRoute

**CustomAnimatedRoute** is a Flutter package designed to provide a variety
of animated transitions between pages. This is the first version, and more
animations will be added in future updates.

## Features

- **Slide Animations**:
  - **leftToRight**: Transition the page from left to right, creating a smooth sliding effect.
  - **rightToLeft**: Transition the page from right to left, commonly used for navigation between screens.
  - **bottomToTop**: Transition the page from bottom to top, ideal for modals or screens that should slide up.
  - **topToBottom**: Transition the page from top to bottom, useful for dismissing screens by sliding them down.
  - **Fade Animation**: Provides a smooth fade transition between pages, ideal for subtle changes between content.
  - **Scale Animation**: Creates a zoom in/out effect during page transition, providing a focus on the new screen as it appears.
  - **Rotate Animation**: Rotates the page while transitioning, adding a dynamic and attention-grabbing effect.
  - **ScaleRotate Animation**: Combines scaling and rotating for a more complex and engaging transition, perfect for creative interfaces.
  - **Circular Reveal Animation**: Reveals the next screen in a circular fashion, often used to highlight specific areas or actions.
  - **None**: Direct transition with no animation, allowing instant page changes without any visual effects.

## Getting Started

This package is straightforward to use and does not require any additional setup.
Simply add it to your project and start using the provided animations to enhance your app's user experience.

To install the package, add the following line to your `pubspec.yaml` file:

```yaml
dependencies:
  custom_animated_route: ^1.0.0
 ```

## Usage

i will give an example.

```dart
//you can add duration or use any curve all the animation work with curve
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) => SecondPage(),
                      transitionsBuilder: animatedTransition(RouteAnimationType.rotate,),
                    ),
                  );
                
            Navigator.push(
            context,
            PageRouteBuilder(
           pageBuilder: (context, animation, secondaryAnimation) => AnotherPage(),
           transitionsBuilder: animatedTransition(
               RouteAnimationType.scaleRotate,
               curve: Curves.bounceInOut,
               secondaryCurve: Curves.easeInOut,
             ),
          transitionDuration: const Duration(milliseconds: 800),
          reverseTransitionDuration: const Duration(milliseconds: 800),
            ),
          );    
              

```

## Additional information

if you have any question connect me.
