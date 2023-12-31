import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app_with_cubit/models/weather_model.dart';

class WeatherServices {
  final Dio dio;
  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = '18952cef035347e79b5205940232912';

  WeatherServices(this.dio);

  Future<WeatherModel> getWeather({required String cityName}) async {
    try {
      Response response = await dio.get('http://api.weatherapi.com/v1/forecast.json?key=18952cef035347e79b5205940232912&q=$cityName&days=1');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'There was an error try again later ';
      throw Exception(errorMessage);
    }
    catch(e){
      log(e.toString());
      throw Exception( 'There was an error try again later ');
    }
  }
}
