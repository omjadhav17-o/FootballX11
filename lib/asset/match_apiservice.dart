import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:footba11x/models/finished_matchs.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ApiServiceMatch {
  final String apiKey = dotenv.env['API_KEY'] ?? 'default_api_key';
  final String apiUrl = dotenv.env['API_URL'] ?? 'https://default_url';

  Future<List<MatchA>> fetchData() async {
    final today = DateTime.now();
    final yesterday = today.subtract(const Duration(days: 1));

    final dateFormat = DateFormat('yyyy-MM-dd');
    final datefrom = dateFormat.format(yesterday);
    final dateto = dateFormat.format(today);

    final url =
        Uri.parse('$apiUrl?dateFrom=$datefrom&dateTo=$dateto&status=FINISHED');

    final response = await http.get(url, headers: {
      'X-Auth-Token': apiKey,
    });

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      List<dynamic> matchesJson = jsonData['matches'];

      List<MatchA> matches =
          matchesJson.map((matchJson) => MatchA.fromJson(matchJson)).toList();

      return matches;
    } else {
      throw Exception('Failed to load data: ${response.reasonPhrase}');
    }
  }
}

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  // Your app code here
}
