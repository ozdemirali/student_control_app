

import 'package:flutter/material.dart';
import 'package:studentcontrolapp/screens/studentInsert.dart';
import 'package:studentcontrolapp/screens/studentList.dart';

class MyDrawer extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyDrawerState();
  }
}

class MyDrawerState extends State<MyDrawer>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text("Menü"),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text("Yeni Kayit"),
            onTap: (){
              print("Yeni Kayıt");
              studentInsertGo();
              //Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text("Listeleme"),
            onTap: (){
              print("Listeleme");
              studentList();
              //Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.insert_chart),
            title: Text("Grafik"),
            onTap: (){
              print("Garafik");
              //Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
  void studentInsertGo() async{
    bool result= await Navigator.push(context, MaterialPageRoute(builder:(context)=>StudentInsert()));
  }
  void studentList() async{
    bool result= await Navigator.push(context, MaterialPageRoute(builder:(context)=>StudentList()));
  }
}