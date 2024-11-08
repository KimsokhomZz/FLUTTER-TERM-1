import 'package:flutter/material.dart';

enum WeatherImage {
  sunny(imagePath: 'assets/images/Sunnyweather.png'),
  cloudy(imagePath: 'assets/images/cloudyWeather.png'),
  rainy(imagePath: 'assets/images/rainWeather.png'),
  snowy(imagePath: 'assets/images/snowWeather.png');

  final String imagePath;
  const WeatherImage({required this.imagePath});

  //function to check weather condition
  static String conditionCheck(String condition) {
    switch (condition.toLowerCase()) {
      case 'sunny':
        return sunny.imagePath;
      case 'cloudy':
        return cloudy.imagePath;
      case 'rainy':
        return rainy.imagePath;
      case 'snowy':
        return snowy.imagePath;
      default:
        return 'assets/images/error.png';
    }
  }
}

//WeatherForeccast Widget
class WeatherForecast extends StatelessWidget {
  final String weatherCondition;
  final double minTemp;
  final double maxTemp;
  final String dayOfWeek;

  const WeatherForecast(
      {super.key,
      required this.weatherCondition,
      required this.minTemp,
      required this.maxTemp,
      required this.dayOfWeek});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 150,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            dayOfWeek,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Image.asset(
            WeatherImage.conditionCheck(weatherCondition),
            width: 50,
            height: 50,
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Text(
                '${maxTemp.toStringAsFixed(0)}°C',
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                '${minTemp.toStringAsFixed(0)}°C',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black.withOpacity(0.4),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

//main function
void main() {
  runApp(MaterialApp(
      home: Scaffold(
    appBar: AppBar(
      title: const Text('Weather'),
      backgroundColor: Colors.greenAccent[400],
    ),
    body: const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WeatherForecast(
                  weatherCondition: 'Snowy',
                  minTemp: 2,
                  maxTemp: 14,
                  dayOfWeek: 'Monday'),
              WeatherForecast(
                  weatherCondition: 'Cloudy',
                  minTemp: 23,
                  maxTemp: 30,
                  dayOfWeek: 'Tuesday'),
              WeatherForecast(
                  weatherCondition: 'Rainy',
                  minTemp: 15,
                  maxTemp: 22,
                  dayOfWeek: 'Wednesday'),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WeatherForecast(
                  weatherCondition: 'Rainy',
                  minTemp: 18,
                  maxTemp: 24,
                  dayOfWeek: 'Thursday'),
              WeatherForecast(
                  weatherCondition: 'Cloudy',
                  minTemp: 27,
                  maxTemp: 34,
                  dayOfWeek: 'Friday'),
              WeatherForecast(
                  weatherCondition: 'Sunny',
                  minTemp: 12,
                  maxTemp: 25,
                  dayOfWeek: 'Saturday'),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              WeatherForecast(
                  weatherCondition: 'Snowy',
                  minTemp: -18,
                  maxTemp: -2,
                  dayOfWeek: 'Sunday'),
            ],
          )
        ],
      ),
    ),
  )));
}
