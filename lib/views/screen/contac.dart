import 'package:flutter/material.dart';
import 'package:result_app/views/util/color.dart';

class Contact_screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('للتواصل'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: const [
                Text(
                  'EMAIL:  ',
                  style: TextStyle(fontSize: 25),
                ),
                Text('TEAM_SEZERO@gmail.com'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: const [
                Text(
                  'PHONE:  ',
                  style: TextStyle(fontSize: 25),
                ),
                Text('\+24991230000000  '),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
