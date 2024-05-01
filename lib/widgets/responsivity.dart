import 'package:flutter/material.dart';

class Responsivity extends StatelessWidget {
  final List<Widget> children;
  const Responsivity({super.key, required this.children});


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, contraints) {
        if(contraints.maxWidth < 800) {
          return Column(
            children: children,
          );
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: children,
          );
        }
      },
    );
  }
}