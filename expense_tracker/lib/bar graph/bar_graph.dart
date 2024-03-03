import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'individual_bar.dart';

class MyBarGraph extends StatefulWidget {
  final List<double> monthlySummary;
  final int startMonth;

  MyBarGraph({
    super.key,
    required this.monthlySummary,
    required this.startMonth,
  });

  @override
  State<MyBarGraph> createState() => _MyBarGraphState();
}

class _MyBarGraphState extends State<MyBarGraph> {
  // Below list will hold data for each bar
  List<IndividualBar> barData = [];

  // initialize the bar data --> Use the monthly summary to create list of bars
  void intializebarData() {
    barData = List.generate(
        widget.monthlySummary.length,
        (index) => IndividualBar(
              x: index,
              y: widget.monthlySummary[index],
            ));
  }

  // recalculate upper limit of graph
  double calculateUpperLimit(){
    // Initially set it to 10000 Rs
    double max = 10000;

    // get month with max spend
    widget.monthlySummary.sort();
    max = widget.monthlySummary.last * 1.05;
    if(max<10000){
      return 10000;
    }else{
      return max;
    }
  }

  @override
  Widget build(BuildContext context) {
    // Initialize upon build
    intializebarData();

    // Bar Graph Dimensions
    double barWidth = 20;
    double spaceBetweenBars = 50;

    // UI
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: SizedBox(
          width: barWidth*barData.length + spaceBetweenBars*(barData.length-1),
          child: BarChart(
            BarChartData(
              minY: 0,
              maxY: calculateUpperLimit(),
              gridData: const FlGridData(show: false),
              borderData: FlBorderData(show: false),
              titlesData: const FlTitlesData(
                show: true,
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: getBottomTitles,
                    reservedSize: 24,
                  ),
                ),
              ),
              barGroups: barData
                  .map(
                    (data) => BarChartGroupData(
                      x: data.x,
                      barRods: [
                        BarChartRodData(
                          toY: data.y,
                          width: barWidth,
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.grey.shade800,
                          backDrawRodData: BackgroundBarChartRodData(
                            show: true,
                            toY: calculateUpperLimit(),
                            color: Colors.white
                          ),
                        ),
                      ]
                    ),
                  ).toList(),
              alignment: BarChartAlignment.end,
              groupsSpace: spaceBetweenBars,
            ),
          ),
        ),
      ),
    );
  }
}

// Bottom Titles
Widget getBottomTitles(double value, TitleMeta meta) {
  const textstyle = TextStyle(
    color: Colors.grey,
    fontSize: 14,
  );
  String text;
  switch (value.toInt() % 12) {
    case 0:
      text = "J";
      break;
    case 1:
      text = "F";
      break;
    case 2:
      text = "M";
      break;
    case 3:
      text = "A";
      break;
    case 4:
      text = "M";
      break;
    case 5:
      text = "J";
      break;
    case 6:
      text = "J";
      break;
    case 7:
      text = "A";
      break;
    case 8:
      text = "S";
      break;
    case 9:
      text = "O";
      break;
    case 10:
      text = "N";
      break;
    case 11:
      text = "D";
      break;
    case 12:
      text = "J";
      break;
    default:
      text = "";
      break;
  }
  return SideTitleWidget(
      child: Text(
        text,
        style: textstyle,
      ),
      axisSide: meta.axisSide);
}
