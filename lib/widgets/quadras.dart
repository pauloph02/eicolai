import 'package:eicolai/components/quadra_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/quadras_provider.dart';

 class Quadras extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final QuadraProvider quadraProvider = Provider.of(context);
    return 
      Expanded(
       child: ListView.builder(
        itemCount: quadraProvider.count, 
        itemBuilder: (ctx, i) => QuadraTile(quadraProvider.byIndex(i),),),
       );
       
  }
} 