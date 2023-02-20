import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class NumbersWidget extends StatelessWidget {
  const NumbersWidget({super.key});

  @override
  Widget build(BuildContext context) => IntrinsicHeight(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildButton(context, 'CA', 'Posição'),
        buildDivider(),
        buildButton(context, '3.8', 'Gols p/ jogo'),
        buildDivider(),
        buildButton(context, '5.2', 'Ass p/ jogo'),
      ],
    ),
  );

  Widget buildDivider() => Container(
    height: 24,
    child: VerticalDivider());

  Widget buildButton(BuildContext context, String value, String text) => 
  MaterialButton(
    padding: EdgeInsets.symmetric(vertical:4 ),
    onPressed: (){

    },
    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          value,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        SizedBox(height: 2,),
        Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    )
  );
}