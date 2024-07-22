// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';

class MyChart extends StatefulWidget {
  const MyChart({super.key});

  @override
  State<MyChart> createState() => _MyChartState();
}

class _MyChartState extends State<MyChart> {
  BarChartGroupData makeGroupData(int x, double y) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xFFFF8D6C),
              Color(0xFFE064F7),
              Color(0xFF00B2E7),
            ],
            transform: const GradientRotation(pi / 40),
          ),
          width: 12,
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: 15,
            color: AppColors.darkGrey,
          ),
        ),
      ],
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(
        8,
        (i) {
          switch (i) {
            case 0:
              return makeGroupData(0, 2);
            case 1:
              return makeGroupData(1, 1);
            case 2:
              return makeGroupData(2, 9);
            case 3:
              return makeGroupData(3, 5);
            case 4:
              return makeGroupData(4, 7);
            case 5:
              return makeGroupData(5, 10);
            case 6:
              return makeGroupData(6, 6);
            case 7:
              return makeGroupData(7, 15);

            default:
              return throw Error();
          }
        },
      );

  @override
  Widget build(BuildContext context) {
    return BarChart(
      mainBarData(),
    );
  }

  BarChartData mainBarData() {
    return BarChartData(
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 38,
            getTitlesWidget: getTiles,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 38,
            getTitlesWidget: leftTiles,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      gridData: const FlGridData(
        show: false,
      ),
      barGroups: showingGroups(),
    );
  }

  Widget getTiles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: AppColors.black,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text(
          '01',
          style: style,
        );
        break;
      case 1:
        text = const Text(
          '02',
          style: style,
        );
        break;
      case 2:
        text = const Text(
          '03',
          style: style,
        );
        break;
      case 3:
        text = const Text(
          '04',
          style: style,
        );
        break;
      case 4:
        text = const Text(
          '05',
          style: style,
        );
        break;
      case 5:
        text = const Text(
          '06',
          style: style,
        );
        break;
      case 6:
        text = const Text(
          '07',
          style: style,
        );
        break;
      case 7:
        text = const Text(
          '08',
          style: style,
        );
        break;
      default:
        text = const Text(
          '',
          style: style,
        );
        break;
    }
    return SideTitleWidget(
      child: text,
      axisSide: meta.axisSide,
      space: 16,
    );
  }

  Widget leftTiles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: AppColors.black,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    if (value == 0) {
      text = '1M';
    } else if (value == 6) {
      text = '5M';
    } else if (value == 10) {
      text = '10M';
    } else if (value == 15) {
      text = '15M';
    } else {
      return Container();
    }
    return SideTitleWidget(
      child: Text(
        text,
        style: style,
      ),
      axisSide: meta.axisSide,
      space: 0,
    );
  }
}
