import 'package:covid19_stats/constants.dart';
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
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 24.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StatsColumn(),
                    Image.asset(
                      'assets/img/globe.png',
                      height: 200,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class StatsColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Confirmed',
          style: kStatsTitleStyle,
        ),
        Text(
          '92.291.033',
          style: kStatsConfirmedStyle,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Deaths',
          style: kStatsTitleStyle,
        ),
        Text(
          '1.976.509',
          style: kStatsDeathsStyle,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          'Recovered',
          style: kStatsTitleStyle,
        ),
        Text(
          '50.947.389',
          style: kStatsRecoveredStyle,
        ),
      ],
    );
  }
}
