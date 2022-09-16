import 'package:flutter/material.dart';
import 'package:simple_weather_app/weather.dart';

class ShowWeather extends StatelessWidget {
  const ShowWeather({super.key, required this.input});

  final Weather input;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather for: ${input.region}'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          Center(
              child: Image.network(input.currentConditions.iconUrl)
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text('Weather: '),
            trailing: Text(input.currentConditions.comment),
          ),
          const Divider(
          color: Colors.grey,
          ),
          ListTile(
            title: Text('Temperature: '),
            trailing: Text('${input.currentConditions.temp.c} °C'),
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text('Humidity: '),
            trailing: Text(input.currentConditions.humidity),
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text('Wind: '),
            trailing: Text('${input.currentConditions.wind.km} km'),
          ),
          const Divider(
            color: Colors.grey,
          ),
          ListTile(
            title: Text('Precipitation: '),
            trailing: Text(input.currentConditions.precip),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 150.0),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Go back!'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}