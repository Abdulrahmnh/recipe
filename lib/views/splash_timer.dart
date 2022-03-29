import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:recipe/controller/controller_view.dart';
import 'package:recipe/views/screens/splash_view.dart';

class SplashTimer extends StatefulWidget {
  const SplashTimer({Key? key}) : super(key: key);

  @override
  State<SplashTimer> createState() => _SplashTimerState();
}

class _SplashTimerState extends State<SplashTimer> {
  @override
  void initState() {
    super.initState();
    startSplashScreenTimer();
  }

  startSplashScreenTimer() async {
    var _duration = const Duration(seconds: 5);
    return Timer(_duration, navigationToNextPage);
  }

  void navigationToNextPage() async {
    Get.to(() => ControlView(), arguments: (Route<dynamic> route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
             decoration: const BoxDecoration(
             image: DecorationImage(
             image: AssetImage("assets/images/splash_timer.jpg"), fit: BoxFit.cover),
            ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                 children: [
                   Expanded(
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                       Text(
                        'Recipe App',
                        style: GoogleFonts.pacifico(
                          textStyle: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        textAlign: TextAlign.end,
                      )
                    ],
                  ),
                ),
              ],
            )
            )
        ),
      ),
    )
    );
  }
}
