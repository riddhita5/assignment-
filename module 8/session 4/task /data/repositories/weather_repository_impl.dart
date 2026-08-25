import '../../domain/enities/weather.dart';
import '../../domain/repositories/weather_repositories.dart';
import '../datasources/weather_remote_datasource.dart';

class WeatherRepositoryImpl
    implements WeatherRepository {

  final WeatherRemoteDataSource dataSource;

  WeatherRepositoryImpl({
    required this.dataSource,
  });

  @override
  Future<Weather> getWeather(
      String city,
      ) async {
    return await dataSource.getWeather(city);
  }
}
