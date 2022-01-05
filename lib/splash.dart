import 'package:flutter/material.dart';
import 'package:flutter_swipe_button/flutter_swipe_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe_app/Homepage/dashboard.dart';
import 'package:recipe_app/constants.dart';
import 'package:recipe_app/strings/splash_screen_strings.dart';
// import 'package:recipe_app/constants.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            // Image(image: AssetImage('/assets/splash_screen/splash_screen_bg.jpeg'), fit: BoxFit.fill, )
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    SPLASH_SCREEN_HEADING,
                    style: customText.copyWith(
                        fontSize: 35, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    SPLASH_SCREEN_SUBHEADING,
                    style: customText.copyWith(
                      fontSize: 18
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: SwipeButton.expand(
                    height: 70,
                    thumbPadding: const EdgeInsets.all(10),
                    thumb: const Icon(
                      Icons.arrow_right_rounded,
                      color: Colors.green,
                      size: 50,
                    ),
                    child: Text(
                      "Get Started",
                      style: customText.copyWith(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    activeThumbColor: Colors.white,
                    activeTrackColor: Colors.green.withAlpha(240),
                    onSwipe: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => Dashboard() ));
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
