import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gyanith2k24/components/loginComponents.dart';
import 'package:gyanith2k24/pages/profile.dart';
import 'package:gyanith2k24/services/auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Duration get loginTime => const Duration(milliseconds: 2250);
  User? user;

  @override
  void initState() {
    super.initState();
    user = AuthFire().currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: AuthFire().authStateChanges,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Scaffold(
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
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 12, bottom: 18),
                          child: Hero(
                            tag: 'LOGO',
                            child: SvgPicture.asset(
                              'assets/images/gyanithlogo.svg',
                              semanticsLabel: 'My SVG Image',
                              width: MediaQuery.of(context).size.width * 0.28,
                            ),
                          ),
                        ),
                        const Text(
                          "GYANITH 24",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 29,
                            // fontWeight: FontWeight.w100,
                            // fontFamily: "Montserrat_Bold",
                            fontFamily: "Ethnocentric",
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.03,
                        ),
                        AnimatedSwitcher(
                          duration: const Duration(milliseconds: 300),
                          child: FlipCardAnimation(
                            frontWidget: (void Function() flipCard) {
                              return SignInForm(flipCard: flipCard);
                            },
                            rearWidget: (void Function() flipCard) {
                              return SignUpForm(flipCard: flipCard);
                            },
                          ),
                        ),
                        // const SizedBox(
                        //   height: 170,
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasData) {
            user = AuthFire().currentUser;
            return Profile(user: user);
          } else {
            return const CircularProgressIndicator();
          }
        });
  }
}
