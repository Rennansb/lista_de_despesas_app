import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class TransactionForm extends StatefulWidget {
  

final void Function(String?, double?, DateTime?) onSubmit;

   TransactionForm(this.onSubmit, {super.key});

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();

final _valueController = TextEditingController();
DateTime? _selectedDate = DateTime.now() ;

  _submitForm(){
final title = _titleController.text;
                             final value = double.tryParse(_valueController.text) ?? 0.0;
                    if(title.isEmpty || value <=0 || _selectedDate == null){
                      return;
                    }        
                            
                            widget.onSubmit(title,value,_selectedDate );
  }


_showDatePicker(){
  showDatePicker(
    context: context, 
  initialDate: DateTime.now(), 
  firstDate: DateTime(2019), 
  lastDate: DateTime.now()).then((pickedDate){
    setState(() {
      _selectedDate = pickedDate;
    });
  });
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
                        controller: _titleController,
                        onSubmitted: (value)=> _submitForm(),
                        decoration:const InputDecoration(
                          labelText: 'Titulo',
                        ),
                      ),
                        TextField( 
                          keyboardType:const TextInputType.numberWithOptions(decimal: true),
                         controller: _valueController,
                         onSubmitted: (value)=> _submitForm(),
                        decoration:const InputDecoration(
                          labelText: 'Valor (R\$)',
                        ),
                        
                        
                        ),
                        SizedBox(
                          height: 70,
                          child: Row(
                            children: [
                               Expanded(
                                 child: Text(
                                  
                                  _selectedDate == null ? 'Nenhuma data selecionada!' : 'Data selecionada: ${DateFormat('d/M/y').format(_selectedDate!)}'),
                               ),
                             const SizedBox(width: 5,),
                              ElevatedButton(
                                 style:ElevatedButton.styleFrom(
                              elevation: 0,
                              
                              backgroundColor: Colors.white),
                                onPressed: _showDatePicker, child:const Text('Selecionar Data', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.purple),))
                            ],
                          ),
                        ),
                       
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ElevatedButton(
                            // ignore: prefer_const_constructors
                            style:ElevatedButton.styleFrom(
                              elevation: 0,
                              
                              backgroundColor: Colors.purple),
                            onPressed: (){
                             _submitForm();
                            }, child:const  Text('Nova Transação',style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                          ),
                        ],
                      )   
                        ],
                  ),
                  
                ),);
  }
}