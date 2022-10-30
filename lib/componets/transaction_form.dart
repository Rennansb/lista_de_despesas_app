import 'package:flutter/material.dart';


class TransactionForm extends StatelessWidget {
  

  final titleController = TextEditingController();
final valueController = TextEditingController();

final void Function(String?, double?) onSubmit;

   TransactionForm(this.onSubmit, {super.key});

  _submitForm(){
final title = titleController.text;
                             final value = double.tryParse(valueController.text) ?? 0.0;
                    if(title.isEmpty || value <=0){
                      return;
                    }        
                            
                            onSubmit(title,value);
  }

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
                        onSubmitted: (value)=> _submitForm(),
                        decoration:const InputDecoration(
                          labelText: 'Titulo',
                        ),
                      ),
                        TextField( 
                          keyboardType:const TextInputType.numberWithOptions(decimal: true),
                         controller: valueController,
                         onSubmitted: (value)=> _submitForm(),
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
                             _submitForm();
                            }, child:const  Text('Nova Transação',style: TextStyle(color: Colors.purple),),
                          ),
                        ],
                      )   
                        ],
                  ),
                  
                ),);
  }
}