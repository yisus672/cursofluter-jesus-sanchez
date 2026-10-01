import 'package:flutter/material.dart';
//import 'package:hola_mundo/presentation/screens/counter_screen.dart';
import 'package:hola_mundo/presentation/screens/counter_functions_screens.dart';
void main(){
 runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(useMaterial3: true, colorSchemeSeed: Colors.deepPurple),
      home: const CounterFunctionsScreen()
    );
  }
}