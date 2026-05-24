import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lottie/lottie.dart';
import 'package:project01/models/weather_model.dart';
import 'package:project01/services/weather_service.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _weatherService = WeatherService(dotenv.env['API_KEY']!);

  Weather? _weather;

  _fetchWeather() async {
    String city = await _weatherService.getCurrentCity();

    try {
      Weather weather = await _weatherService.fetchWeather(city);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print('Error fetching weather data: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching weather data: $e')),
      );
    }
  }

  String getWeatherAnimation(String? mainCondition) {
    if (mainCondition == null) return 'assets/Sunny.json';

    switch (mainCondition.toLowerCase()) {
      case 'clear':
        return 'assets/Sunny.json';
      case 'clouds':
        return 'assets/Sunny.json';
      case 'rain':
        return 'assets/Raining.json';
      case 'snow':
        return 'assets/Raining.json';
      default:
        return 'assets/Sunny.json';
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather App'), backgroundColor: Colors.grey),
      backgroundColor: Colors.cyan,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20.0,
          children: [
            Text(
              _weather?.cityName ?? 'Loading...',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            Container(
              width: 250,
              height: 250,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white, width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
              clipBehavior: Clip.antiAlias,
              child: Lottie.asset(
                getWeatherAnimation(_weather?.mainCondition),
                fit: BoxFit.cover,
              ),
            ),
            Column(
              children: [
                Text(
                  _weather?.mainCondition ?? '',
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  '${_weather?.temperature.round()}°C',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
