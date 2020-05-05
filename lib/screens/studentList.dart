import 'dart:async';

import 'package:flutter/material.dart';
import 'package:studentcontrolapp/db/dbHelper.dart';
import 'package:studentcontrolapp/models/student.dart';
import 'package:studentcontrolapp/screens/showSimpleCustomDialog.dart';

import '../main.dart';

class StudentList extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StudentListState();
  }

}

class StudentListState extends State<StudentList>{
  var refreshkey = GlobalKey<RefreshIndicatorState>();

 DbHelper dbHelper=new DbHelper();
 List<Student> studentList;
 int count=0;



  @override
  Widget build(BuildContext context) {

    // TODO: implement build
    if(studentList==null){
      studentList=new List<Student>();
      getStudents();
    }
    return studentDataList();
  }

  //Öğrencileri metot olarak listeler
  RefreshIndicator studentDataList(){
    return RefreshIndicator(
      key:refreshkey,
      child: ListView.builder(
        itemCount: count,
        itemBuilder: (BuildContext context, int position){
          return Card(
            color:Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                //foregroundColor: Colors.black,
                backgroundColor:this.studentList[position].gender==0?Colors.blue:Colors.pink,
                child: Text(this.studentList[position].gender==0?"E":"K",style:TextStyle(color: Colors.black),), /*Icon(
                Icons.arrow_forward_ios,
                color: Colors.black,
                size: 20,
              ),*/
              ),
              title: Text(this.studentList[position].firstName,style:TextStyle(fontWeight: FontWeight.w500),),
              subtitle: Text(this.studentList[position].lastName,style: TextStyle(fontWeight: FontWeight.w500),),
              onTap: (){
                //Navigator.push(context, MaterialPageRoute(builder:(context)=>StudentList()));
                //print(MyApp.status);
                showSimpleCustomDialog(context,this.studentList[position]);

                //print(MyApp.status);
              },

            ),
          );
        },
      ),
      onRefresh: refreshlist,
    );

  }

  Future<Null> refreshlist() async {
    refreshkey.currentState?.show(
        atTop:
        true); // change atTop to false to show progress indicator at bottom
    await Future.delayed(Duration(seconds: 1)); //wait here for 2 second
    setState(() {
      getStudents();
      //list = List.generate(random.nextInt(10), (i) => " Item $i");
    });
  }

  void getStudents(){
    //print("Get Student worked");
       var studentsFuture=dbHelper.getStudentList();
       studentsFuture.then((data){
         List<Student> studentsData=new List<Student>();
         var getStudentNumber=data.length;
         for(var i=0;i<getStudentNumber;i++){
           studentsData.add(Student.fromObject(data[i]));
         }
         setState(() {
           studentList=studentsData;
           count=getStudentNumber;
         });
       });

  }

}