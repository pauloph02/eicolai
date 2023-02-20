import 'dart:math';
import 'package:eicolai/data/dummy_agendamentos.dart';
import 'package:eicolai/model/agendamento_data.dart';
import 'package:flutter/material.dart';

class AgendamentoProvider with ChangeNotifier{
  final Map<String, AgendamentoData> _items = {...DUMMY_AGENDAMENTOS};

  List<AgendamentoData> get all{
    return [..._items.values];
  }

  int get count{
    return _items.length;
  }

  AgendamentoData byIndex(int i){
    return _items.values.elementAt(i);
  }

  
  void put(agendamento){
    if(agendamento == null){

    }
    if (agendamento.id != null && !agendamento.id.trim().isEmpty && _items.containsKey(agendamento.id)){
      _items.update(agendamento.id, (value)=> AgendamentoData(
        id: agendamento.id,
        name: agendamento.name,
        endereco: agendamento.endereco,
        dataPicked: agendamento.dataPicked, 
        timeOfDay: agendamento.timeOfDay,
        tipo: agendamento.tipo,
          ),
        );
    }else{
       final id = Random().nextDouble().toString();
  
    //adicionar
    _items.putIfAbsent(id,
     () => AgendamentoData(
        id: id,
        endereco: agendamento.endereco,
        name: agendamento.name,
        dataPicked: agendamento.dataPicked,
        timeOfDay: agendamento.timeOfDay,
        tipo: agendamento.tipo,
         ),
        );
    }

 
     
     
     //alterar
    notifyListeners();

    
  }

    void remove(AgendamentoData quadra){
      if(quadra.id != null){
        _items.remove(quadra.id);
        notifyListeners();
      }
    }
  }
