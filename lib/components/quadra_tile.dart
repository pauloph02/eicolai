
import 'package:eicolai/model/quadra_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/quadras_provider.dart';

class QuadraTile extends StatelessWidget {

final QuadraData quadra;
const QuadraTile(this.quadra, {super.key});

  @override
  Widget build(BuildContext context) {
    final avatar = quadra.avatarUrl.isEmpty
    ? const CircleAvatar(child: Icon(Icons.sports_soccer))
    : CircleAvatar(backgroundImage: NetworkImage(quadra.avatarUrl),);
    
    return ListTile(
      leading: avatar,
      title: Text(quadra.name),
      subtitle: Text(quadra.endereco),
      trailing: SizedBox(
        width: 100,
        child: Row(children:<Widget> [
            IconButton(
              onPressed: (){
                Navigator.pushNamed(context, '/agendamento_form');
                
              },
              icon: const Icon(Icons.schedule_outlined,
            ),
           
        ),
            IconButton(onPressed: (){
              showDialog(context: context, builder: (ctx) => AlertDialog(
                title: const Text('Excluir Quadra'),
                content: const Text("Você tem certeza que deseja excluir?"),
                actions: <Widget> [
                  TextButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: const Text('Não'),
                  ),
                  TextButton(
                    onPressed: (){
                      Provider.of<QuadraProvider>(context, listen: false).remove(quadra);
                      Navigator.of(context).pop();
                    },
                    child: const Text('Sim'),
                    
                  ),
                ],
              ),
              );
              
            }, icon: const Icon(Icons.delete),
            color: Colors.red
            ,),
            
           
        ]),
      ),
    );
  }
}