import 'package:eicolai/widgets/numbers_widget.dart';
import 'package:eicolai/widgets/profile_widget.dart';
import 'package:eicolai/widgets/userPreferencies.dart';
import 'package:flutter/material.dart';

import '../model/user_data.dart';

class Perfil extends StatefulWidget {
  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {

  @override
  Widget build(BuildContext context) {
    final user = UserPreferencies.myUser;
    return 
      Expanded(
       child: ListView(
        physics: BouncingScrollPhysics(),
       children: [
          ProfileWidget(
            imagePath: user.avatarUrl!,
            onClicked: () async {},
          ),
          const SizedBox(height: 24,),
          buildName(user),
          SizedBox(height: 18,),
          NumbersWidget(),
          const SizedBox(height: 30,),
          buildAbout(user),
       ],
       )
      );
  
       
       
  }

 Widget buildAbout(user) => Container(
  padding: const EdgeInsets.all(40),
   child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Sobre',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      Text(
        'Lorem ipsum dolor sit amet. Et officiis repellendus ut unde quos non dolorem voluptate est nisi facere non laboriosam impedit! Sed corporis rerum hic aliquid fuga ut rerum illo sit dolor asperiores et eligendi harum. Quo tempora fugiat ea laudantium repellendus a deserunt laudantium.',
        style: TextStyle(fontSize: 16, height: 1.4),
      )
    ],
   ),
 );

  Widget buildName(UserData user) => Column(
    children: [
      Text(
        user.name!,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      SizedBox(
        height: 4,
      ),
      Text(
        user.email!,
        style: TextStyle(color: Colors.grey),
      )
    ],
  );

 

}
