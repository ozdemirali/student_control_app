import 'package:flutter/material.dart';
import 'package:studentcontrolapp/models/student.dart';
import 'package:studentcontrolapp/screens/studentInsert.dart';
 showSimpleCustomDialog(BuildContext context,Student student)  {

  Dialog simpleDialog = Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    child: Container(
      height: 600.0,
      width:600.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(5.0),
            child:StudentInsert(student), /*Text(
              'Simpe Custom Modal Dialog....',
              style: TextStyle(color: Colors.red),
            ),*/
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                RaisedButton(
                  color: Colors.blue,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Kapat',
                    style: TextStyle(fontSize: 18.0, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
  showDialog(
      context: context, builder: (BuildContext context) => simpleDialog);
}
