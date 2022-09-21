import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:result_app/views/screen/result/result_home.dart';
import 'package:result_app/views/util/color.dart';
import 'package:result_app/views/util/img.dart';
import 'package:result_app/views/util/navigator.dart';

class result extends StatelessWidget {
  final String name;
  final String score;
  final String rate;
  final String special;
  final String subreate;
  final String subreate2;
  final String subreate3;
  final String subreate4;
  final String subreate5;

  result({
    this.name,
    this.score,
    this.rate,
    this.special,
    this.subreate,
    this.subreate2,
    this.subreate3,
    this.subreate4,
    this.subreate5,
  });
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            ' عرض النتيجة',
            style: TextStyle(fontSize: 25, color: snow),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              naviwithremove(
                context,
                Result_home(),
              );
            },
            icon: Icon(Icons.arrow_back),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: whitegreen,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      width: size.width * 0.95,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 15, 90, 81).withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stu_heade_details(
                            des: name,
                            title: 'الاسم',
                          ),
                          SizedBox(height: 20),
                          Stu_heade_details(
                            des: special,
                            title: 'التخصص',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            _checkscore(
                              score: score,
                              r: r,
                              s: s,
                              text: Text('not data'),
                            ),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 25),
                    Column(
                      children: [
                        _card(
                          'الاسم',
                          Text(
                            name,
                            overflow: TextOverflow.visible,
                            // textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                        _card(
                          'الدرجة',
                          Text(
                            score.toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                letterSpacing: 4),
                          ),
                        ),
                        _card(
                          'التقدير',
                          Text(
                            rate.toString(),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        // Container(
                        //   child: Text(result_details.toString()),
                        // ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          children: const [
                            Text(
                              'تفاصيل المواد ',
                              style: TextStyle(
                                fontSize: 23,
                                color: Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.arrow_circle_down_outlined,
                              size: 30,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          resultsub(
                            subna: 'رياضيات',
                            subra: subreate,
                          ),
                          resultsub(
                            subna: " انجليزي",
                            subra: subreate2,
                          ),
                          resultsub(
                            subna: " لغة C++",
                            subra: subreate3,
                          ),
                          resultsub(
                            subna: " java",
                            subra: subreate4,
                          ),
                          resultsub(
                            subna: "database",
                            subra: subreate5,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  resultsub({String subna, String subra}) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 15, 90, 81).withOpacity(0.2),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              subna.toUpperCase().toString(),
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: 0),
            ),
          ),
          const Expanded(
            child: Text(
              ":",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: 0),
            ),
          ),
          Expanded(
            child: Text(
              subra.toString(),
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: subra.contains('F')
                      ? Color.fromARGB(255, 240, 6, 6)
                      : Color.fromARGB(255, 255, 255, 255),
                  letterSpacing: 0),
            ),
          ),
        ],
      ),
    );
  }

  _card(String text, Widget widget2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          flex: 2,
          child: Container(
            padding: EdgeInsets.all(20),
            child: Text(
              text,
              style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: 0),
            ),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: Container(
              width: 0.4,
              height: 30,
              color: Colors.white,
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            // color: Colors.red,
            padding: EdgeInsets.only(left: 10),
            child: widget2,
          ),
        ),
      ],
    );
  }

  _checkscore({
    String score,
    String r,
    String s,
    Text text,
  }) {
    if (score != '3,4') {
      return s;
    } else {
      return r;
    }
  }
}

class Stu_heade_details extends StatelessWidget {
  final String title;
  final String des;

  Stu_heade_details({this.title, this.des});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.90,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              title.toString().toUpperCase(),
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 23,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Expanded(
            child: Text(
              ':',
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              des.toString().toUpperCase(),
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
