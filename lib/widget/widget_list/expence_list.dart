import 'package:expencetracker/model/expencemodel.dart';
import 'package:expencetracker/widget/widget_list/expence_item.dart';
import 'package:flutter/material.dart';

class ExpenceList extends StatelessWidget {
  const ExpenceList({
    super.key,
    required this.expenceitem,
    required this.onRemoveExpence,
  });

  final void Function(Expencemodel expencemodel) onRemoveExpence;

  final List<Expencemodel> expenceitem;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenceitem.length,
      itemBuilder: (ctx, index) => Dismissible(
          key: ValueKey(expenceitem[index]),
          onDismissed: (direction) {onRemoveExpence(expenceitem[index]); },
          child: ExpenceItem(expenceitem[index])),
    );
  }
}
