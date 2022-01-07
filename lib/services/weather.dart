import 'package:clima/screens/location.dart';
import 'package:clima/services/networking.dart';

const apiKey='1387927462e966fcc723ded281557672';
const apiUpperUrl='https://api.openweathermap.org/data/2.5/weather';


class WeatherModel {


  Future<dynamic> getCityWeather(String city)async{

    NetworkHelper networkHelper=NetworkHelper('$apiUpperUrl?q=$city&appid=1387927462e966fcc723ded281557672&units=metric');
    var weatherData=await networkHelper.getLocation();

  return weatherData;
  }


  Future<dynamic> getLocationWeather() async{
    Location location= Location();
    await location.getCurrentPosition();
    NetworkHelper networkHelper=NetworkHelper(
        '$apiUpperUrl?lat=${location.latitude}&lon=${location.longitude}&appid=1387927462e966fcc723ded281557672&units=metric');

    var weatherData=await networkHelper.getLocation();

    return weatherData;
  }


  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
