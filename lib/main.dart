import 'package:covid19_stats/screens/stats_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COVID-19 Stats',
      home: StatsPage(),
    );
  }
}
