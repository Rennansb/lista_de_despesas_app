import 'package:despesas_app/models/Transaction.dart';
import 'package:despesas_app/componets/transaction_form.dart';

import 'package:despesas_app/componets/transaction_list.dart';
import 'dart:math';


import 'package:flutter/material.dart';

main()=> runApp(const ExpansesApp());


class ExpansesApp extends StatefulWidget {
  const ExpansesApp({super.key});

  @override
  State<ExpansesApp> createState() => _ExpansesAppState();
}

class _ExpansesAppState extends State<ExpansesApp> {
  @override
  Widget build(BuildContext context){
    return   MaterialApp(
      home:MyHomePage()
    );
  }
}
class MyHomePage extends StatefulWidget {
    MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 final _transactions = [
    Transaction(
      id: 't1',
      title: 'Novo Tênis de Corrida',
      value: 310.76,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Conta de Luz',
      value: 211.30,
      date: DateTime.now(),
    ),
    
  ];

   _addTransaction(String? title, double? value){
    final newTansaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      value: value,
      date: DateTime.now(),
      );
      setState(() {
        _transactions.add(newTansaction);
      });
      Navigator.of(context).pop();
  }

_openTransactionFormModal(BuildContext context){
showModalBottomSheet(context: context, 
builder: (ctx){
  return TransactionForm(_addTransaction);
});
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Despesas Pessoais'),
      actions: [
        IconButton(onPressed: ()=> _openTransactionFormModal(context), icon: Icon(Icons.add))
      ],
       ),

       body: SingleChildScrollView(
         child: Column(
         
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:  [
            
             
                Card(
                color:Colors.blue,
                elevation: 5,
                child: Text('Gráfico')),
                 TransactionList(transactions: _transactions),
               
       
              
             
               
          ],
         ),
       ),
       floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
       onPressed: ()=> _openTransactionFormModal(context),),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}