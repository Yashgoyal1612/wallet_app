// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, avoid_init_to_null, sort_child_properties_last, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wallet_app/screens/home_screen.dart';

class SignUpScreen extends StatefulWidget {
  SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _usernameTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  // String name = "";
  // bool changeButton = false;
  var _formkey = GlobalKey<FormState>();

  // String? _nameError = null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          elevation: 0,
          title: Text(
            "Sign Up",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
        ),
        body: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 30.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _usernameTextController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please enter Username';
                      }
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_outline),
                      hintText: "Enter Username",
                      labelText: "Username",
                      // labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(38.0)),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  TextFormField(
                    controller: _emailTextController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please enter Email ID';
                      }
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.mail_outline),
                      hintText: "Enter Email ID",
                      labelText: "Email ID",
                      // labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(38.0)),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  TextFormField(
                    controller: _passwordTextController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please enter password';
                      }
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outline),

                      hintText: "Please enter password",
                      labelText: "Password",
                      // labelStyle: TextStyle(fontWeight: FontWeight.bold),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(38.0)),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    width: 340,
                    height: 45,
                    child: ElevatedButton(
                        child: Text(
                          "SIGN UP",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              // TextButton.styleFrom(minimumSize: Size(320, 40)),
                            ),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            if (_formkey.currentState!.validate()) {}
                          });
                          FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: _emailTextController.text.trim(),
                                  password: _passwordTextController.text.trim())
                              .then((value) {
                            print("Created New Account");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomrScreen()));
                          }).onError((error, stackTrace) {
                            print("Error ${error.toString()}");
                          });
                          // print("All set");
                          // setState(() {
                          //   if (_formkey.currentState!.validate()) {
                          //     Navigator.push(context,
                          //         MaterialPageRoute(builder: (context) {
                          //       return();
                          //     }));
                          //   // ignore: empty_statements
                          //   };
                          // });
                        }),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
