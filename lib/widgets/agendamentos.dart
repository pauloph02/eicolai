

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/agendamento_tile.dart';
import '../provider/agendamentos_provider.dart';

class Agendamentos extends StatelessWidget {
  const Agendamentos({super.key});

  @override
  Widget build(BuildContext context) {
    final AgendamentoProvider agendamentoProvider = Provider.of(context);
    return 
      Expanded(
       child: ListView.builder(
        itemCount: agendamentoProvider.count, 
        itemBuilder: (ctx, i) => AgendamentoTile(agendamentoProvider.byIndex(i),),),
       );
       
  }
}