import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class HeaderSection extends StatelessWidget {
  String text;

  HeaderSection({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 19, 67, 107),
        borderRadius: BorderRadius.all(Radius.circular(8)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2,
          )
        ]
      ),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: const Color.fromARGB(255, 207, 160, 82),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
