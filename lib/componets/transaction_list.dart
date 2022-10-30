import 'package:despesas_app/models/Transaction.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {




  const TransactionList({super.key, required this.transactions});
  final List<Transaction> transactions;
  
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 300,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (cxt, index){
          final tr = transactions[index];
return Card(
                  elevation: 5,
                  child: Row(
                    children: [
                      Container(
                        margin:  EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).colorScheme.primary,
                            width: 2
                          )
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text("R\$ ${tr.value!.toStringAsFixed(2)}", style:  TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                           color: Theme.of(context).colorScheme.primary,
                        ),),
                      ),
                      Column(
                        
                        children: [
                        Text(tr.title.toString(), style:  TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),),
                        Text(
                        DateFormat('dd/MM/yyyy HH:mm:ss').format(tr.date!),
                          style:  TextStyle(
                         
                         
                          color: Colors.grey
                        ),),
                      ],)
                    ],
                  ));
        },
                 
                ),
    );
  }
}