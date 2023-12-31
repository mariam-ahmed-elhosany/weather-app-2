import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app_with_cubit/models/weather_model.dart';
import 'package:weather_app_with_cubit/services/weather_services.dart';

class SearchView extends StatelessWidget {
   SearchView({Key? key}) : super(key: key);
  TextEditingController controller=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search city'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(
            onSubmitted: (value)async{
            WeatherModel weatherModel= await WeatherServices(Dio()).getWeather(cityName: value);
            log(weatherModel.cityName);
            },
            decoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 32, horizontal: 16),
              label: Text('Search'),
              hintText: 'Enter City Name',
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.green),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
