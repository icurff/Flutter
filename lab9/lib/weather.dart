import 'location.dart';
import 'networking.dart';

const apiKey = 'bd5e378503939ddaee76f12ad7a97608';
const openWeatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    final NetworkHelper networkHelper = NetworkHelper(
      '$openWeatherMapURL?q=$cityName&appid=$apiKey&units=metric',
    );

    return networkHelper.getData();
  }

  Future<dynamic> getLocationWeather() async {
    final Location location = Location();
    await location.getCurrentLocation();

    if (location.latitude == null || location.longitude == null) {
      return null;
    }

    final NetworkHelper networkHelper = NetworkHelper(
      '$openWeatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric',
    );

    return networkHelper.getData();
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return 'storm';
    } else if (condition < 400) {
      return 'rain';
    } else if (condition < 600) {
      return 'umbrella';
    } else if (condition < 700) {
      return 'snow';
    } else if (condition < 800) {
      return 'fog';
    } else if (condition == 800) {
      return 'sun';
    } else if (condition <= 804) {
      return 'cloud';
    } else {
      return 'weather';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It is ice cream time';
    } else if (temp > 20) {
      return 'Time for shorts and a t-shirt';
    } else if (temp < 10) {
      return 'You will need a scarf and gloves';
    } else {
      return 'Bring a jacket just in case';
    }
  }
}
