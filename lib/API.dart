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

    final jsonResponse = await _getJson(uri);
    if (jsonResponse == null) {
      return null;
    }
    if (jsonResponse['errors'] != null) {
      return null;
    }
    if (jsonResponse['title'] == null) {
      return List();
    }
    return Repo.mapJSONStringToList(jsonResponse['title']);
  }

  static Future<List<Repo>> getTrendingRepositories() async {
    final uri = Uri.https(_url, '/api/location/search/', {
      'query': "a"
    });

    final jsonResponse = await _getJson(uri);
    if (jsonResponse == null) {
      return null;
    }
    if (jsonResponse['errors'] != null) {
      return null;
    }
    if (jsonResponse['title'] == null) {
      return List();
    }
    return Repo.mapJSONStringToList(jsonResponse['title']);
  }

  static Future<Map<String, dynamic>> _getJson(Uri uri) async {
    try {
      final httpRequest = await _httpClient.getUrl(uri);
      final httpResponse = await httpRequest.close();
      if (httpResponse.statusCode != HttpStatus.OK) {
        return null;
      }

      final responseBody = await httpResponse.transform(utf8.decoder).join();
      return json.decode(responseBody);
    } on Exception catch (e) {
      print('$e');
      return null;
    }
  }
}
