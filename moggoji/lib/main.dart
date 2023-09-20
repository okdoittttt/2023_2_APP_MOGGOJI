import 'package:flutter/material.dart';
import 'package:moggoji/common/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // home: const Login(),
      home: const Login(),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return ChangeNotifierProvider<UsersData>(
  //     create: (context) => UsersData(),
  //     child: const MaterialApp(
  //       debugShowCheckedModeBanner: false,
  //       home: LoginTest(),
  //     ),
  //   );
  // }
}

