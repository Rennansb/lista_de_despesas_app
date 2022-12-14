

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
}).reversed.toList();
}

double get _weekTotalValue{
return groupedTransactoins.fold(0.0, (sum, tr){
  return sum + tr['value'] as double;
});
}


  @override
  Widget build(BuildContext context) {
  
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransactoins.map((tr){
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: tr['day'],
                value: double.parse(tr["value"].toString()),
                percentage: _weekTotalValue == 0 ? 0 : (tr["value"] as double )/ _weekTotalValue,
              ),
            );
          }).toList()
          ),
      ) ,
     
    );
  }
}