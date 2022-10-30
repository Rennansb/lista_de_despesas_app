

import 'package:despesas_app/componets/chart_bar.dart';
import 'package:despesas_app/models/Transaction.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
    Chart(this.recentTransaction);

final List<Transaction> recentTransaction;

List <Map<String, dynamic>> get groupedTransactoins{
return List.generate(7, (index){
  final weekDay = DateTime.now().subtract(
    Duration(days: index)
  );

  double totalSum = 0.0;

  for( var i = 0; i < recentTransaction.length; i++){
bool sameDay = recentTransaction[i].date?.day == weekDay.day;
bool sameMonth = recentTransaction[i].date?.month == weekDay.month;
bool sameYear = recentTransaction[i].date?.year == weekDay.year;

if(sameDay && sameMonth && sameYear){
  totalSum += recentTransaction[i].value!;
}
  }
  
  return {'day' : DateFormat.E().format(weekDay)[0],
   'value' : totalSum}; 
});
}
  @override
  Widget build(BuildContext context) {
    groupedTransactoins;
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Row(
        
        children: groupedTransactoins.map((tr){
          return ChartBar(
            label: tr["day"].toString,
            value: double.parse(tr["value"].toString()),
            percentage: 0,
          );
        }).toList()
        ) ,
     
    );
  }
}