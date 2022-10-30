import 'package:flutter/material.dart';


class TransactionForm extends StatelessWidget {
  

  final titleController = TextEditingController();
final valueController = TextEditingController();

final void Function(String?, double?) onSubmit;

   TransactionForm(this.onSubmit, {super.key});

  @override
  Widget build(BuildContext context) {
    return  Card(
                elevation: 5,
                child: Padding(
                  padding:const EdgeInsets.all(10),
                  child: Column(
                    children: [
                       TextField(
                        controller: titleController,
                        decoration:const InputDecoration(
                          labelText: 'Titulo',
                        ),
                      ),
                        TextField( 
                          keyboardType:TextInputType.number,
                         controller: valueController,
                        decoration:const InputDecoration(
                          labelText: 'Valor (R\$)',
                        ),
                        
                        
                        ),
                       
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            // ignore: prefer_const_constructors
                            style:ElevatedButton.styleFrom(
                              elevation: 0,
                              
                              backgroundColor: Colors.white),
                            onPressed: (){
                             final title = titleController.text;
                             final value = double.tryParse(valueController.text) ?? 0.0;
                            onSubmit(title,value);
                            }, child:const  Text('Nova Transação',style: TextStyle(color: Colors.purple),),
                          ),
                        ],
                      )   
                        ],
                  ),
                  
                ),);
  }
}