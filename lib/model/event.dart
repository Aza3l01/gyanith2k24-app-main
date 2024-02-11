import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";

class Upload extends StatefulWidget {
  const Upload({super.key});

  @override
  State<Upload> createState() => _UploadState();
}

class _UploadState extends State<Upload> {
  Map<String, dynamic> event = {
    'view': true,
    // 'id': '235678',
    'title': "title",
    'description': "description",
    'img': "img link",
    'coordinator': ["coordinator1_id", "coordinator2_id"],
    'venue': "venue",
    'dateTime': DateTime(2024, 2, 16, 12, 30, 0),
    'price' : ["100", "200", "300"],
    'amount': 100,
    'team' : true,
    'type' : ["tech"],
    'members' : 3,
    'Reg_open' : true,
  };

  void update() async {
    try {
      FirebaseFirestore.instance.collection('events').doc("test").set(event);
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    update();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Event {
  final bool view;
  final String id;
  final String title;
  final String description;
  final String img;
  final List<String> coordinator;
  final String venue;
  final DateTime dateTime;
  final List<String>? price;
  final String? amount;
  final String? rules;

  const Event({
    required this.view,
    required this.id,
    required this.title,
    required this.description,
    required this.img,
    required this.coordinator,
    required this.venue,
    required this.dateTime,
    this.amount,
    this.price,
    this.rules,
  });
}
