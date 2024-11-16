import 'package:expencetracker/widget/widget_list/expence_list.dart';
import 'package:expencetracker/model/expencemodel.dart';
import 'package:flutter/material.dart';

class Expences extends StatefulWidget {

  const Expences({super.key});
  @override
  State<Expences> createState() {
    return _ExpenceState();
  }
}

class _ExpenceState extends State<Expences> {
  final List<Expencemodel> _registeredExpence = [
    Expencemodel(
        title: 'burger',
        amount: 24.22,
        date: DateTime.now(),
        category: Category.food),
    
    Expencemodel(
        title: 'cinema',
        amount: 100.22,
        date: DateTime.now(),
        category: Category.leisure)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('chart'),
          Expanded(child: ExpenceList(expenceitem: _registeredExpence,))
        ],
      ),
    );
  }
}
