import 'dart:io';
import 'dart:ui';
import 'dart:math';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:weatherbox/styles/styles.dart';

import 'package:weatherbox/unsplash/unsplash_api.dart';
import 'package:weatherbox/ui.dart';
import 'package:weatherbox/app_data.dart';
import 'package:weatherbox/settings.dart';

void main() async {
  runApp(const WeatherApp());
}

class WeatherApp extends StatefulWidget {
  const WeatherApp({super.key});

  @override
  State<WeatherApp> createState() => _WeatherApp();
}

class _WeatherApp extends State<WeatherApp> {
  int photoIndex = Random().nextInt(downloadedPhotos);
  bool isPhotoVisible = true;
  bool isDataLoaded = false;
  late DataModel data;
  Timer? timer;

  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: intervalBetweenPhotos), (timer) {
      setState(() {
        isPhotoVisible = false;
        sleep(const Duration(microseconds: 2500));
        photoIndex = Random().nextInt(downloadedPhotos);
        isPhotoVisible = true;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  FutureBuilder getApiData(BuildContext context) {
    return FutureBuilder(
        future: getAppData(),
        builder: ((context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('error'),
            );
          } else if (snapshot.hasData) {
            data = snapshot.data as DataModel;
            isDataLoaded = true;
            return getStack();
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Image(image: AssetImage('assets/images/app_icon.png'), width: 100, height: 100),
                  Text('weatherBox', style: Style.appNameTextStyle),
                  Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 10),
                  ),
                  CircularProgressIndicator(),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Text('loading weather data...', style: Style.attributionUrlTextStyle),
                  ),
                ],
              ),
            );
          }
        }));
  }

  Stack getStack() {
    return Stack(children: [
      PhotoView(
        photos: data.photos,
        isPhotoVisible: isPhotoVisible,
        photoIndex: photoIndex,
      ),
      SingleChildScrollView(
        child: MainView(
            weather: data.weather, locationInfo: data.locationInfo, aqi: data.aqi, photo: data.photos[photoIndex]),
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    var body = isDataLoaded ? getStack() : getApiData(context);

    return MaterialApp(
      title: 'WeatherBox',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: AnimatedOpacity(
            opacity: isPhotoVisible ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 2500),
            curve: Curves.easeInOut,
            child: body),
      ),
    );
  }
}

class PhotoView extends StatelessWidget {
  const PhotoView({super.key, required this.photos, required this.isPhotoVisible, required this.photoIndex});

  final List<Photo> photos;
  final int photoIndex;
  final bool isPhotoVisible;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: NetworkImage(photos[photoIndex].url))),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
        child: Container(
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.6)),
        ),
      ),
    );
  }
}
