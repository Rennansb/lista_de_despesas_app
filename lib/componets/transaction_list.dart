import 'package:despesas_app/models/Transaction.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {




  const TransactionList({super.key, required this.transactions, required this.onRemove});
  final List<Transaction> transactions;
  final void Function(String) onRemove;
  
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 550,
      child:transactions.isEmpty ? Column(
       children:  [
       const SizedBox(height: 10,),
        const Text('Usuario sem nenhuma transação cadastrada',
         style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
       const  SizedBox(height: 20,),
        SizedBox(
          width: 100,
          child: Image.asset('assets/images/waiting.png',
          fit: BoxFit.cover,),
        ),
       ],

      ): ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (cxt, index){
          final tr = transactions[index];
return Card(
  elevation: 5,
  margin: EdgeInsets.symmetric(
    vertical: 8,
    horizontal: 5
  ),
  child:   ListTile(
    leading:CircleAvatar(
      backgroundColor:Colors.purple,
      radius: 30,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: FittedBox(
          
          child: Text('R\$ ${tr.value}')),
      )
    ),
    title: Text(
      tr.title.toString(),
      style: TextStyle(color: Theme.of(context).colorScheme.primary,),
  
    ),
    subtitle: Text(
      DateFormat('d MMM y').format(tr.date as DateTime)
    ),
    trailing: IconButton(
      onPressed: ()=> onRemove(tr.id as String),
      color: Colors.redAccent,
      icon: Icon(Icons.delete),),
  ),
);
        },
                 
                ),
    );
  }
}