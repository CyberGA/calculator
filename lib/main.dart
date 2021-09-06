import 'package:calculator/colors.dart';
import 'package:calculator/home.dart';
import 'package:calculator/provider/values.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: CBackground,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: CBackground,
  ));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: cGreen,
      ),
      home: ChangeNotifierProvider(
          create: (context) => Values(), child: Calculator()),
    );
  }
}
