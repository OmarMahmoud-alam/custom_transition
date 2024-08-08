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

## Features


- **Slide Animations**: 
  - `leftToRight`
  - `rightToLeft`
  - `bottomToTop`
  - `topToBottom`
- **Fade Animation**: Smooth fade transition between pages.
- **Scale Animation**: Zoom in/out effect during page transition.
- **Rotate Animation**: Rotate the page while transitioning.
- **ScaleRotate Animation**: Combine scaling and rotating for a dynamic effect.
- **Circular Reveal Animation**: Reveal the next screen in a circular fashion.
- **None**: No animation, just a direct transition.

## Getting started

this package not need any editing

## Usage

i will give an example.

```dart
//you can add duration or use any curve all the animation work with curve
                 Navigator.push(
                  context,
                  CustomAnimatedRoute.animatedroute(
                    const SecondPage(),
                    curve: Curves.bounceOut,
                    animationType: RouteAnimationType.rotate,
                  ),
                );
                
              

```

## Additional information

if you have any question connect me.
