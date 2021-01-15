import 'package:flutter/material.dart';

class StatsPage extends StatefulWidget {
  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF616161),
        title: Text(
          'COVID-19 Stats',
          style: TextStyle(
            fontFamily: 'Oxygen',
          ),
        ),
      ),
    );
  }
}
