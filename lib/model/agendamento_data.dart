
import 'package:flutter/material.dart';

class AgendamentoData{
  final String? id;
  final String name;
  final String endereco;
  final DateTime dataPicked;
  final TimeOfDay timeOfDay;
  final String tipo;

  const AgendamentoData({
     this.id,
    required this.name,
    required this.endereco,
    required this.dataPicked,
    required this.timeOfDay,
    required this.tipo
    
  });
}