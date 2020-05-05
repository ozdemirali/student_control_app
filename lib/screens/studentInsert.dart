import 'package:flutter/material.dart';
import 'package:studentcontrolapp/db/dbHelper.dart';
import 'package:studentcontrolapp/models/student.dart';


import '../main.dart';

class StudentInsert extends StatefulWidget {
  Student student;
  StudentInsert([this.student]);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return StudentInsertState(student);
  }
}

class StudentInsertState extends State<StudentInsert> {
 Student student;
 StudentInsertState([this.student]);

  DbHelper db=new DbHelper();
  TextEditingController txtFistName=new TextEditingController();
  TextEditingController txtLastName=new TextEditingController();
  TextEditingController txtEmail=new TextEditingController();
  TextEditingController txtNo=new TextEditingController();


  final _formKey = GlobalKey<FormState>();

  String selectedGender="Bay";
  List<String> genders=["Bay","Bayan"];
  int gender=0;


  //String dropDownValue="Bay";
  @override
  Widget build(BuildContext context) {
    //int gender=genders.indexOf(selectedGender)
    // TODO: implement build
    //print(student);
    if(student!=null){
      txtFistName.text=student.firstName;
      txtLastName.text=student.lastName;
      txtEmail.text=student.email;
      txtNo.text=student.no.toString();
      selectedGender=student.gender==0?"Bay":"Bayan";
      gender=student.gender;
    }

    return studentDataInsert();
  }

  Form studentDataInsert(){
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            controller: txtFistName,
            validator: (value) {
              if (value.isEmpty) {
                return "Ad alanı dolu olmalı";
              }
              return null;
            },
            decoration: InputDecoration(labelText: "Adınız"),
          ),
          TextFormField(
            controller: txtLastName,
            validator: (value) {
              if (value.isEmpty) {
                return "Soyad alanı dolu olmalı";
              }
              return null;
            },
            decoration: InputDecoration(labelText: "Soyadınız"),
          ),
          TextFormField(
            controller: txtEmail,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value.isEmpty) {
                return "Bu alanı bş geçemezsüniz";
              } /*else if(!value.contains("@")){
                        return "Bir email adresi girmelisiniz";
              }*/
              return null;
            },
            decoration: InputDecoration(labelText: "Emailiniz"),
          ),
          TextFormField(
            controller: txtNo,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value.isEmpty) {
                return "Ad alanı dolu olmalı";
              }
              return null;
            },
            decoration: InputDecoration(labelText: "Numaranız"),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(2.0),
            child:  DropdownButtonFormField<String>(
              value: selectedGender,
              items: ["Bay", "Bayan",]
                  .map((label) => DropdownMenuItem(
                child: Text(label),
                value: label,
              )).toList(),
              onChanged: (value) {
                setState(() {
                  selectedGender=value;
                  gender=genders.indexOf(value);
                });
              },
            )
          ),
          Row(
            children: <Widget>[
              student!=null?Expanded(
                child: Container(
                  margin: EdgeInsets.all(2.0),
                  child: FlatButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(8.0),
                    child: Text("Sil",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        deleteStudent();
                        //Navigator.push(context, MaterialPageRoute(builder:(context)=>StudentInsert()));
                        //Navigator.pop(context,true);
                      }
                    },
                  ),
                ),
              ):Text(""),
              Expanded(
                child:Container(
                  margin: EdgeInsets.all(2.0),
                  child:  FlatButton(
                    color: Colors.blue,
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(8.0),
                    child: Text(student==null?"Kaydet":
                      "Düzenle",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        insertStudent();
                        //Navigator.push(context, MaterialPageRoute(builder:(context)=>StudentInsert()));
                        //Navigator.pop(context,true);
                      }
                    },
                  ),
                ),
              ),

            ],
          ),


        ],
      ),
    );
  }

  void insertStudent() async{
    if(student==null) {
      int result = await db.insertStudent(Student(
          txtFistName.text, txtLastName.text, txtEmail.text,
          int.tryParse(txtNo.text), gender));
    }
    else{
       //print("Düzenle");
       student.firstName=txtFistName.text;
       student.lastName=txtLastName.text;
       student.email=txtEmail.text;
       student.no=int.tryParse(txtNo.text);
       student.gender=gender;
       int result=await db.updateStudent(student);
       Navigator.of(context).pop();
    }
  }

  void deleteStudent() async{
    int result=await db.deleteStudent(student.id);
    Navigator.of(context).pop();

  }
}


