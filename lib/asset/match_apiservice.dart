import 'dart:convert';
import 'package:footba11x/models/finished_matchs.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ApiServiceMatch {
  final String apiKey = '61f0c4f1a8d14152aa3ae1d140e0ac22';
  // final String apiHost = 'api.football-data.org';

  Future<List<MatchA>> fetchData() async {
    // final today = DateFormat('yyyy-MM-dd').format(DateTime.now());
    final today = DateTime.now();
    final yesterday = today.subtract(const Duration(days: 1));

    // Format the dates
    final dateFormat = DateFormat('yyyy-MM-dd');
    final datefrom = dateFormat.format(yesterday);
    final dateto = dateFormat.format(today);

    final url = Uri.parse(
        'https://api.football-data.org/v4/competitions/EC/matches?dateFrom=$datefrom&dateTo=$dateto&status=FINISHED');
    // final uri =
    //     Uri.https('api.football-data.org', '/v4/competitions/EC/matches');
    // print('here');
    final response = await http.get(url, headers: {
      'X-Auth-Token': apiKey,
    });
    // print('after process the response:');
    // print(response.body);
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      // print(jsonData);
      List<dynamic> matchesJson = jsonData['matches'];

      List<MatchA> matches =
          matchesJson.map((matcheJson) => MatchA.fromJson(matcheJson)).toList();

      // print(matches);
      return matches;
    } else {
      throw Exception('Failed to load data: ${response.reasonPhrase}');
    }
  }
}
