import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:pie_chart/pie_chart.dart';




class StudentChart extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StudentChartState();
  }

}

class StudentChartState extends State<StudentChart>{
      Map <String,double> dataMap=Map();
      List<Color> colorList=[
        Colors.blue,
        Colors.pink,
        Colors.blue,
        Colors.yellow,
      ];


  @override
  void initState(){
    super.initState();
    dataMap.putIfAbsent("Bay",()=>5);
    dataMap.putIfAbsent("Bayan", ()=>8);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Container(
      child: Center(
        child:PieChart(
                  dataMap: dataMap,
                  animationDuration: Duration(milliseconds: 800),
                  chartLegendSpacing: 32.0,
                  chartRadius: MediaQuery.of(context).size.width / 2.7,
                  showChartValuesInPercentage: true,
                  showChartValues: true,
                  showChartValuesOutside: false,
                  chartValueBackgroundColor: Colors.grey[200],
                  colorList: colorList,
                  showLegends: true,
                  legendPosition: LegendPosition.right,
                  decimalPlaces: 1,
                  showChartValueLabel: true,
                  initialAngle: 0,
                  chartValueStyle: defaultChartValueStyle.copyWith(
                  color: Colors.blueGrey[900].withOpacity(0.9),
          ),
          chartType: ChartType.disc,
        ),
      ),
    );
  }
}