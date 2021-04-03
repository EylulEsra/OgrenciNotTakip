import 'package:flutter/material.dart';
import 'package:ogrenci_flutter/models/student.dart';

class StudentAdd extends StatefulWidget{

  List<Student> students;
  //StudentAdd(List<Student> students){this.students = students;}

  StudentAdd(this.students);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
   return _StudentAddState();
  }

}

class _StudentAddState extends State<StudentAdd>{
  var formKey = GlobalKey<FormState>();
  Student student = Student("", "", 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Yeni öğrenci"),),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: <Widget>[
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(),
              buildSubmitButton()
            ],
          ),
        ),
      ),
    );
    ;
  }

  Widget buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci adı", hintText: "Esra"),
      onSaved: (String value){
        student.firstName =value;
      },
    );
  }

  Widget buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci soyadı", hintText: "Açar"),
      onSaved: (String value){
        student.lastName =value;
      },
    );
  }
  Widget buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Aldığı not", hintText: "65"),
      onSaved: (String value){
        student.grade = int.parse (value);
      },
    );
  }

  Widget buildSubmitButton(){
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: (){
        formKey.currentState.save();
        widget.students.add(student);
        Navigator.pop(context);
      },
    );
  }
}