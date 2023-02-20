// ignore_for_file: prefer_const_constructors, non_constant_identifier_names
import 'package:flutter/material.dart';

import '../model/agendamento_data.dart';

// ignore: constant_identifier_names
 var DUMMY_AGENDAMENTOS = {
  '1': AgendamentoData(
    id: '1', 
    name: 'Teixeirinha', 
    endereco: 'R. São Paulo, 155 - Jardim Bordon, São José do Rio Preto - SP, 15055-420',
    dataPicked: DateTime.now(),
    timeOfDay: TimeOfDay.now(),
    tipo: "society"
    ),
  '2': AgendamentoData(
    id: '2', 
    name: 'Setorial', 
    endereco: 'R. São Paulo, 155 - Jardim Bordon, São José do Rio Preto - SP, 15055-420',
    dataPicked: DateTime(2022, 12, 24),
    timeOfDay: TimeOfDay.now(),
    tipo: "quadra"
    ),
};