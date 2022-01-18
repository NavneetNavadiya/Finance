// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Analysis extends StatelessWidget {
  Map<String, double> data = {
    "بيت": 50,
    "التعليم": 30,
    "غذاء": 20,
    "بقالة": 20,
    'الصحة': 20,
    'التسوق': 10,
    'هاتف': 80,
    'آخر': 0
  };
  @override
  Widget build(BuildContext context) {
    return PieChart(
        dataMap: data,
        chartType: ChartType.ring,
        chartLegendSpacing: 100,
        animationDuration: Duration(milliseconds: 800),
        chartRadius: MediaQuery.of(context).size.width / 1,
        legendOptions: LegendOptions(
          legendPosition: LegendPosition.left,
        ));
  }
}
