import 'package:flutter/material.dart';
import 'package:gyanith2k24/services/dynamicLink.dart';

class ErrorPage extends StatefulWidget {
  ErrorPage({
    super.key,
    required this.id,
  });
  String id;

  @override
  State<ErrorPage> createState() => _ErrorPageState();
}

class _ErrorPageState extends State<ErrorPage> {
  String link = "...";

  void getLink() async {
    link = await DynamicLinkService.createDynamicLink(true, widget.id);
    setState(() {
      print(link);
    });
  }

  @override
  void initState() {
    super.initState();
    getLink();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Text('ERROR !! ${widget.id}'),
          ),
          Center(
            child: Text("$link"),
          ),
        ],
      ),
    );
  }
}
