import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:gyanith2k24/router/route_const.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 1), () {
      context.goNamed(RouteConst.home);
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => RootPage(
      //       buttons: const [
      //         {
      //           'icon': Icons.home,
      //           'text': 'HOME',
      //           'page': HomePage(),
      //         },
      //         {
      //           'icon': Icons.calendar_month_sharp,
      //           'text': 'EVENTS',
      //           'page': EventPage(),
      //         },
      //         {
      //           'icon': Icons.person,
      //           'text': 'PROFILE',
      //           'page': Profile(),
      //         },
      //       ],
      //     ),
      //   ),
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.71, -0.70),
            end: Alignment(-0.71, 0.7),
            colors: [
              Color.fromARGB(255, 69, 234, 221),
              Color.fromARGB(255, 32, 144, 134),
              Color.fromARGB(255, 69, 234, 221),
              Color.fromARGB(255, 26, 114, 107),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60, bottom: 25),
              child: Hero(
                tag: 'LOGO',
                child: SvgPicture.asset(
                  'assets/images/gyanithlogo.svg',
                  semanticsLabel: 'My SVG Image',
                  width: MediaQuery.of(context).size.width * 0.35,
                ),
              ),
            ),
            const Text(
              "GYANITH 24",
              style: TextStyle(
                color: Colors.white,
                fontSize: 32,
                fontFamily: "Ethnocentric",
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            Center(
              child: LoadingAnimationWidget.fourRotatingDots(
                color: Colors.white,
                size: 45,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
