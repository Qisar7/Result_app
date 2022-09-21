import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:result_app/model/Result_model.dart';
import 'package:result_app/model/final.dart';
import 'package:result_app/model/student.dart';
import 'package:http/http.dart' as http;

// class Newapi {
//   String url = 'http://ali13579moh.eb2a.com/api_sign_up.php';

// }

class Reas {
  // var url = "http://mohamedali.rf.gd/api_mat.php?i=2";

  Future getdata() async {
    List ls = [];

    var response = await http
        .get(Uri.parse('https://aboalio.000webhostapp.com/getdata2.php'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      // Data11 data11 = Data11.fromjson(data);

      ls.add(data);
    } else {
      throw Exception('-------erooorr--------${response.statusCode}');
    }
    print(ls[0]['data'][2]['name']);

    return ls;
  }
}
