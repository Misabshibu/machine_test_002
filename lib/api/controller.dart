import 'package:http/http.dart' as http;
import 'package:machine_test_login/api/data_model.dart';

class DetailsNetworkServices {
  static const url = 'https://imdb-top-100-movies.p.rapidapi.com/';

  static Future<List<MovieData>> fetchMovieDatas() async {
    final uri = Uri.parse(url);
    final response = await http.get(uri, headers: {
      'X-RapidAPI-Key': '722d2b10fdmshcba294b6ec87b82p1a2351jsn354a20cc9126',
      'X-RapidAPI-Host': 'imdb-top-100-movies.p.rapidapi.com'
    });
    final json = movieDataFromJson(response.body);
    return json;
  }
}
