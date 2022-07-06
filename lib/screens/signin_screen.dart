// ignore_for_file: prefer_const_constructors, prefer_final_fields, sort_child_properties_last, avoid_init_to_null, unused_field, avoid_unnecessary_containers, body_might_complete_normally_nullable, avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wallet_app/screens/home_screen.dart';
import 'package:wallet_app/screens/signup_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  String name = "";
  bool changeButton = false;
  var _formkey = GlobalKey<FormState>();

  String? _nameError = null;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            // appBar: AppBar(
            //   title: Text("Fun app"),
            //   centerTitle: true,
            // ),
            backgroundColor: Colors.white,
            body: Form(
              key: _formkey,
              child: ListView(children: [
                Container(
                  child: Image.asset(
                    "images/login_image.png",
                    fit: BoxFit.cover,
                  ),
                ),
                // Padding(padding: EdgeInsets.symmetric(vertical: 22)),
                Center(
                  child: Text(
                    "Welcome",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailTextController,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return 'Please enter Email ID';
                          }
                        },
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person_outline),
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
                              "LOG IN",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                  RoundedRectangleBorder>(
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
                                  .signInWithEmailAndPassword(
                                      email: _emailTextController.text.trim(),
                                      password:
                                          _passwordTextController.text.trim())
                                  .then((value) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => HomrScreen())));
                              }).onError((error, stackTrace) {
                                print("Error ${error.toString()}");
                              });

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
                      SizedBox(
                        height: 15,
                      ),
                      signUpOption()
                    ],
                  ),
                ),
              ]),
            )));
  }

  Row signUpOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don't have account?",
          style: TextStyle(color: Colors.black),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SignUpScreen()));
          },
          child: Text(
            " Sign Up",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
