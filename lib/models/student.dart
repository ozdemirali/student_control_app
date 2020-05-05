class Student{
  int _id;
  String _firstName;
  String _lastName;
  String _email;
  int _no;
  int _gender;

  Student(this._firstName,this._lastName,this._email,this._no,this._gender);
  Student.whitId(this._id,this._firstName,this._lastName,this._email,this._no,this._gender);

  int get id=>_id;
  String get firstName=>_firstName;
  String get lastName=>_lastName;
  String get email=>_email;
  int get no=>_no;
  int get gender=>_gender;

  set firstName(String value)=>this._firstName=value;
  set lastName(String value)=>this._lastName=value;
  set email(String value)=>this._email;
  set no(int value)=>this._no=value;
  set gender(int value)=>this._gender=value;

  //Convert a Student object to a Map Object

Map<String,dynamic> toMap(){
  var map=Map<String,dynamic>();
  if(id!=null){
    map["id"]=_id;
  }
  map["firstName"]=_firstName;
  map["lastName"]=_lastName;
  map["email"]=_email;
  map["num"]=_no;
  map["gender"]=_gender;
  return map;
}


//Extract a Note Object from a Map object
Student.fromObject(dynamic obj){
  this._id=obj["id"];
  this._firstName=obj["firstName"];
  this._lastName=obj["lastName"];
  this._email=obj["email"];
  this._no=int.tryParse(obj["num"].toString());
  this._gender=int.tryParse(obj["gender"].toString());
}


}