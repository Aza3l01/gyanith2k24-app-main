import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gyanith2k24/components/eventContainer.dart';
import 'package:gyanith2k24/services/auth.dart';

class Profile extends StatefulWidget {
  User? user;

  Profile({
    super.key,
    required this.user,
  });

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
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
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () => AuthFire().signOut(),
                  child: Text("${widget.user?.email}"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
