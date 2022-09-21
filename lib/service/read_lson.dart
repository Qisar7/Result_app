// import 'dart:convert';
// import 'package:flutter/services.dart';
// import 'package:result_app/model/final.dart';
// import 'package:result_app/model/student.dart';
// import 'package:http/http.dart' as http;

// class Read {
//   // String url = 'assets/result.json';

//   Future<List<Data>> get_data() async {
//     List<Data> ds = [];

//     var response = await rootBundle.loadString('assets/result.json');

//     var responsedata = jsonDecode(response);

//     for (var i in responsedata) {
//       Data data = Data.fromJson(i);
//       ds.add(data);
//     }
//     print(ds[3].sub3);

//     return ds;
//   }
// }
