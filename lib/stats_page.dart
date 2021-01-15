import 'package:covid19_stats/constants.dart';
import 'package:flutter/material.dart';

class StatsPage extends StatefulWidget {
  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  String dropdownValue = 'Indonesia';

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
                    StatsColumn(
                      columnTextAlignment: CrossAxisAlignment.start,
                    ),
                    Image.asset(
                      'assets/img/globe.png',
                      height: 200,
                    ),
                  ],
                ),
                Divider(
                  height: 20,
                  thickness: 2,
                ),
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>['Indonesia', 'USA', 'Singapore', 'English']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      'assets/img/flag.png',
                      height: 200,
                    ),
                    StatsColumn(
                      columnTextAlignment: CrossAxisAlignment.end,
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
  final CrossAxisAlignment columnTextAlignment;

  StatsColumn({@required this.columnTextAlignment});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: columnTextAlignment,
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
