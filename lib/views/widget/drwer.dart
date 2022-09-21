import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:result_app/views/screen/contac.dart';
import 'package:result_app/views/screen/how_us.dart';
import 'package:result_app/views/screen/login/login_form.dart';
import 'package:result_app/views/util/color.dart';
import 'package:result_app/views/util/img.dart';
import 'package:result_app/views/util/navigator.dart';

class Mydrawer extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              color: newgreen.withOpacity(0.6),
              width: double.infinity,
              height: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    margin: EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          backgroundImage: AssetImage(emg0),
                          radius: 50,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'STUDENT',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  letterSpacing: 4,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                auth.currentUser.email.toString(),
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
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
          Expanded(
            flex: 2,
            child: Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _listtile(Text('الرئيسة'), () {
                      Navigator.pop(context);
                    }, Icons.home_outlined),
                    _listtile(Text('من نحن'), () {
                      navipush(context, How_us());
                    }, Icons.info_outline),
                    _listtile(Text('للتواصل'), () {
                      navipush(context, Contact_screen());
                    }, Icons.contact_phone_outlined),
                    _listtile(Text('تسجيل الخروج'), () {
                      auth.signOut();
                    }, Icons.logout_outlined),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _listtile(Widget title, VoidCallback ontap, IconData icon1) {
    return ListTile(
      horizontalTitleGap: 30,
      contentPadding: EdgeInsets.all(10),
      shape: Border.all(width: .02),
      hoverColor: Color.fromARGB(126, 140, 139, 139),
      onTap: ontap,
      title: title,
      leading: Icon(icon1),
    );
  }
}
