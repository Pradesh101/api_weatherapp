import 'package:flutter/material.dart';
import 'package:weather_api/models/weather_model.dart';

Widget fcData({required List<Forecast> fList}) {
  return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: fList.length,
      itemBuilder: ((context, index) {
        var dayValue = fList[index].day!;
        return SizedBox(
          width: 150,
          child: Card(
            color: Colors.blue,
            elevation: 6,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  if (dayValue == '1')
                    Text(
                      'Tomorrow: ${fList[index].day!}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  if (dayValue == '2')
                    Text(
                      'Day after Tomorrow: ${fList[index].day!}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white),
                    ),
                  if (dayValue == '3')
                    Text(
                      'Overmorrow: ${fList[index].day!}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    fList[index].temperature!.replaceAll(' Â', ''),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 40,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    fList[index].wind!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
        );
      }));
}
