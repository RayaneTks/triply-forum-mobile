import 'package:flutter/material.dart';
import 'forum.dart';
import 'forum_detail.dart';
import 'login/login.dart';
import 'assets/colors.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Forum',
      theme: new ThemeData(
        primarySwatch: AppColorsTheme.myTheme.primarySwatch,
      ),
      routes: <String, WidgetBuilder>{
         '/':      (BuildContext context) => new LoginPage(),
         '/forum': (BuildContext context) => new ForumPage(title: 'Forum',),
         '/forum/1': (BuildContext context) => new ForumDetailPage(),
      },
      initialRoute: '/',
    );
  }
}
