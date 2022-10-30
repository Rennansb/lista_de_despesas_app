
import 'package:despesas_app/componets/transaction_user.dart';

import 'package:flutter/material.dart';

main()=> runApp(const ExpansesApp());


class ExpansesApp extends StatelessWidget {
  const ExpansesApp({super.key});


  @override
  Widget build(BuildContext context){
    return  const MaterialApp(
      home:MyHomePage()
    );
  }
}
class MyHomePage extends StatelessWidget {
   const MyHomePage({super.key});




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Despesas Pessoais'),
       ),

       body: SingleChildScrollView(
         child: Column(
         
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            
             
                Card(
                color:Colors.blue,
                elevation: 5,
                child: Text('Gráfico')),
       
              
               TransactionUser(),
               
          ],
         ),
       ),
    );
  }
}