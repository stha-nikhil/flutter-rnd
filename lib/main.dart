import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'drawer.dart';
import 'feedback.dart';
import 'quiz.dart';
import 'src/providers/count_provider.dart';
import 'style.dart';

void main() => runApp(const MyApp());

final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
          path: '/',
          builder: (BuildContext context, GoRouterState state) {
            return const AppDrawer(Quiz());
          },
          routes: <RouteBase>[
            // GoRoute(
            //     path: 'quiz',
            //     builder: (BuildContext context, GoRouterState state) {
            //       return const AppDrawer(Quiz());
            //     }
            // ),
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
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CountPoints())],

      child: MaterialApp.router(
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
    ),
    );
  }
}