import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:studentcontrolapp/db/dbHelper.dart';




class StudentChart extends StatefulWidget{
  StudentChart();
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StudentChartState();
  }

}

class StudentChartState extends State<StudentChart>{

     DbHelper db=new DbHelper();
     bool toggle=false;
     double male,female;
      Map <String,double> dataMap=Map();
      List<Color> colorList=[
        Colors.blue,
        Colors.pink,
      ];


  @override
  void initState(){
    //getCount();
    getCountGenders();
    super.initState();
    //print(male.toString()+"male");
    /*dataMap.putIfAbsent("Bay",()=>2);*/
    //dataMap.putIfAbsent("Bayan", ()=>1);
  }

  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    return Container(
      child: Center(
        child:toggle?PieChart(
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
        ): Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.insert_chart),
              iconSize: 100,
              color: Colors.blue,
              tooltip: "Grafik için Tıklayınız",
              onPressed: (){
                togglePieChart();
              },
            ),
            Text("Tıklayınız",style:TextStyle(color: Colors.black) ,),
          ],
        )
      ),
    );
  }

     void togglePieChart() {
       setState(() {
         dataMap.putIfAbsent("Bay",()=>male);
         dataMap.putIfAbsent("Bayan", ()=>female);
         toggle = !toggle;
       });
     }

  void getCountGenders() async {
    db.getCountGenders().then((data){
      List<int> genderData=new List<int>();
      for(var i=0;i<data.length;i++){
        //print(data[i]);
        genderData.add(data[i]);
      }
      setState(() {
        male=genderData[0].toDouble();
        female=genderData[1].toDouble();
      });
    });
}
}