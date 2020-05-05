import 'package:flutter/material.dart';
import 'package:studentcontrolapp/screens/studentChart.dart';
import 'package:studentcontrolapp/screens/studentInsert.dart';
import 'package:studentcontrolapp/screens/studentList.dart';

class DrawerItem{
  String title;
  IconData icon;
  DrawerItem(this.title,this.icon);
}


class HomePage extends StatefulWidget{
  final drawerItems=[
    new DrawerItem("Öğrenci Listesi", Icons.list),
    new DrawerItem("Öğrenci Ekle", Icons.add),
    new DrawerItem("Grafik", Icons.insert_chart),
  ];

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return HomePageState();
  }
}

class HomePageState extends State<HomePage>{
  int _selectDrawerIndex=0;
  _getDrawerItemWidget(int pos){
    switch(pos){
      case 0:
        return new StudentList();
      case 1:
        return new StudentInsert();
      case 2:
        return new StudentChart();
      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index){
    setState(()=>_selectDrawerIndex=index);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var drawerOption=<Widget>[];
    for(var i=0;i<widget.drawerItems.length;i++){
      var d=widget.drawerItems[i];
      drawerOption.add(
        new ListTile(
          leading: new Icon(d.icon),
          title: new Text(d.title),
          selected: i==_selectDrawerIndex,
          onTap: ()=>_onSelectItem(i),
        )
      );
    }
    
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.drawerItems[_selectDrawerIndex].title),
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("Menü"), accountEmail: null),
            new Column(
              children: drawerOption,
            )
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectDrawerIndex),
    );
  }

  /*void noteInsertGo() async{
    bool result= await Navigator.push(context, MaterialPageRoute(builder:(context)=>StudentInsert()));
  }*/

}
