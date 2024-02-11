import 'package:flutter/material.dart';
import 'package:gyanith2k24/components/eventContainer.dart';

class EventPage extends StatelessWidget {
  const EventPage({super.key});

  @override
  Widget build(BuildContext context) {
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
          ),
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext ctxt, int index) => Padding(
                    padding: const EdgeInsets.all(10),
                    child: EventContainer(index: "$index"),
                    // child: InkWell(
                    //   onTap: () {
                    // String genLink = await DynamicLinkService.createDynamicLink(
                    //     false, "$index");
                    // print(genLink);
                    // print("==============");
                    //     Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => ErrorPage(id: "$index")));
                    //   },
                    //   child: Container(
                    //     height: 40,
                    //     width: 200,
                    //     color: Colors.amberAccent,
                    //   ),
                    // ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
