import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:simple_weather_app/show_weather.dart';
import 'package:simple_weather_app/weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tims simple weather app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var txt = TextEditingController();
  var showLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tim's simple weather app"),
      ),
      body: !showLoading ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            const Text(
              'Input your location:',
              style: TextStyle(fontSize: 36),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Location',
                ),
                controller: txt,
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.black87,
                minimumSize: const Size(100, 60),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
              ),
              onPressed: () {
                setState(() {
                  showLoading = true;
                });
                _getWeather().then((weather) => {
                      setState(() {
                        showLoading = false;
                      }),
                      if (weather != null)
                        {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    ShowWeather(input: weather)),
                          ),
                        }
                      else
                        {
                          showErrorAlert(context),
                        }
                    });
              },
              child: const Text('Get Todays Weather'),
            )
          ],
        ),
      ) : const Center(child: CircularProgressIndicator()),
    );
  }

  Future<Weather?> _getWeather() async {
    var request = Request(
        'GET',
        Uri.parse(
            'https://weatherdbi.herokuapp.com/data/weather/${txt.text}'));
    StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final output = await response.stream.bytesToString();
      try{
        return weatherFromJson(output);
      } catch (e){
        return null;
      }
    } else {
      print(response.reasonPhrase);
    }
    return null;
  }

  void showErrorAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => const AlertDialog(
              content: Text("This location doesn't exist or you are offline."),
            ));
  }
}
