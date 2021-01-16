import 'package:covid19_stats/api_helper.dart';
import 'package:covid19_stats/constants.dart';
import 'package:flutter/material.dart';
import 'package:numeral/numeral.dart';

class StatsPage extends StatefulWidget {
  @override
  _StatsPageState createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  String dropdownValue = 'Indonesia';
  ApiHelper apiHelper = ApiHelper();
  Map globalData;

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
          child: FutureBuilder(
              future: apiHelper.getGlobalData(),
              builder: (BuildContext context, AsyncSnapshot<Map> snapshot) {
                Widget mainWidget;
                if (snapshot.hasData) {
                  globalData = snapshot.data;
                  mainWidget = SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            StatsColumn(
                              columnTextAlignment: CrossAxisAlignment.start,
                              statsData: globalData,
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
                          items: <String>[
                            'Indonesia',
                            'USA',
                            'Singapore',
                            'English'
                          ].map<DropdownMenuItem<String>>((String value) {
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
                              statsData: globalData,
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                } else if (snapshot.hasError) {
                  mainWidget = Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 60,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Error: ${snapshot.error}'),
                      ],
                    ),
                  );
                } else {
                  mainWidget = Center(
                    child: CircularProgressIndicator(),
                  );
                }

                return mainWidget;
              }),
        ),
      ),
    );
  }
}

class StatsColumn extends StatelessWidget {
  final CrossAxisAlignment columnTextAlignment;
  final Map statsData;

  StatsColumn({@required this.columnTextAlignment, @required this.statsData});

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
          Numeral(statsData['confirmed']).value(),
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
          Numeral(statsData['deaths']).value(),
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
          Numeral(statsData['recovered']).value(),
          style: kStatsRecoveredStyle,
        ),
      ],
    );
  }
}
