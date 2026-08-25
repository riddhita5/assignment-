
import '../models/weather_model.dart';

class WeatherRemoteDataSource {
  Future<WeatherModel> getWeather(
      String city,
      ) async {
    await Future.delayed(
      const Duration(seconds: 2),
    );

    return WeatherModel(
      city: city,
      temperature: 30.5,
      description: 'Sunny',
    );
  }
}
