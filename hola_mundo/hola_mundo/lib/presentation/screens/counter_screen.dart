import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {

const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int clickcounter = 0;

  void _incrementCounter() {
    setState(() {
      clickcounter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: const Text('Counter Screen'),
    ), //apbar
        body: Center(
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('$clickcounter', style: const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),),
              Text('${clickcounter == 1 ? 'click' : 'clicks'}', style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w100),)
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: () { 
             setState(() {
              clickcounter++;
             });
            },
            child: const Icon(Icons.plus_one),
          ),
        );
  }
}