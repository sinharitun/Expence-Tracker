import 'package:expencetracker/model/expencemodel.dart';

import 'package:flutter/material.dart';

class ExpenceItem extends StatelessWidget {
  const ExpenceItem(this.expence, {super.key});

  final Expencemodel expence;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 16,
        ),
        child: Column(
          children: [
            Text(expence.title),
            const SizedBox(height: 10,),
            Row(
              children: [
                Text('\$${expence.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expence.category]),
                    const SizedBox(width: 8,),
                    Text(expence.formattedDate)
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
