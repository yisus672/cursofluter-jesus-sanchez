import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CounterFunctionsScreen extends StatefulWidget {
  const CounterFunctionsScreen({super.key});

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
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
        title: const Text('Mi primera App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              setState(() {
                clickcounter = 0;
              });
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$clickcounter',
              style: const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
            ),
            Text(
              clickcounter == 1 ? 'click' : 'clicks',
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w100),
            )
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // Boton de sumar
          CustomButton(
            icon: Icons.plus_one_outlined,
            onPressed: () {
              _incrementCounter();
            },
          ),
          const SizedBox(height: 10), 
          // Boton de restar
          CustomButton(
            icon: Icons.exposure_minus_1_outlined,
            onPressed: () {
              setState(() {
                if (clickcounter > 0) { // Evita numeros negativos
                  clickcounter--;
                }
              });
            },
          ),
        ],
      ),
    );
  }
}

// Widget personalizado 
class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed; // Parametro para recibir la funcion

  const CustomButton({
    super.key, 
    required this.icon, // Ahora es obligatorio enviar un ícono
    required this.onPressed, // Ahora es obligatorio enviar la funcion
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingActionButton(
          enableFeedback: true,
          elevation: 10,
          backgroundColor: const Color.fromARGB(255, 94, 204, 177),
          shape: const StadiumBorder(),
          onPressed: onPressed, // Ejecuta la funcion que le enviaron desde arriba
          child: Icon(icon),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () {
            // Acción del boton
          },
          child: const Text('😎'),
        ),
      ],
    );
  }
  
}
