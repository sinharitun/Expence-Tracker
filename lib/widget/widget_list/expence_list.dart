import 'package:expencetracker/model/expencemodel.dart';
import 'package:flutter/material.dart';

class ExpenceList extends StatelessWidget {

  const ExpenceList({super.key, required this.expenceitem});
   
   final List<Expencemodel> expenceitem;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: expenceitem.length , itemBuilder: (ctx,index) => Text(expenceitem[index].title),);
  }

}