// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallet_app/cubit/app_cubit.dart';
import 'package:wallet_app/screens/signin_screen.dart';
import 'package:wallet_app/screens/welcome.dart';
import 'package:wallet_app/services/data_services.dart';
import 'package:wallet_app/utils/routes.dart';
import 'cubit/app_cubit_logic.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          fontFamily: GoogleFonts.lato().fontFamily,
        ),
        home: BlocProvider<AppCubits>(
          create: (context) => AppCubits(data: DataServices()),
          child: AppCubitLogic(),
          // // home: const WelcomeScreen(),
          // initialRoute: "/",
          // routes: {
          //   "/": (context) => WelcomeScreen(),
          //   // MyRoutes.signIn: (context) => SignInScreen(),
          // },
        ));
  }
}
