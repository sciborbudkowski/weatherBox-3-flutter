import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:weatherbox/settings.dart';
import 'package:weatherbox/pirate/weather_models.dart';

class Photo {
  final String url;
  final String username;
  final String name;
  final String profileUrl;

  const Photo({
    required this.url,
    required this.username,
    required this.name,
    required this.profileUrl,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      url: json['urls']['regular'] as String,
      username: json['user']['username'] as String,
      name: json['user']['name'] as String,
      profileUrl: json['user']['links']['html'] as String,
    );
  }
}

class UnsplashPhoto {
  static List<Photo> parsePhotos(String responseBody) {
    final data = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return data.map<Photo>((json) => Photo.fromJson(json)).toList();
  }

  static Future<List<Photo>> fetchPhotos(
      http.Client client, int hemisphere) async {
    var keywords = Season.determineKeywords(hemisphere).join(',');
    var url = unsplashApiUrlString.replaceAll('%query', keywords);
    print(url);
    final response = await client.get(Uri.parse(url));
    return compute(parsePhotos, response.body);
  }
}
