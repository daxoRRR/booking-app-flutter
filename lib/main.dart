import 'package:coiffeur_app/constant/constant.dart';
import 'package:coiffeur_app/screens/book_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'screens/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Netflix UI Redesign',
      theme: ThemeData(
        scaffoldBackgroundColor: whiteColor,
        fontFamily: 'Poppins',
        textTheme: TextTheme(
          body1: TextStyle(
            color: Colors.black
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => BookItem(),
      },
      home:  HomePage()
    );
  }
}

