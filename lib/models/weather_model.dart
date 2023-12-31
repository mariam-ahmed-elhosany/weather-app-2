class WeatherModel {
  final String cityName;
  final String? img;
  final String lastUpdated;
  final double temp;
  final double maxTemp;
  final double minTemp;
  final String condition;

  WeatherModel({required this.cityName,
    required this.lastUpdated,
    required this.temp,
    required this.maxTemp,
    required this.minTemp,
    required this.condition,
    this.img});

  factory WeatherModel.fromJson(json){
    return WeatherModel(
        cityName: json['location']['name'],
        lastUpdated: json['current']['last_updated'],
        temp: json['forecast'][0]['day']['avgtemp_c'],
        maxTemp: json['forecast'][0]['day']['maxtemp_c'],
        minTemp: json['forecast'][0]['day']['mintemp_c'],
        condition:json['forecast'][0]['day']['condition']['text'],
        img:json['forecast'][0]['day']['condition']['icon']
    );
  }

}