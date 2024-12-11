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
    // Expencemodel(
    //     title: 'burger',
    //     amount: 24.22,
    //     date: DateTime.now(),
    //     category: Category.food),
    // Expencemodel(
    //     title: 'cinema',
    //     amount: 100.22,
    //     date: DateTime.now(),
    //     category: Category.leisure)
  ];

  void _openAddExpenceOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => Newexpence(
        addExpance: _addExpance,
      ),
    );
  }

  void _addExpance(Expencemodel expencemodel) {
    setState(() {
      _registeredExpence.add(expencemodel);
    });
  }

  void _removeExpence(Expencemodel expencemodel) {
    final expenseIndex = _registeredExpence.indexOf(expencemodel);
    setState(() {
      _registeredExpence.remove(expencemodel);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expance deleted'),
        action: SnackBarAction(
          label: "undo",
          onPressed: () {
            setState(() {
              _registeredExpence.insert(expenseIndex, expencemodel);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child:
          Text('No Expences is added yet. Start adding your expence to track'),
    );

    if (_registeredExpence.isNotEmpty) {
      mainContent = ExpenceList(
        expenceitem: _registeredExpence,
        onRemoveExpence: _removeExpence,
      );
    }

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
        children: [const Text('chart'), Expanded(child: mainContent)],
      ),
    );
  }
}
