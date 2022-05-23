import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroductionScreen(
        scrollPhysics:
            const BouncingScrollPhysics(), //Default is BouncingScrollPhysics
        pages: [
          PageViewModel(
              title: "",
              bodyWidget: Container(
                padding: const EdgeInsets.all(10),
                child: SvgPicture.asset(
                  "assets/splash.svg",
                  height: 150,
                ),
              ),
              reverse: true,
              footer: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    AppLocalizations.of(context)!.helloWorld,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    " Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut.",
                    style: Theme.of(context).textTheme.bodyText1,
                    textAlign: TextAlign.center,
                  ),
                ],
              )),
        ],
        onChange: (e) {
          // When something changes
        },
        onDone: () {
          // When done button is press
        },
        onSkip: () {
          // You can also override onSkip callback
        },
        showSkipButton: true, //Is the skip button should be display
        skip: const Icon(Icons.skip_next),
        next: const Icon(Icons.forward),
        done: const Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
        dotsDecorator: DotsDecorator(
            size: const Size.square(10.0),
            activeSize: const Size(20.0, 10.0),
            color: Colors.black26,
            spacing: const EdgeInsets.symmetric(horizontal: 3.0),
            activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0))),
      ),
    );
  }
}
