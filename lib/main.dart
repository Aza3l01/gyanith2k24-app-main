import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gyanith2k24/firebase_options.dart';
import 'package:gyanith2k24/notifications/push_notification.dart';
import 'package:gyanith2k24/router/route_config.dart';
import 'package:gyanith2k24/theme/themeProvider.dart';
import 'package:provider/provider.dart';

Future _firebaseBackgroundMessage(RemoteMessage message) async {
  if (message.notification != null) {
    print("Notification Received");
    print("Title: ${message.notification?.title}");
    print("Body: ${message.notification?.body}");
    print("Payload: ${message.data}");
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // INIT FIREBASE APP
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // final fcmToken = await FirebaseMessaging.instance.getToken();
  // print("Device Token: $fcmToken");

  // NOTIFICATION
  PushNotification.init();

  // ON NOTIFICATION TAP
  // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //   if (message.notification != null) {
  //     print("Background Notification Tapped...");
  //     print(message.toString());

  //     // rootNavKey.currentState!
  //     //     .pushNamed(RouteConst.notification, arguments: message);
  //   }
  // });

  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Gyanith 24',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).themeData,
      routerConfig: MyRouterConfig().router,
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   MyApp({super.key});

//   final _router = GoRouter(
//     initialLocation: "/home",
//     routerNeglect: false,
//     routes: [
//       GoRoute(
//         name: "TestScreen1",
//         path: "/home",
//         builder: (context, state) => const TestScreen1(),
//       ),
//       GoRoute(
//         name: "TestScreen2",
//         path: "/test2",
//         builder: (context, state) => const TestScreen2(),
//       ),
//     ],
//   );

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       title: 'Test',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       routerConfig: _router,
//     );
//   }
// }

// class TestScreen1 extends StatelessWidget {
//   const TestScreen1({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: ElevatedButton(
//               onPressed: () {
//                 GoRouter.of(context).go("/test2");
//               },
//               child: const Text("Go to TestScreen2"))),
//     );
//   }
// }

// class TestScreen2 extends StatelessWidget {
//   const TestScreen2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           // child: ElevatedButton(
//           // onPressed: () {
//           //   GoRouter.of(context).pop();
//           // },
//           child: const Text("Back to TestScreen1")
//           // )
//           ),
//     );
//   }
// }
