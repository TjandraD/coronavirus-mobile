import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiHelper {
  String baseApiUrl = 'https://covid19.mathdro.id/api';

  Future<Map> getGlobalData() async {
    var response = await http.get(baseApiUrl);
    var responseBody = jsonDecode(response.body);
    Map globalData = {
      'confirmed': responseBody['confirmed']['value'],
      'deaths': responseBody['deaths']['value'],
      'recovered': responseBody['recovered']['value']
    };
    print(globalData);
    return globalData;
  }
}
