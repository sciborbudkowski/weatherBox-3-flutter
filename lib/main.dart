import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:weatherbox/unsplash/unsplash_api.dart';
import 'package:weatherbox/ui.dart';
import 'package:weatherbox/app_data.dart';

void main() async {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WeatherBox',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: FutureBuilder(
            future: getAppData(),
            builder: ((context, snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('error'),
                );
              } else if (snapshot.hasData) {
                var data = snapshot.data as DataModel;

                return Stack(children: [
                  PhotoView(
                    photos: data.photos,
                    isPhotoVisible: true,
                  ),
                  MainView(
                      weather: data.weather,
                      locationInfo: data.locationInfo,
                      aqi: data.aqi),
                ]);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            })),
      ),
    );
  }
}

class PhotoView extends StatelessWidget {
  const PhotoView(
      {super.key, required this.photos, required this.isPhotoVisible});

  final List<Photo> photos;
  final index = 0;
  final bool isPhotoVisible;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: isPhotoVisible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 2500),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(photos[0].url), //NetworkImage(photos[index].url),
        )),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
          child: Container(
            decoration: BoxDecoration(color: Colors.black.withOpacity(0.6)),
          ),
        ),
      ),
    );
  }
}
