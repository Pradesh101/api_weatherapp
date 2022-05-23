import 'package:flutter/material.dart';
import 'package:weather_api/models/weather_model.dart';
import 'package:weather_api/services/weather_services.dart';

import 'widgets/forcast.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<WeatherData>? data;
  List<Forecast> forcastData = [];

  @override
  void initState() {
    data = getWeatherData();
    // print(data);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        //backgroundColor: Colors.transparent,
        title: const Text('WEATHER'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.indigo, Colors.purple]),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            FutureBuilder<WeatherData>(
                future: data,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    forcastData = snapshot.data!.forecast!.toList();
                    return Padding(
                      padding: const EdgeInsets.only(top: 150),
                      child: Column(
                        children: [
                          Text(
                            snapshot.data!.temperature.replaceAll(' Â', ''),
                            style: const TextStyle(
                                fontSize: 80, color: Colors.white),
                          ),
                          Text(
                            snapshot.data!.description!,
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white),
                          ),
                          Text(
                            snapshot.data!.wind!,
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white),
                          ),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return const Text('error');
                  }
                  return const Center(child: CircularProgressIndicator());
                  // })
                }),
            const SizedBox(
              height: 200,
            ),
            Expanded(
              child: fcData(fList: forcastData),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
