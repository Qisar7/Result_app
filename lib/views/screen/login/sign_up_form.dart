import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:result_app/views/screen/login/form_field.dart';

import 'package:result_app/views/screen/login/login_form.dart';
import 'package:result_app/views/util/border_st.dart';
import 'package:result_app/views/util/color.dart';
import 'package:result_app/views/util/navigator.dart';
import 'package:result_app/views/util/snak_bar.dart';

class Sign_up_form extends StatefulWidget {
  @override
  State<Sign_up_form> createState() => _Sign_up_formState();
}

class _Sign_up_formState extends State<Sign_up_form> {
  // late String name;
  // late String email;
  // late String _phone;
  // late String password;

  var _formkey = GlobalKey<FormState>();

  FirebaseAuth auth = FirebaseAuth.instance;

  Border_style border_style = Border_style();

  // final emailfocsenode = FocusNode();

  // final Validator _validator = Validator();
  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmpass = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    password.dispose();
    confirmpass.dispose();
    phone.dispose();
    super.dispose();
  }

  Form_field form_field = Form_field();
  Snak snak = Snak();

  bool visable = true;

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        body: Container(
          margin: EdgeInsets.only(right: 30, left: 30),
          height: MediaQuery.of(context).size.height * 0.90,
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: const [
                      Text(
                        'Create Account',
                        style: TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'create a new Account',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  Form(
                    key: _formkey,
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          form_field.sign_up(
                            label: 'NAME',
                            textInputType: TextInputType.name,
                            controller: username,
                            prefixicon: Icons.person_outline,
                            validat: (val) {
                              if (val.toString().isEmpty) {
                                return 'cant be empty';
                              }
                            },
                          ),
                          SizedBox(height: 25),
                          form_field.sign_up(
                            label: 'EAMIL',
                            textInputType: TextInputType.emailAddress,
                            controller: email,
                            prefixicon: Icons.email_outlined,
                            validat: (val) {
                              if (val.toString().isEmpty) {
                                return 'cant be empty';
                              }
                              if (!RegExp(r'\S+@\S+\.\S+').hasMatch(val)) {
                                return "Please enter a valid email";
                              }
                            },
                          ),
                          SizedBox(height: 25),
                          form_field.sign_up(
                            label: 'PHONE',
                            textInputType: TextInputType.phone,
                            controller: phone,
                            prefixicon: Icons.phone_android_outlined,
                            validat: (val) {
                              if (val.toString().isEmpty) {
                                return 'cant be empty';
                              }
                            },
                          ),
                          SizedBox(height: 25),
                          form_field.sign_up(
                            label: 'PASSWORD',
                            controller: password,
                            pass: visable,
                            prefixicon: Icons.lock,
                            validat: (val) {
                              if (val.toString().isEmpty) {
                                return 'cant be empty';
                              } else if (val.toString().length <= 7) {
                                return 'your password is less than 8ch!';
                              }
                            },
                            suffixicon: IconButton(
                              onPressed: _showpass,
                              icon: visable
                                  ? Icon(Icons.visibility_off_outlined)
                                  : Icon(Icons.visibility_outlined),
                            ),
                          ),
                          SizedBox(height: 25),
                          form_field.sign_up(
                            label: 'CONFIRM PASSWORD',
                            controller: confirmpass,
                            pass: visable,
                            prefixicon: Icons.lock,
                            validat: (val) {
                              if (val.toString().isEmpty) {
                                return 'cant be empty';
                              } else if (val.toString().length <= 7) {
                                return 'your password is less than 8ch!';
                              } else if (password.text != confirmpass.text) {
                                return 'password is  not EQUAL !';
                              }
                            },
                            suffixicon: IconButton(
                              onPressed: _showpass,
                              icon: visable
                                  ? Icon(Icons.visibility_off_outlined)
                                  : Icon(Icons.visibility_outlined),
                            ),
                          ),
                          SizedBox(height: 25),
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
                                    loading = true;
                                  });
                                  try {
                                    UserCredential credential = await auth
                                        .createUserWithEmailAndPassword(
                                      email: email.text,
                                      password: password.text,
                                    );
                                    print('---- sucsess ------');
                                    setState(() {
                                      loading = false;
                                    });
                                  } on FirebaseAuthException catch (e) {
                                    print(' erorrrrrr' + e.toString());
                                  }
                                  snak.showsnak(
                                    context: context,
                                    backgroundcolor: Colors.green,
                                    content: 'SUCSESS',
                                    fontcolor: Colors.white,
                                  );

                                  // print('sucsess');
                                  naviwithremove(context, Login_Form());
                                } else {
                                  snak.showsnak(
                                    context: context,
                                    backgroundcolor: Colors.red.shade700,
                                    content: 'FIELD TRY AGAIN!',
                                    fontcolor: Colors.white,
                                  );
                                  print(' field');
                                }

                                try {
                                  UserCredential credential =
                                      await auth.createUserWithEmailAndPassword(
                                    email: email.text,
                                    password: password.text,
                                  );
                                } on FirebaseAuthException catch (e) {
                                  print(' erorrrrrr' + e.toString());
                                }
                              },
                              child: loading
                                  ? CircularProgressIndicator(
                                      color: newgreen,
                                    )
                                  : Text(
                                      'CREATE ACCOUNT',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: newgreen,
                                      ),
                                    ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Alredy have a acount?',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              TextButton(
                                onPressed: () {
                                  naviwithremove(context, Login_Form());
                                },
                                child: const Text(
                                  'Login',
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  _showpass() {
    setState(() {
      visable = !visable;
    });
  }
}
