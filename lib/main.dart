import 'dart:math';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

ConfettiController? controller;
const name = 'MOM';
const relation = 'parent';

void main() => runApp(const ConfettiSample());

class ConfettiSample extends StatelessWidget {
  const ConfettiSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Happy Birthday',
        home: Scaffold(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          body: MyApp(),
        ));
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    controller = ConfettiController(duration: const Duration(seconds: 2));
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  bool toShowButton = true;
  bool toShowText = false;
  bool toShowText2 = false;
  bool toShowButton2 = false;

  @override
  Widget build(BuildContext context) {
    TextStyle animTextStyle = TextStyle(color: Colors.white, fontSize: 20);
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomCenter,
            child: getConfetti(-pi / 2),
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: double.infinity,
              height: 125,
              child: AnimatedOpacity(
                opacity: toShowButton ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 700),
                // The green box must be a child of the AnimatedOpacity widget.
                child: ElevatedButton(
                  onPressed: () {
                    controller!.play();
                    changeVisibility();
                  },
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(const CircleBorder()),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.pinkAccent),
                    overlayColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(125, 255, 255, 255)),
                  ),
                  child: const Text(
                    'CLICK HERE',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: getConfetti(-pi / 4),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: getConfetti(pi + pi / 4),
          ),
          Align(
            alignment: Alignment.topRight,
            child: getConfetti(pi - pi / 4),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: getConfetti(pi / 4),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: getConfetti(pi / 2),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: getConfetti(-pi / 2),
          ),
          Visibility(
            visible: toShowText,
            child: Align(
              alignment: Alignment.center,
              child: DefaultTextStyle(
                style: GoogleFonts.shadowsIntoLight(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
                child: AnimatedTextKit(
                    isRepeatingAnimation: false,
                    pause: Duration(milliseconds: 400),
                    onFinished: () {
                      setState(() {
                        toShowText = !toShowText;
                        toShowText2 = !toShowText2;
                      });
                    },
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'HAPPY BIRTHDAY $name',
                        speed: Duration(milliseconds: 80),
                      ),
                      TypewriterAnimatedText(
                        'I LOVE YOUUU ❤️',
                        speed: Duration(milliseconds: 80),
                      ),
                      TypewriterAnimatedText(
                        'SOOOOOOOOOOOOO MUCH.',
                        speed: Duration(milliseconds: 80),
                      ),
                    ]),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Visibility(
              visible: toShowText2,
              child: AnimatedOpacity(
                opacity: toShowText2 ? 1.0 : 0.0,
                duration: Duration(milliseconds: 700),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const SizedBox(width: 20.0, height: 100.0),
                    Text(
                      'You are',
                      style: GoogleFonts.shadowsIntoLight(
                          fontSize: 26.0,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 10.0, height: 100.0),
                    DefaultTextStyle(
                      style: GoogleFonts.permanentMarker(
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 209, 11, 107)),
                      child: AnimatedTextKit(
                        repeatForever: false,
                        isRepeatingAnimation: false,
                        onFinished: () {
                          setState(() {
                            toShowButton2 = !toShowButton2;
                          });
                        },
                        animatedTexts: [
                          RotateAnimatedText(
                            'AWESOME',
                            rotateOut: false,
                            duration: const Duration(milliseconds: 700),
                          ),
                          RotateAnimatedText(
                            'WONDERFUL',
                            rotateOut: false,
                            duration: const Duration(milliseconds: 700),
                          ),
                          RotateAnimatedText(
                            'INCREDIBLE',
                            rotateOut: false,
                            duration: const Duration(milliseconds: 700),
                          ),
                          RotateAnimatedText(
                            'AMAZING',
                            rotateOut: false,
                            duration: const Duration(milliseconds: 700),
                          ),
                          RotateAnimatedText(
                            'THE BEST.',
                            rotateOut: false,
                            duration: const Duration(milliseconds: 700),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Visibility(
            visible: toShowButton2,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                width: double.infinity,
                child: AnimatedOpacity(
                  opacity: toShowButton2 ? 1.0 : 0.0,
                  duration: const Duration(milliseconds: 700),
                  // The green box must be a child of the AnimatedOpacity widget.
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return SecondPage();
                        }),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.pinkAccent),
                      overlayColor: MaterialStateProperty.all<Color>(
                          const Color.fromARGB(125, 255, 255, 255)),
                    ),
                    child: const Text(
                      'CLICK HERE',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Text display(String text) {
    return Text(
      text,
      style: const TextStyle(color: Colors.white, fontSize: 20),
    );
  }

  void changeVisibility() {
    setState(() {
      toShowButton = !toShowButton;
      int start = 500;
      const oneDecimal = Duration(milliseconds: 100);
      Timer timer = Timer.periodic(
          oneDecimal,
          (Timer timer) => setState(() {
                if (start < 100) {
                  setState(() {
                    toShowText = !toShowText;
                  });
                  timer.cancel();
                } else {
                  start = start - 100;
                }
              }));
    });
  }
}

class SecondPage extends StatelessWidget {
  SecondPage({super.key});
  var count = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ImageSlideshow(
        /// Width of the [ImageSlideshow].
        width: double.infinity,

        /// Height of the [ImageSlideshow].
        height: 200,

        /// The page to show when first creating the [ImageSlideshow].
        initialPage: 0,

        /// The color to paint the indicator.
        indicatorColor: Colors.blue,

        /// The color to paint behind th indicator.
        indicatorBackgroundColor: Colors.grey,

        /// The widgets to display in the [ImageSlideshow].
        /// Add the sample image file into the images folder
        children: [
          Image.asset(
            'images/image1.png',
            fit: BoxFit.cover,
          ),
          Image.asset(
            'images/image2.png',
            fit: BoxFit.cover,
          ),
          Image.asset(
            'images/image3.png',
            fit: BoxFit.cover,
          ),
          Image.asset(
            'images/image4.png',
            fit: BoxFit.cover,
          ),
          Image.asset(
            'images/image5.png',
            fit: BoxFit.cover,
          ),
        ],

        /// Called whenever the page in the center of the viewport changes.
        onPageChanged: (value) {
          if (value == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return ThirdPage();
              }),
            );
          }
        },

        /// Auto scroll interval.
        /// Do not auto scroll with null or 0.
        autoPlayInterval: 3000,

        /// Loops back to first slide.
        isLoop: true,
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  ThirdPage({super.key});
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: double.infinity,
        child: DefaultTextStyle(
          style: GoogleFonts.shadowsIntoLight(
            color: Colors.white,
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
          child: AnimatedTextKit(
            animatedTexts: [
              TyperAnimatedText('You are the best $relation ever.❤️',
                  textAlign: TextAlign.center),
              TyperAnimatedText(
                'LOVE YOU.',
                textStyle: GoogleFonts.permanentMarker(
                    color: Color.fromARGB(255, 209, 11, 107),
                    fontWeight: FontWeight.bold,
                    fontSize: 50),
                textAlign: TextAlign.center,
              )
            ],
            totalRepeatCount: 1,
            onTap: () {
              print("Tap Event");
            },
          ),
        ),
      ),
    );
  }
}

//Make a function that returns ConfettiWidget, takes angle as input
ConfettiWidget getConfetti(double angle) {
  return ConfettiWidget(
    confettiController: controller!,
    blastDirection: angle,
    emissionFrequency: 0.01,
    numberOfParticles: 20,
    maxBlastForce: 50,
    minBlastForce: 30,
    gravity: 0.15,
    shouldLoop: false,
    minimumSize: Size.square(8),
    maximumSize: Size.square(10),
  );
}
