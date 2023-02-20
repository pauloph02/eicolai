import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:brasil_fields/brasil_fields.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_data.dart';

class Registro extends StatefulWidget {
  const Registro({super.key});

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  TextEditingController _nameInputController = TextEditingController();
  TextEditingController _emailInputController = TextEditingController();
  TextEditingController _senhaInputController = TextEditingController();
  
  TextEditingController _avatarInputController = TextEditingController();
  TextEditingController _cpfInputController = TextEditingController();
  
  final formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar'),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children:  [ 
               //CustomField(label: 'Nome', icon: Icons.person, hint:  'Insira seu nome...',),
                const SizedBox(
                  height: 20,
                ),
                 
                const SizedBox(height: 20,),
                 TextFormField(
                  controller: _nameInputController,
                  validator: (text){
                  if(text == null || text.isEmpty){
                      return 'Esse campo não pode ser vazio';
                    }
                  },
                  decoration: const InputDecoration(
                  labelText: 'Nome',
                  hintText: 'Insira seu Nome',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person_outlined)
                            ),
                  keyboardType: TextInputType.text,  
                  ),
                const SizedBox(height: 20,),
                 TextFormField(
                  controller: _emailInputController,
                  validator: (text){
                  if(text == null || text.isEmpty){
                      return 'Esse campo não pode ser vazio';
                    }
                  },
                  decoration: const InputDecoration(
                  labelText: 'E-mail',
                  hintText: 'Insira seu E-mail',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.alternate_email)
                            ),
                  keyboardType: TextInputType.emailAddress,
                       
                  ),
                const SizedBox(height: 20,),
                TextFormField(
                  controller: _senhaInputController,
                  obscureText: true,
                  validator: (text){
                  if(text == null || text.isEmpty){
                      return 'Esse campo não pode ser vazio';
                    }
                  },
                  decoration: const InputDecoration(
                  labelText: 'Senha',
                  hintText: 'Insira sua senha',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.vpn_key)
                            ),
                  keyboardType: TextInputType.text,
                       
                  ),
                const SizedBox(height: 20,),
                TextFormField(
                  controller: _cpfInputController,
                  validator: (text){
                  if(text == null || text.isEmpty){
                      return 'Esse campo não pode ser vazio';
                    }
                  },
                  decoration: const InputDecoration(
                  labelText: 'CPF',
                  hintText: 'Insira seu CPF',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.numbers_rounded)
                            ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      CpfInputFormatter(),
                    ],     
                  ),
                SizedBox(
                  width: double.infinity,
                  height: 20,
                ),
                TextFormField(
                  controller: _avatarInputController,
                  validator: (text){
                  if(text == null || text.isEmpty){
                      return 'Esse campo não pode ser vazio';
                    }
                  },
                  decoration: const InputDecoration(
                  labelText: 'Avatar Url',
                  hintText: 'Insira A Url do avatar',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.photo_camera_front_outlined)
                            ),
                  keyboardType: TextInputType.url,    
                  ),
                const SizedBox(height: 40,),
                  SizedBox(
                  width: double.infinity,
                  height: 45,
                
                  child: ElevatedButton.icon(
                    onPressed: () {
                      formKey.currentState?.validate();
                      _doSignUp();
                      Navigator.of(context).pop();
                    } ,
                    icon: Icon(Icons.person_add),
                    label: Text('Registrar'),
                  ),
                )
                
                
                
              ],
            ),
            ),
        ),
      ),
        

    );
  }
  void _doSignUp(){
      UserData newUser = UserData(
        name: _nameInputController.text,
        email: _emailInputController.text,
        senha: _senhaInputController.text,
        avatarUrl: _avatarInputController.text,
        cpf: _cpfInputController.text,
      );

      print(newUser);
      _saveUser(newUser);
    }

    void _saveUser(UserData user) async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("loginUser", jsonEncode(user.toJson()));
    }
}

