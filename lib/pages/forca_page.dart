import 'package:flutter/material.dart';
import './play_page.dart';
import './entrance_page.dart';

class ForcaPage extends StatefulWidget {
  const ForcaPage({super.key});

  @override
  State<ForcaPage> createState() => _ForcaPageState();
}

class _ForcaPageState extends State<ForcaPage> {
  bool goToPlayPage = false;
  void navegate() {
    setState(() {
      goToPlayPage = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    return (goToPlayPage) ?PlayPage():Entrance(button: ElevatedButton(onPressed: navegate, child: Text("Começar")));
  }
}