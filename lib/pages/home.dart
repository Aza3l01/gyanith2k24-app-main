import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gyanith2k24/components/countdown.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Stack(
          children: [
            Container(
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
              // child: SvgPicture.asset(
              //   'assets/images/background.svg',
              //   semanticsLabel: 'My SVG Image',
              // ),
            ),
            SingleChildScrollView(
              child: Center(
                child: Column(
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
                    InkWell(
                      onTap: () async {
                        Map<String, dynamic> event = {
                          'view': true,
                          'id': '235678',
                          'title': "title",
                          'description': "description",
                          'img': "img link",
                          'coordinator': ["coordinator1_id", "coordinator2_id"],
                          'venue': "venue",
                          'dateTime': DateTime(2024, 2, 16, 12, 30, 0),
                        };

                        try {
                          await FirebaseFirestore.instance
                              .collection('events')
                              .doc("test")
                              .set(event);
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: const Text(
                        "GYANITH 24",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 31,
                          // fontWeight: FontWeight.w100,
                          // fontFamily: "Montserrat_Bold",
                          fontFamily: "Ethnocentric",
                        ),
                      ),
                    ),
                    Container(
                      height: 2,
                      width: MediaQuery.of(context).size.width * 0.4,
                      color: Colors.white,
                    ),
                    const Text(
                      "FEB 16-17",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontFamily: "Fonarto",
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const Count_down_timer(),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
