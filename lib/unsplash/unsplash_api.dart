import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:weatherbox/settings.dart';

class Photo {
  final String url;
  final String username;
  final String name;

  const Photo({
    required this.url,
    required this.username,
    required this.name,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      url: json['urls']['regular'] as String,
      username: json['user']['username'] as String,
      name: json['user']['name'] as String,
    );
  }
}

class UnsplashPhoto {
  static List<Photo> parsePhotos(String responseBody) {
    final data = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return data.map<Photo>((json) => Photo.fromJson(json)).toList();
  }

  static Future<List<Photo>> fetchPhotos(http.Client client) async {
    final response = await client.get(unsplashApiUrl);
    return compute(parsePhotos, response.body);
  }
}
