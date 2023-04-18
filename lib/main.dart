import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'drawer.dart';
import 'feedback.dart';
import 'quiz.dart';
import 'register.dart';
import 'style.dart';

void main() => runApp(MyApp());

final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const AppDrawer(RegisterForm());
          },
          routes: <RouteBase>[
            GoRoute(
                path: 'quiz',
                builder: (BuildContext context, GoRouterState state) {
                  return const AppDrawer(Quiz());
                }
            ),
            GoRoute(
              path: 'feedback',
              builder: (BuildContext context, GoRouterState state){
                return const AppDrawer(FeedBackForm());
              }
            )
          ]
      )
    ]
);

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // home: const AppDrawer(RegisterForm()),
      routerConfig: _router,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey.shade100,
        appBarTheme: const AppBarTheme(
          titleTextStyle: appBarTextStyle,
        ),
        textTheme: const TextTheme(
          // titleMedium: questionTextStyle,
          titleSmall: cardTextStyle,
          labelMedium: answerTextStyle,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: elevatedButtonStyle.style,
        ),
        drawerTheme: drawerStyle,
        cardTheme: cardStyle,
      ),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => const AppDrawer(RegisterForm()),
      //   '/quiz': (context) => const AppDrawer(Quiz()),
      //   '/feedback': (context) => const AppDrawer(FeedBackForm()),
      // },
    );
  }
}