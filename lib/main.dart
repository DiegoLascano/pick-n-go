import 'package:flutter/material.dart';

import 'package:pick_n_go/src/bloc/bloc_provider.dart';
import 'package:pick_n_go/src/pages/landing_page.dart';
import 'package:pick_n_go/src/routes/routes.dart';
import 'package:pick_n_go/src/services/auth_service.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final MaterialColor purpleSwatch = const MaterialColor(
    0xFF51279B,
    const <int, Color>{
      50: const Color(0xFFEAE2F8),
      100: const Color(0xFFCFBCF2),
      200: const Color(0xFFA081D9),
      300: const Color(0xFF8662C7),
      400: const Color(0xFF724BB7),
      500: const Color(0xFF653CAD),
      600: const Color(0xFF51279B),
      700: const Color(0xFF421987),
      800: const Color(0xFF34126F),
      900: const Color(0xFF240754),
    },
  );

  final MaterialColor redVividSwatch = const MaterialColor(
    0xFFCF1124,
    const <int, Color>{
      50: const Color(0xFFFFE3E3),
      100: const Color(0xFFFFBDBD),
      200: const Color(0xFFFF9B9B),
      300: const Color(0xFFF86A6A),
      400: const Color(0xFFEF4E4E),
      500: const Color(0xFFE12D39),
      600: const Color(0xFFCF1124),
      700: const Color(0xFFAB091E),
      800: const Color(0xFF8A041A),
      900: const Color(0xFF610316),
    },
  );

  final MaterialColor blueGraySwatch = const MaterialColor(
    0xFF486581,
    const <int, Color>{
      50: const Color(0xFFF0F4F8),
      100: const Color(0xFFD9E2EC),
      200: const Color(0xFFBCCCDC),
      300: const Color(0xFF9FB3C8),
      400: const Color(0xFF829AB1),
      500: const Color(0xFF627D98),
      600: const Color(0xFF486581),
      700: const Color(0xFF334E68),
      800: const Color(0xFF243B53),
      900: const Color(0xFF102A43),
    },
  );

  final MaterialColor tealVividSwatch = const MaterialColor(
    0xFF079A82,
    const <int, Color>{
      50: const Color(0xFFF0FCF9),
      100: const Color(0xFFC6F7E9),
      200: const Color(0xFF8EEDD1),
      300: const Color(0xFF5FE3C0),
      400: const Color(0xFF2DCCA7),
      500: const Color(0xFF17B897),
      600: const Color(0xFF079A82),
      700: const Color(0xFF048271),
      800: const Color(0xFF016457),
      900: const Color(0xFF004440),
    },
  );

  final MaterialColor yellowVividSwatch = const MaterialColor(
    0xFFDE911D,
    const <int, Color>{
      50: const Color(0xFFFFFBEA),
      100: const Color(0xFFFFF3C4),
      200: const Color(0xFFFCE588),
      300: const Color(0xFFFADB5F),
      400: const Color(0xFFF7C948),
      500: const Color(0xFFF0B429),
      600: const Color(0xFFDE911D),
      700: const Color(0xFFCB6E17),
      800: const Color(0xFFB44D12),
      900: const Color(0xFF8D2B0B),
    },
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pa llevar',
        // home: LandingPage(auth: Auth()),
        initialRoute: 'landing',
        routes: getApplicationRoutes(),
        theme: ThemeData(
          primarySwatch: purpleSwatch,
        ),
      ),
    );
  }
}
