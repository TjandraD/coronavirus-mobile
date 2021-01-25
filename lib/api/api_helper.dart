import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiHelper {
  String baseApiUrl = 'https://covid19.mathdro.id/api';

  Future<Map> getGlobalData() async {
    var globalResponse = await http.get(baseApiUrl);
    var countriesResponse = await http.get('$baseApiUrl/countries');

    var globalResponseBody = jsonDecode(globalResponse.body);
    var countriesResponseBody = jsonDecode(countriesResponse.body);

    Map globalData = {
      'globalData': {
        'confirmed': globalResponseBody['confirmed']['value'],
        'deaths': globalResponseBody['deaths']['value'],
        'recovered': globalResponseBody['recovered']['value'],
      },
      'countriesList': countriesResponseBody['countries'],
    };
    return globalData;
  }

  Future<Map> getCountriesData(String countryCode) async {
    var apiResponse = await http.get('$baseApiUrl/countries/$countryCode');
    var responseBody = jsonDecode(apiResponse.body);

    Map countryData = {
      'confirmed': responseBody['confirmed']['value'],
      'deaths': responseBody['deaths']['value'],
      'recovered': responseBody['recovered']['value'],
    };
    return countryData;
  }
}
