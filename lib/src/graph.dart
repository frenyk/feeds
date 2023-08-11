import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class GraphPage extends StatelessWidget {
  GraphPage({super.key});
  Map<String, double> dataMap = {
    '🤩': 40,
    '😊': 30,
    '🙂': 10,
    '😐': 10,
    '😑': 10
  };

  List<Color> colorList = [
    Colors.green,
    Colors.blue,
    Color.fromARGB(255, 174, 156, 133),
    Colors.orange,
    Colors.red,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Feedback')),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            chart(dataMap: dataMap, colorList: colorList),
            SizedBox(
              height: 20,
            ),
            Text(
              "Breakfast",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 20,
            ),
            chart(dataMap: dataMap, colorList: colorList),
            SizedBox(
              height: 20,
            ),
            Text(
              "Lunch",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 20,
            ),
            chart(dataMap: dataMap, colorList: colorList),
            SizedBox(
              height: 20,
            ),
            Text(
              "Dinner",
              style: TextStyle(fontSize: 25),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}

class chart extends StatelessWidget {
  const chart({
    super.key,
    required this.dataMap,
    required this.colorList,
  });

  final Map<String, double> dataMap;
  final List<Color> colorList;

  @override
  Widget build(BuildContext context) {
    return PieChart(
      dataMap: dataMap,
      colorList: colorList,
      chartRadius: MediaQuery.of(context).size.width / 2.7,
      chartType: ChartType.ring,
      // ignore: prefer_const_constructors
      legendOptions: LegendOptions(
          showLegendsInRow: false,
          // legendPosition: LegendPosition.bottom,
          legendTextStyle: TextStyle(fontSize: 20)),
    );
  }
}
