import 'package:flutter/material.dart';
import 'package:result_app/views/util/border_st.dart';
import 'package:result_app/views/util/color.dart';

class Forget_pass extends StatelessWidget {
  Border_style border = Border_style();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.white,
          size: 30,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 0.55,
          margin: EdgeInsets.only(right: 30, left: 30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'FORGET YOUR PASSWORD!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 15),
                    Text('enter your eamil to rest your password',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: whitegreen,
                          fontSize: 18,
                        )),
                  ],
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    // enabledBorder: border.border(),
                    // focusedBorder: border.fborder(),
                    label: Text('EMAIL'),
                    labelStyle: border.lablestyle(),
                    prefixIcon: Icon(
                      Icons.email_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style:
                        OutlinedButton.styleFrom(backgroundColor: Colors.white),
                    child: Text(
                      'REST PASSWORD',
                      style: TextStyle(
                        fontSize: 17,
                        color: newgreen,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
