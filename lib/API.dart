import 'dart:convert' show json, utf8;
import 'dart:io';
import 'dart:async';

import 'package:ordinarioflutter/repo.dart';

class Api {
  static final HttpClient _httpClient = HttpClient();
  static final String _url = "www.metaweather.com";

  static Future<List<Repo>> getRepositoriesWithSearchQuery(String query) async {
    final uri = Uri.https(_url, '/api/location/search/', {
      'query': query,
    });

    List<Repo> res = await _getJson(uri);
    if (res == null) {
      return null;
    }

    if (res == null) {
      return List();
    }

    return Repo.mapJSONStringToList(res);
  }

  static Future<List<Repo>> getTrendingRepositories() async {
    final uri = Uri.https(_url, '/api/location/search/', {
      'query': "a"
    });

   List<Repo> res = await _getJson(uri);
    if (res == null) {
      return null;
    }
    if (res == null) {
      return List();
    }

    return Repo.mapJSONStringToList(res);
  }

  static Future<List<Repo>>_getJson(Uri uri) async {
    try {
      final httpRequest = await _httpClient.getUrl(uri);
      final httpResponse = await httpRequest.close();
      if (httpResponse.statusCode != HttpStatus.OK) {
        return null;
      }
      final responseBody = await httpResponse.transform(utf8.decoder).join();
      final jsonbody = json.decode(responseBody);
      List<Repo> city = jsonbody.map<Repo>((element){
        String title = element['title'];
        String woeid = element['woeid'].toString();
        return Repo(_url,title,woeid);
      }).toList();
      return city;
    } on Exception catch (e) {
      print('$e');
      return null;
    }
  }
}
