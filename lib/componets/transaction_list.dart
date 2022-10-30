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
                        margin: const EdgeInsets.symmetric(
                          horizontal: 15,
                          vertical: 10
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.purple,
                            width: 2
                          )
                        ),
                        padding:const EdgeInsets.all(10),
                        child: Text("R\$ ${tr.value!.toStringAsFixed(2)}", style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple
                        ),),
                      ),
                      Column(
                        
                        children: [
                        Text(tr.title.toString(), style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                        ),),
                        Text(
                        DateFormat('dd/MM/yyyy HH:mm:ss').format(tr.date!),
                          style: const TextStyle(
                         
                         
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