import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:fd11/services/weather.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    //Running getLocationData() asap, so putting it in initState()
    getLocationData();
  }

  void getLocationData() async {
    //come from weather.dart
    var weatherData = await WeatherModel().getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      //come from location_screen.dart
      return LocationScreen(locationWeather: weatherData);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Weather 🌤 App"),
          centerTitle: true,
          backgroundColor: Colors.black12,
        ),
        body: Center(
          child: SpinKitDoubleBounce(
            color: Colors.greenAccent,
            size: 120,
          ),
        ));
  }
}
