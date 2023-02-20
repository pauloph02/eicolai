// ignore_for_file: prefer_const_constructors

import 'package:eicolai/model/agendamento_data.dart';
import 'package:flutter/material.dart';



class AgendamentoTile extends StatelessWidget {

final AgendamentoData agendamento;
const AgendamentoTile(this.agendamento, {super.key});

  @override
  Widget build(BuildContext context) {
    
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 5),//EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width*0.25,
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${agendamento.dataPicked.day}', style: TextStyle(
               
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontSize: 15,
              ), textAlign: TextAlign.center,
              ),
              buildDivider(),
              Text('${agendamento.dataPicked.month}', style: TextStyle(
               
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontSize: 15,
              ), textAlign: TextAlign.center,),
              buildDivider(),
              Text('${agendamento.dataPicked.year}', style: TextStyle(
               
                color: Colors.black,
                fontWeight: FontWeight.w800,
                fontSize: 15,
              ), textAlign: TextAlign.center,)
            ],
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(bottom: 20),
            padding: EdgeInsets.all(20),
            color: Color.fromARGB(255, 253, 255, 222),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(agendamento.name, style: TextStyle(
                  color: Colors.green,
                  fontWeight: FontWeight.w700
                ),),
                SizedBox(height: 10,),
                Text(agendamento.endereco, style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w500
                ),),
                SizedBox(height: 5,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.timer, color: Colors.green,),
                    SizedBox(width: 5,),
                    Text('24h: ${agendamento.timeOfDay.hour}:${agendamento.timeOfDay.minute}', style: TextStyle(
                      color: Colors.green,
                      fontSize: 13,
                      fontWeight: FontWeight.w600
                    ),)
                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  children: [
                    Text("Tipo da quadra:", style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500
                    ),),
                    SizedBox(width: 5,),
                    Text(agendamento.tipo)
                  ],
                ),
                SizedBox(height: 5,),
                Container(
                  height: 0.5,
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text('${agendamento.dataPicked.day}/${agendamento.dataPicked.month}/${agendamento.dataPicked.year}', style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500
                    ),),
                    Expanded(
                      child: Container(),
                    ),
                  ],
                )

              ],
            ),
          )
        )
      ]
    );
  }
  Widget buildDivider() => SizedBox(
    height: 15,
    width: 40,
    child: Divider());
}