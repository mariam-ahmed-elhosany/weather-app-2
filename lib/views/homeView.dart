import 'package:flutter/material.dart';
import 'package:weather_app_with_cubit/views/search_view.dart';
class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Weather App'),
          actions: [
            IconButton(onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context){
                  return SearchView();
                }),
              );
            }, icon:Icon (Icons.search)),
          ],

        ),
        body: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'there is no weather 😔 start',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),])
    );
  }
}
