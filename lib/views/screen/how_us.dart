import 'package:flutter/material.dart';
import 'package:result_app/service/newapi.dart';
import 'package:result_app/service/read_lson.dart';
import 'package:result_app/views/util/color.dart';

class How_us extends StatefulWidget {
  @override
  State<How_us> createState() => _How_usState();
}

class _How_usState extends State<How_us> {
  Reas reas = Reas();

  @override
  void initState() {
    super.initState();
    print('from -----who---');
    reas.getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('WHO US  '),
          centerTitle: true,
        ),
        body: Container(
          margin: EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    ' فريق المشروع :  ',
                    style: TextStyle(fontSize: 25),
                  ),
                  Expanded(
                    child: Text(
                      'الدفعة الثالثة قسم برمجيات',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    'EMAIL:  ',
                    style: TextStyle(fontSize: 25),
                  ),
                  Expanded(child: Text('alieg54860@gmail.com  ')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
