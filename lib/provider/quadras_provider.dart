import 'dart:math';

import 'package:eicolai/data/dummy_quadras.dart';
import 'package:eicolai/model/quadra_data.dart';
import 'package:flutter/material.dart';

class QuadraProvider with ChangeNotifier{
  final Map<String, QuadraData> _items = {...DUMMY_QUADRAS};

  List<QuadraData> get all{
    return [..._items.values];
  }

  int get count{
    return _items.length;
  }

  QuadraData byIndex(int i){
    return _items.values.elementAt(i);
  }

  
  void put(quadra){
    if(quadra == null){

    }
    if (quadra.id != null && !quadra.id.trim().isEmpty && _items.containsKey(quadra.id)){
      _items.update(quadra.id, (value)=> QuadraData(
        id: quadra.id,
        name: quadra.name,
        endereco: quadra.endereco,
        avatarUrl: quadra.avatarUrl,
        tipo: quadra.tipo, 
          ),
        );
    }else{
       final id = Random().nextDouble().toString();
  
    //adicionar
    _items.putIfAbsent(id,
     () => QuadraData(
        id: id,
        endereco: quadra.endereco,
        name: quadra.name,
        avatarUrl: quadra.avatarUrl,
        tipo: quadra.tipo,
         ),
        );
    }

 
     
     
     //alterar
    notifyListeners();

    
  }

    void remove(QuadraData quadra){
      if(quadra.id != null){
        _items.remove(quadra.id);
        notifyListeners();
      }
    }
  }
