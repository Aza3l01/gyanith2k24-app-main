import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gyanith2k24/notifications/NotificationPage.dart';
import 'package:gyanith2k24/pages/errorPage.dart';
import 'package:gyanith2k24/pages/loginPage.dart';
import 'package:gyanith2k24/pages/root.dart';
import 'package:gyanith2k24/pages/splashScreen.dart';
import 'package:gyanith2k24/pages/underProgress.dart';
import 'package:gyanith2k24/router/route_const.dart';

import '../pages/eventpage.dart';
import '../pages/home.dart';

class MyRouterConfig {
  // final pathToRouteNames = {
  //   '/home': RouteConst.home,
  //   '/home/login': RouteConst.login,
  // };

  GoRouter router = GoRouter(
    initialLocation: "/splash",
    routerNeglect: false,
    routes: [
      GoRoute(
        name: RouteConst.home,
        path: "/",
        pageBuilder: (context, state) {
          return MaterialPage(
            child: RootPage(
              buttons: [
                const {
                  'icon': Icons.home,
                  'text': 'HOME',
                  'page': HomePage(),
                },
                const {
                  'icon': Icons.calendar_month_sharp,
                  'text': 'EVENTS',
                  'page': EventPage(),
                },
                {
                  'icon': Icons.person,
                  'text': 'PROFILE',
                  'page': LoginScreen(),
                },
              ],
            ),
          );
        },
      ),
      GoRoute(
        name: RouteConst.login,
        path: "/login",
        pageBuilder: (context, state) {
          return MaterialPage(child: LoginScreen());
        },
      ),
      GoRoute(
        name: RouteConst.maintance,
        path: "/maintain",
        pageBuilder: (context, state) {
          return const MaterialPage(child: UnderMaintancePage());
        },
      ),
      GoRoute(
        name: RouteConst.splash,
        path: "/splash",
        pageBuilder: (context, state) {
          return const MaterialPage(child: SplashScreen());
        },
      ),
      GoRoute(
        name: RouteConst.notification,
        path: "/message",
        pageBuilder: (context, state) {
          return const MaterialPage(child: NotificationPage());
        },
      ),
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(
          child: ErrorPage(
        id: '2',
      ));
    },
  );
}
