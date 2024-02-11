import 'package:flutter/material.dart';

class NaviButtons extends StatelessWidget {
  final int selectedindex;
  final IconData icon;
  final String text;
  final int index;

  const NaviButtons({
    super.key,
    required this.selectedindex,
    required this.index,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      // color: (selectedindex == index)
      //     ? Color.fromARGB(115, 78, 78, 78)
      //     : Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: (selectedindex == index) ? Colors.black : Colors.white,
            size: 32,
          ),
          Text(
            text,
            style: TextStyle(
              color: (selectedindex == index) ? Colors.black : Colors.white,
              fontSize: 12,
              fontFamily: "Montserrat_Bold",
            ),
          )
        ],
      ),
    );
  }
}
