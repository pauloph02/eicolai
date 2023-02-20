import 'package:eicolai/provider/quadras_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/quadra_data.dart';

class QuadraForm extends StatelessWidget {
  
  final _form = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {};

  QuadraForm({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Quadra'),
        actions: <Widget> [
          IconButton(onPressed: (){
            
            final isValid = _form.currentState!.validate();
            if(isValid){
                
                _form.currentState?.save();
                Provider.of<QuadraProvider>(context, listen: false).put(
                  QuadraData(
                    id: _formData['id'],
                    name: _formData['name'],
                    endereco: _formData['endereco'],
                    avatarUrl: _formData['avatarUrl'],
                    tipo: _formData['tipo'],
                  ),
                );
                Navigator.of(context).pop();
                
                
            }
            
          },
           icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
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
                
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value){
                  if(value == null || value.isEmpty){
                      return 'Insira um nome válido.';
                  }
                },
                onSaved: (value) =>_formData['name'] = value,
                
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Endereço'),
                
                validator: (value){
                  if(value == null || value.isEmpty){
                      return 'Insira um endereço válido.';
                  }
                  
                },
                onSaved: (value) =>_formData['endereco'] = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Url do Avatar'),
                
                validator: (value){
                  if(value == null ||value.isEmpty){
                      return 'Insira um Url válido.';
                  }
                  
                },
                onSaved: (value) =>_formData['avatarUrl'] = value,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: 'Tipo da Quadra'),
                
                validator: (value){
                  if(value == null ||value.isEmpty){
                      return 'Insira um tipo válido.';
                  }
                  
                },
                onSaved: (value) =>_formData['tipo'] = value,
              )
            ],
           ), 
          ),
      ),
    );
  }
}