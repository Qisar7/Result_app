import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:result_app/views/screen/login/forget_pass.dart';
import 'package:result_app/views/screen/login/form_field.dart';
import 'package:result_app/views/screen/login/sign_up_form.dart';
import 'package:result_app/views/screen/result/result_home.dart';
import 'package:result_app/views/util/border_st.dart';
import 'package:result_app/views/util/color.dart';
import 'package:result_app/views/util/img.dart';
import 'package:result_app/views/util/navigator.dart';
import 'package:result_app/views/util/snak_bar.dart';

class Login_Form extends StatefulWidget {
  @override
  State<Login_Form> createState() => _Login_FormState();
}

class _Login_FormState extends State<Login_Form> {
  var _formkey = GlobalKey<FormState>();

  FirebaseAuth auth = FirebaseAuth.instance;

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

  bool visble = true;
  bool wait = false;

  String _email, _password;

  Border_style border = Border_style();
  // Form_field form_field = Form_field();

  String globalvlid(String val) {
    if (val.isEmpty) {
      return 'cant be empty';
    }
  }

  @override
  void dispose() {
    email.dispose();
    pass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            // color: Colors.red,
            padding: EdgeInsets.only(top: 40),
            margin: EdgeInsets.only(
              right: 30,
              left: 30,
              top: 30,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(img22), fit: BoxFit.cover),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Welcome Back',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'sign to continue',
                      style: TextStyle(
                          fontWeight: FontWeight.w300, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Form(
                    key: _formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //email
                        TextFormField(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Colors.white,
                            ),
                            label: Text('EMAIL'),
                            labelStyle: border.lablestyle(),
                          ),

                          // onFieldSubmitted: (_) {
                          //   FocusScope.of(context).requestFocus(emailfocsenode);
                          // },
                          validator: (val) {
                            if (val.toString().isEmpty) {
                              return 'cant be empty';
                            }
                            if (!RegExp(r'\S+@\S+\.\S+').hasMatch(val)) {
                              return "Please enter a valid email";
                            }
                          },
                        ),
                        SizedBox(height: 25),
                        TextFormField(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          controller: pass,
                          obscureText: visble,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(
                              Icons.lock_outline,
                              color: Colors.white,
                            ),
                            label: Text('PASSWORD'),
                            labelStyle: border.lablestyle(),
                            // enabledBorder: border.border(),
                            // focusedBorder: border.fborder(),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  visble = !visble;
                                });
                              },
                              icon: visble
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                            ),
                          ),

                          // onFieldSubmitted: (_) {
                          //   FocusScope.of(context).requestFocus(emailfocsenode);
                          // },
                          validator: (val) {
                            if (val.toString().isEmpty) {
                              return 'cant be empty';
                            } else if (val.toString().length <= 7) {
                              return 'your password is less than 8ch!';
                            } else {
                              return null;
                            }
                          },
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            onPressed: () {
                              navipush(context, Forget_pass());
                            },
                            child: const Text(
                              'forget Password?',
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 23,
                        ),
                        //login button
                        Container(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                            onPressed: () async {
                              if (_formkey.currentState.validate()) {
                                setState(() {
                                  wait = true;
                                });

                                try {
                                  UserCredential userCredential =
                                      await auth.signInWithEmailAndPassword(
                                    email: email.text,
                                    password: pass.text,
                                  );

                                  print('----sucsess---');
                                  setState(() {
                                    wait = true;
                                  });
                                  naviwithremove(context, Result_home());
                                } on FirebaseAuthException catch (e) {
                                  checkfirebasestatuscode(e.code, context);
                                  print(
                                    'errrorrrr ' + e.message.toString(),
                                  );
                                  setState(() {
                                    wait = false;
                                  });
                                }
                              } else {
                                Snak().showsnak(
                                    context: context,
                                    content: 'FEILD',
                                    backgroundcolor: Colors.red,
                                    fontcolor: Colors.red.shade100);
                              }
                            },
                            child: wait
                                ? CircularProgressIndicator(
                                    color: newgreen,
                                  )
                                : Text(
                                    'LOGIN',
                                    style: TextStyle(
                                        fontSize: 20, color: newgreen),
                                  ),
                          ),
                        ),
                        const SizedBox(height: 25),
                        Row(
                          children: [
                            const Text(
                              'Dont have account ?',
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                navipush(context, Sign_up_form());
                              },
                              child: const Text(
                                'create a new account',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  checkfirebasestatuscode(String e, BuildContext context) {
    if (e == 'invalid-email') {
      Snak().showsnak(
        content: 'invalid-email',
        backgroundcolor: Colors.red,
        context: context,
      );
    } else if (e == 'user-not-found') {
      Snak().showsnak(
        content: 'user-not-found',
        backgroundcolor: Colors.red,
        context: context,
      );
    } else if (e == 'wrong-password') {
      Snak().showsnak(
        content: 'wrong-password',
        backgroundcolor: Colors.red,
        context: context,
      );
    }
  }
}
