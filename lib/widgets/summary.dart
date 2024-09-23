import 'package:flutter/material.dart';

class Summary extends StatelessWidget {
  const Summary({super.key, required this.total, required this.name});
  final double total;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white60,
      elevation: 2,
      child: SizedBox(
        width: 150,
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(name, style:const TextStyle(fontSize:32, fontWeight: FontWeight.bold),),
            Text('$total', style:const TextStyle(fontSize: 18),)
          ],
        ),
      ),
    );
  }
}