// ignore_for_file: prefer_const_constructors

import 'package:eicolai/provider/agendamentos_provider.dart';
import 'package:eicolai/provider/quadras_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/agendamento_data.dart';


class AgendamentoForm extends StatefulWidget {
  const AgendamentoForm({super.key});

  
  @override
  State<AgendamentoForm> createState() => _AgendamentoFormState();
}

class _AgendamentoFormState extends State<AgendamentoForm> {
  DateTime date = DateTime(15,12,2022);
  TimeOfDay time = TimeOfDay(hour: 10, minute: 25);
  String format(BuildContext context) {
  assert(debugCheckHasMediaQuery(context));
  assert(debugCheckHasMaterialLocalizations(context));
  final MaterialLocalizations localizations = MaterialLocalizations.of(context);
  return localizations.formatTimeOfDay(
    time ,alwaysUse24HourFormat: MediaQuery.of(context).alwaysUse24HourFormat,
  );
}
  final TextEditingController dataRacha = TextEditingController();
  final TextEditingController horaRacha = TextEditingController();
  final _form = GlobalKey<FormState>();
  String quadra = "Teixeirinha";
  String tipo = "Society";
  final Map<String, dynamic> _formData = {};

  @override
   build(BuildContext context) {
    

    return 
      Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Adicionar Agendamento'),
              actions: <Widget> [
                IconButton(onPressed: (){
                  
                  final isValid = _form.currentState!.validate();
                  if(isValid){
                      
                      _form.currentState?.save();
                      Provider.of<AgendamentoProvider>(context, listen: false).put(
                        AgendamentoData(
                          id: _formData['id'],
                          name: _formData['name'],
                          endereco: _formData['endereco'],
                          dataPicked: _formData['data'], 
                          timeOfDay: _formData['time'],
                          tipo: _formData['tipo'],
                        ),
                      );
                      Navigator.of(context).pop();
                      
                      
                  }
                  
                },
                 icon: Icon(Icons.save),
                ),
              ],
            ),
            body: Padding(
              padding: EdgeInsets.all(15),
              child: Form(
                key: _form,
                child: Column(
                  children: [
                    /*TextFormField(
                      decoration: InputDecoration(labelText: 'Id'),
                      validator: (value){
                        if(value == null || value.isEmpty){
                            return 'Insira um nome válido.';
                        }
                      },
                      onSaved: (value) =>_formData['id'] = value,
                    ),*/
                      
                    DropdownButtonFormField<dynamic>(
                      items: Provider.of<QuadraProvider>(context, listen: false).all.map((e) => DropdownMenuItem(value: e.name, child: Text(e.name))).toList(),
                      onChanged: (value) => setState(() {
                        quadra = value;
                      }),
                      value: quadra,
                      decoration: InputDecoration(labelText: 'Nome da Quadra'),
                      validator: (value){
                        if(value == null || value.isEmpty){
                            return 'Insira um nome válido.';
                        }
                      },
                      onSaved: (value) =>_formData['name'] = value,
                      
                    ),
                    TextFormField(
                      /* items: Provider.of<QuadraProvider>(context, listen: false).all.map((e) => DropdownMenuItem(value: e.endereco, child: Text(e.endereco))).toList(),
                      onChanged: (value) => setState(() {
                        endereco = value;
                      }), */
                      decoration: InputDecoration(labelText: 'Endereço da Quadra'),
                      
                      validator: (value){
                        if(value == null || value.isEmpty){
                            return 'Insira um endereço válido.';
                        }
                        
                      },
                      onSaved: (value) =>_formData['endereco'] = value,
                    ),
                    

                    TextFormField(
                        decoration: InputDecoration(labelText: 'Hora do Racha'),
                        /* validator: (value){
                         if(value == null ||value.isEmpty){
                            return 'Insira uma data válida.';
                          } 
                          
                        },*/
                        readOnly: true,
                        showCursor: true,
                        onTap: () async {
                          TimeOfDay? newTime = await showTimePicker(
                          context: context,
                          initialTime: time,
                        
                        );
                        if (newTime == null) return;

                        setState(() {
                          horaRacha.text = "${newTime.hour}:${newTime.minute}";
                          time = newTime;
                          },
                          );
                        },
                        onSaved: (value) =>_formData['time'] = time,
                        controller: horaRacha,
                      ),  

                    DropdownButtonFormField<dynamic>(
                      items: Provider.of<QuadraProvider>(context, listen: false).all.map((e) => DropdownMenuItem(value: e.tipo, child: Text(e.tipo))).toList(),
                      onChanged: (value) => setState(() {
                        tipo = value;
                      }),
                      decoration: InputDecoration(labelText: 'Tipo da Quadra'),
                      
                      validator: (value){
                        if(value == null ||value.isEmpty){
                            return 'Insira um tipo válido.';
                        }
                        
                      },
                      onSaved: (value) =>_formData['tipo'] = value,
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Data do Racha'),
                        /* validator: (value){
                         if(value == null ||value.isEmpty){
                            return 'Insira uma data válida.';
                          } 
                          
                        },*/
                        readOnly: true,
                        showCursor: true,
                        onTap: () async {
                          DateTime? newDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2100),
                        
                        );
                        if (newDate == null) return;

                        setState(() {
                          dataRacha.text = "${newDate.day}/${newDate.month}/${newDate.year}";
                          date = newDate;
                          },
                          );
                        },
                        onSaved: (value) =>_formData['data'] = date,
                        controller: dataRacha,
                        
                      )  
                     
                  ],
                 ), 
                ),
            ),
          );
      
        }
      );
        }
}