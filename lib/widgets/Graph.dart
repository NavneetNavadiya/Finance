// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Analysis extends StatelessWidget {
  Analysis(this.data);
  Map<String, double> data = {};
  @override
  Widget build(BuildContext context) {
    return PieChart(
        dataMap: data,
        chartType: ChartType.ring,
        chartLegendSpacing: 30,
        ringStrokeWidth: 20,
        animationDuration: Duration(milliseconds: 900),
        chartRadius: MediaQuery.of(context).size.width / 2,
        legendOptions: LegendOptions(
          legendPosition: LegendPosition.top,
          showLegendsInRow: true,
        ));
  }
}
