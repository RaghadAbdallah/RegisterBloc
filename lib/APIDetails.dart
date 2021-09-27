import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'APIPage.dart';

class WeatherPage extends StatelessWidget {
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather'),
      ),
      body: FutureBuilder(
        future: getWeatherInfo(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError)
            return Center(
              child: Text('${snapshot.error} has occurred.'),
            );
          else if (snapshot.hasData) {
            final Weather weather = snapshot.data as Weather;
            return Center(
              child: Container(
                color: Colors.white24,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.workspaces_filled),
                      Text(
                        'Name, ${weather.name}!',
                        style: TextStyle(fontSize: 40),
                      ),
                      Container(
                        color: Colors.teal,
                        width: 200,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                  '${weather.main.temp} F\nFeels like: ${weather.main.feelsLike} F\nHumidity: ${weather.main.humidity}',
                                  style: TextStyle(fontSize: 20))
                            ],
                          ),
                        ),
                      )
                    ]),
              ),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
