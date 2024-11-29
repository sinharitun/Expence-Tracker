import 'package:expencetracker/widget/newexpence.dart';
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

  void _openAddExpenceOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => const Newexpence(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PocketPilot'),
        actions: [
          IconButton(
            onPressed: _openAddExpenceOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('chart'),
          Expanded(
              child: ExpenceList(
            expenceitem: _registeredExpence,
          ))
        ],
      ),
    );
  }
}
