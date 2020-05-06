import 'dart:io';
import 'dart:async';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:studentcontrolapp/models/student.dart';

class DbHelper{
  String tblStudent="student";
  String colId="id";
  String colFirstName="firstName";
  String colLastName="lastName";
  String colEmail="email";
  String colNo="num";
  String colGender="gender";


  static final DbHelper _dbHelper=DbHelper._internal();
  DbHelper._internal();

  factory DbHelper(){
    return _dbHelper;
  }

  //Veritabanına ulaşım sağlar
  static Database _db;
  Future<Database> get db async{

    if(_db==null){
      //print("db nulll");
      _db=await initializeDatabase();
    }
    return _db;
  }

  Future<Database> initializeDatabase() async{
    //Get the directory path for both Android nad Ios to store database
    Directory directory=await getApplicationDocumentsDirectory();
    String path =directory.path+"/student.db";
    var studentDb= await openDatabase(path,version: 1,onCreate: _createDb);
    return studentDb;

  }

  void _createDb(Database db,int version) async{
    await db.execute("Create table $tblStudent($colId integer primary key,$colFirstName text,$colLastName text,$colEmail text,$colNo int,$colGender int)");
  }

  //Get all student map object from database
  Future<List> getStudentList() async{
    Database db=await this.db;
    var result= await db.query(tblStudent,orderBy: "$colId");
    return result;
  }

  //Insert a student object to database
  Future<int> insertStudent(Student student) async{
    Database db=await this.db;
    var result=await db.insert(tblStudent, student.toMap());
    return result;
  }

  //Update
  Future<int> updateStudent(Student student) async{
    Database db= await this.db;
    print(student.gender);
    var result=await db.update(tblStudent, student.toMap(),where: "$colId=?",whereArgs: [student.id]);
    return result;
  }

  //Delete
  Future<int> deleteStudent(int id) async{
    Database db=await this.db;
    //var result=await db.rawDelete("Delete From $tblStudent Where $colId=$id");
    var result=await db.delete(tblStudent,where: "$colId=?",whereArgs: [id]);
    return result;
  }

  Future<int> getCountForChart(int gender) async{
    Database db= await this.db;
    List<Map<String,dynamic>> genderCount=await db.rawQuery("Select count(*) from $tblStudent Where $colGender=$gender");
    var result=Sqflite.firstIntValue(genderCount);
    //print(result);
    return result;
  }

  Future<List> getCountGenders() async{
    Database db=await this.db;
    List<int> result=new List<int>();
    List<Map<String,dynamic>> m=await db.rawQuery("Select count(*) from $tblStudent Where $colGender=0");
    result.add(Sqflite.firstIntValue(m));
    List<Map<String,dynamic>> f=await db.rawQuery("Select count(*) from $tblStudent Where $colGender=1");
    result.add(Sqflite.firstIntValue(f));
    return result;

  }

}