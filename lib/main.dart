import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(home: HomePage()));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber, //Color de fondo de la aplicación general
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              width: 150,
              decoration: BoxDecoration(
                color: Colors.blue
                ),
              child: Text(
                "Hola"
                ),
            ),
          ),
        ],
      ),
    );
  }
}
