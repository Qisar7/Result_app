// import 'package:flutter/rendering.dart';
// import 'package:result_app/model/student.dart';

class Data11 {
  List<Final0> final10;

  Data11({this.final10});

  Data11.fromjson(List<dynamic> json) {
    List final110 = ['data'] as List;
    List<Final0> final00 = final110.map((e) => Final0.fromJson(e)).toList();

    final10 = final00;
  }
}

class Final0 {
  String name;
  String special;
  double score;
  String rate;
  String sub1;
  String sub2;
  String sub3;
  String sub4;
  String sub5;
  String stid;
  String specialization;
  String grade;

  Final0({
    this.name,
    this.special,
    this.score,
    this.rate,
    this.sub1,
    this.sub2,
    this.sub3,
    this.sub4,
    this.sub5,
    this.specialization,
    this.grade,
    this.stid,
  });

  Final0.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    specialization = json['specialization'];
    score = json['rate'];
    grade = json['grade'];
    rate = json['rate'];
    sub1 = json['sub1'];
    sub2 = json['sub2'];
    sub3 = json['sub3'];
    sub4 = json['sub4'];
    sub5 = json['sub5'];
    stid = json['st_id'];
    // result = Result.fromjson(json['result']);
  }
}
