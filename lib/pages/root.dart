import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gyanith2k24/components/navButtons.dart';
// import 'package:gyanith2k24/pages/eventpage.dart';
// import 'package:gyanith2k24/pages/home.dart';
// import 'package:gyanith2k24/pages/profile.dart';

class RootPage extends StatefulWidget {
  RootPage({super.key, required this.buttons});
  List<dynamic> buttons;

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  void _navigatebottombar(int index) {
    setState(() {
      _selectedindex = index;
      _pageController.animateToPage(index,
          duration: const Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < widget.buttons.length; i++) {
      pages.add((widget.buttons[i]['page']));
    }
  }

  int _selectedindex = 0;
  List<Widget> pages = [];

  final _pageController = PageController();
  final List Notifications = [];

  @override
  Widget build(BuildContext context) {
    // print(pages);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              controller: _pageController,
              // LIST OF PAGES TO PASSED
              children: pages,
              onPageChanged: (int page) {
                setState(() {
                  _selectedindex = page;
                });
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: const Icon(
                            Icons.notifications_active_rounded,
                            color: Colors.teal,
                            size: 28,
                          ),
                        ),
                      ),
                    ),
                    (Notifications.isEmpty)
                        ? Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              height: 12,
                              width: 12,
                              decoration: BoxDecoration(
                                  color: Colors.redAccent,
                                  borderRadius: BorderRadius.circular(100)),
                            ),
                          )
                        : Container(),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: ClipRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 4, sigmaY: 5),
                        child: Container(
                          height: 90,
                          width: MediaQuery.of(context).size.width * 0.9,
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(126, 213, 210, 203),
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              //     List.generate(widget.buttons.length, (index) {
                              //   int localIndex = index;
                              //   return InkWell(
                              //     onTap: () => _navigatebottombar(localIndex),
                              //     child: NaviButtons(
                              //       selectedindex: _selectedindex,
                              //       icon: widget.buttons[localIndex]['icon'],
                              //       text: widget.buttons[localIndex]['text'],
                              //       index: localIndex,
                              //     ),
                              //   );
                              // }),
                              for (int i = 0; i < widget.buttons.length; i++)
                                InkWell(
                                  onTap: () => _navigatebottombar(i),
                                  child: NaviButtons(
                                    selectedindex: _selectedindex,
                                    icon: widget.buttons[i]['icon'],
                                    text: widget.buttons[i]['text'],
                                    index: i,
                                  ),
                                ),
                              //   InkWell(
                              //     onTap: () => _navigatebottombar(0),
                              //     child: NaviButtons(
                              //       selectedindex: _selectedindex,
                              //       icon: Icons.home,
                              //       text: 'HOME',
                              //       index: 0,
                              //     ),
                              //   ),
                              // InkWell(
                              //   onTap: () => _navigatebottombar(1),
                              //   child: NaviButtons(
                              //     selectedindex: _selectedindex,
                              //     icon: Icons.event,
                              //     text: 'EVENT',
                              //     index: 1,
                              //   ),
                              // ),
                              // InkWell(
                              //   onTap: () => _navigatebottombar(2),
                              //   child: NaviButtons(
                              //     selectedindex: _selectedindex,
                              //     icon: Icons.person,
                              //     text: 'PROFILE',
                              //     index: 2,
                              //   ),
                              // )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
