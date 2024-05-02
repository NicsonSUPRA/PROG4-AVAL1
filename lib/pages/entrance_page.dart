import 'package:flutter/material.dart';

class Entrance extends StatelessWidget {
  final Widget button; 
  const Entrance({super.key, required this.button});


  void navegate() {
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: Center(child: Text("Nicson Costa Antunes")),
        ),
        body: Center(
          child: CircleAvatar(
            backgroundColor: Colors.blueAccent,
            radius: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Jogo da Forca",
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
                Text("criado por:Nicson Costa Antunes"),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: button,
                )
              ],
            ),
          ),
        ),
    );
  }
}