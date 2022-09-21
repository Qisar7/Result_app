import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:result_app/model/student.dart';
import 'package:result_app/service/newapi.dart';
import 'package:result_app/service/read_lson.dart';
import 'package:result_app/views/screen/login/login_form.dart';
import 'package:result_app/views/screen/result/result_detals.dart';
import 'package:result_app/views/util/color.dart';
import 'package:result_app/views/util/navigator.dart';
import 'package:result_app/views/widget/drwer.dart';

class Result_home extends StatefulWidget {
  @override
  State<Result_home> createState() => _Result_homeState();
}

class _Result_homeState extends State<Result_home> {
  FirebaseAuth auth = FirebaseAuth.instance;

  var uid = TextEditingController();
  List<Data> ls = [];

  Read read = Read();
  Reas reas = Reas();
  // Get_data_view_model getdata = Get_data_view_model();
  int i;
  bool loading = false;

  @override
  void initState() {
    auth.authStateChanges().listen((e) {
      if (e == null) {
        naviwithremove(context, Login_Form());
      } else {
        print('have an account');
      }
    });
    super.initState();
    read.get_data();
    reas.getdata();
  }

  @override
  void dispose() {
    uid.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Mydrawer(

          // logout: auth.signOut(),
          ),
      appBar: AppBar(
        title: Text('شاشة النتيجة'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              auth.signOut();
            },
            icon: Icon(Icons.login),
          ),
        ],
      ),
      body: Center(
        child: Form(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.50,
            margin: EdgeInsets.all(30),
            child: FutureBuilder(
              future: reas.getdata(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                // List<Data> data = snapshot.data;
                var data = snapshot.data;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: TextFormField(
                        textAlignVertical: TextAlignVertical.center,
                        textAlign: TextAlign.center,
                        controller: uid,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: whitegreen.withOpacity(0.4),
                          // labelText: 'ادخل رقمك الجامعي',
                          label: Center(
                            child: Text(
                              'ادخل رقمك الجامعي',
                              style: TextStyle(
                                color: newgreen,
                                fontSize: 20,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          border: _border(),
                          focusedBorder: _fborder(),
                          // label: const Text(
                          //   'ادخل رقمك الجامعي',
                          //   textAlign: TextAlign.center,
                          // ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 35),
                    Container(
                      width: 300,
                      height: 60,
                      child: ElevatedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: newgreen,
                        ),
                        onPressed: () {
                          if (uid.text.isNotEmpty && int.parse(uid.text) < 9) {
                            setState(() {
                              loading = !loading;
                            });
                            Timer(Duration(seconds: 2), () {
                              naviwithremove(
                                context,
                                result(
                                  score: data[0]['data'][int.parse(uid.text)]
                                      ['rate'],
                                  name: data[0]['data'][int.parse(uid.text)]
                                      ['name'],
                                  rate: data[0]['data'][int.parse(uid.text)]
                                      ['grade'],
                                  special: data[0]['data'][int.parse(uid.text)]
                                      ['specialization'],
                                  subreate: data[0]['data'][int.parse(uid.text)]
                                      ['sub1'],
                                  subreate5: data[0]['data']
                                      [int.parse(uid.text)]['sub2'],
                                  subreate2: data[0]['data']
                                      [int.parse(uid.text)]['sub3'],
                                  subreate3: data[0]['data']
                                      [int.parse(uid.text)]['sub4'],
                                  subreate4: data[0]['data']
                                      [int.parse(uid.text)]['sub5'],

                                  // result_details: data[i].special,
                                ),
                              );
                            });
                          } else {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                behavior: SnackBarBehavior.floating,
                                content: Text(
                                  ' الرقم غير صالح او فارغ !',
                                  style:
                                      TextStyle(fontSize: 17, letterSpacing: 2),
                                  textAlign: TextAlign.center,
                                ),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                        child: loading
                            ? const CircularProgressIndicator(
                                backgroundColor: Colors.yellowAccent,
                              )
                            : const Text(
                                'جلب النتيحة',
                                style: TextStyle(
                                    fontSize: 23,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  _border() {
    return OutlineInputBorder(
      borderSide: BorderSide.none,
    );
  }

  _fborder() {
    return OutlineInputBorder(
      borderSide: BorderSide.none,
    );
  }
}


//  Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Container(
//                   child: TextFormField(
//                     controller: _id,
//                     keyboardType: TextInputType.number,
//                     decoration: InputDecoration(
//                       border: _border(),
//                       focusedBorder: _fborder(),
//                       label: Text('ادخل رقمك الجامعي'),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 35),
//                 Container(
//                   width: 300,
//                   height: 50,
//                   child: ElevatedButton(
//                     style: OutlinedButton.styleFrom(),
//                     onPressed: () async {
                      
//                     },
//                     child: Text(
//                       'جيب النتيحة',
//                       style:
//                           TextStyle(fontSize: 23, fontWeight: FontWeight.w500),
//                     ),
//                   ),
//                 ),
//                 Text(''),
//               ],
//             ),