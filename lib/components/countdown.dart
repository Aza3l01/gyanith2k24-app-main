import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';

class Count_down_timer extends StatefulWidget {
  const Count_down_timer({super.key});

  @override
  State<Count_down_timer> createState() => _Count_down_timerState();
}

class _Count_down_timerState extends State<Count_down_timer> {
  static final GyanithTime = DateTime(2024, 2, 16, 0, 0, 0);
  var duration = GyanithTime.difference(DateTime.now());

  double? timerFont = 25;
  double? timerLabel = 16;

  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        duration = GyanithTime.difference(DateTime.now());
      });
    });
    super.initState();
  }

  fmt(int n) => n.toString().padLeft(2, '0');
  @override
  Widget build(BuildContext context) {
    return (!duration.isNegative)
        ? ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: Container(
                height: 130,
                width: MediaQuery.of(context).size.width * 0.79,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(40)),
                  color: Colors.grey.shade200.withOpacity(0.5),
                  // color: Color.fromARGB(141, 1, 128, 82),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(5),
                          child: Text(
                            "STARTS IN 🎉🎊",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              // fontWeight: FontWeight.w600,
                              fontFamily: "Fonarto",
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              // color: const Color.fromARGB(121, 255, 255, 255),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 45,
                                    // height: 40,
                                    child: Center(
                                        child: Text(
                                      fmt(duration.inDays + 1),
                                      style: TextStyle(
                                        fontSize: timerFont,
                                        fontFamily: "Fonarto",
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        // fontWeight: FontWeight.w600,
                                      ),
                                    )),
                                  ),
                                  Center(
                                      child: Text(
                                    "DAYS",
                                    style: TextStyle(
                                      fontFamily: "Fonarto",
                                      fontSize: timerLabel,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      // fontWeight: FontWeight.w600,
                                    ),
                                  )),
                                ],
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              // color: const Color.fromARGB(121, 255, 255, 255),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 45,
                                    // height: 40,
                                    child: Center(
                                        child: Text(
                                      fmt(duration.inHours -
                                          duration.inDays * 24),
                                      style: TextStyle(
                                        fontFamily: "Fonarto",
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: timerFont,
                                        // fontWeight: FontWeight.w600,
                                      ),
                                    )),
                                  ),
                                  Center(
                                      child: Text(
                                    "HOUR",
                                    style: TextStyle(
                                      fontFamily: "Fonarto",
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: timerLabel,
                                      // fontWeight: FontWeight.w600,
                                    ),
                                  )),
                                ],
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              // color: const Color.fromARGB(121, 255, 255, 255),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 45,
                                    // height: 40,
                                    child: Center(
                                        child: Text(
                                      fmt(duration.inMinutes -
                                          duration.inHours * 60),
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: timerFont,
                                        // fontWeight: FontWeight.w600,
                                        fontFamily: "Fonarto",
                                      ),
                                    )),
                                  ),
                                  Center(
                                      child: Text(
                                    "MIN",
                                    style: TextStyle(
                                      fontFamily: "Fonarto",
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: timerLabel,
                                      // fontWeight: FontWeight.w600,
                                    ),
                                  )),
                                ],
                              ),
                            ),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              // color: const Color.fromARGB(121, 255, 255, 255),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: 45,
                                    // height: 35,
                                    child: Center(
                                        child: Text(
                                      fmt(duration.inSeconds -
                                          duration.inMinutes * 60),
                                      style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: timerFont,
                                        // fontWeight: FontWeight.w600,
                                        fontFamily: "Fonarto",
                                      ),
                                    )),
                                  ),
                                  Center(
                                      child: Text(
                                    "SEC",
                                    style: TextStyle(
                                      fontFamily: "Fonarto",
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontSize: timerLabel,
                                      // fontWeight: FontWeight.w600,
                                    ),
                                  )),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        : RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Welcome to\n ",
                  style: TextStyle(
                    fontSize: 34,
                    fontFamily: "Fonarto",
                  ),
                ),
                TextSpan(
                  text: "Day ${-duration.inDays + 1} 🥳",
                  style: TextStyle(
                    fontSize: 30,
                    fontFamily: "Satisfy_Regular",
                  ),
                ),
              ],
            ),
          );
  }
}
