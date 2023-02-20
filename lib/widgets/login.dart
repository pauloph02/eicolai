import 'dart:convert';
import 'package:eicolai/model/user_data.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailInputController = TextEditingController();
  final TextEditingController _senhaInputController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrar'),
      ),
      body:  Stack(
      children: <Widget>[
        Container(
          
          decoration:  const BoxDecoration(
            image:  DecorationImage(image:  AssetImage("assets/images/background.jpg"), fit: BoxFit.cover),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            
            child: Form(
              key: _formKey,
              child: Column(
                
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [ 
                  Container(
                    color: Colors.white,
                    child: TextFormField(
                      controller: _emailInputController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.emailAddress,
                      autofocus: true,
                      style: const TextStyle(fontSize: 22),
                      decoration: const InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.green,
                            width: 3,
                            ),
                          ),
                        focusedBorder:OutlineInputBorder(
                          borderSide: BorderSide(
                          color: Colors.green,
                          width: 3,
                          )
                        ),
                      labelText: 'E-mail',
                      hintText: 'Insira seu e-mail',
                      labelStyle: TextStyle(fontSize: 20, color: Colors.black),
                  
                      prefixIcon: Icon(Icons.email),
                  
                ),
                ),
                  ),
                  
                
                Container(
                  margin: const EdgeInsets.only(bottom: 24),
                  color: Colors.white
                ),
                Container(
                  color: Colors.white,
                  child: TextFormField(
                    controller: _senhaInputController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    style: const TextStyle(fontSize: 22),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                        width: 3,
                      )
                    ),
                    enabledBorder:OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                        width: 3,
                      ),
                    ) ,
                  labelText: 'Senha',
                  hintText: 'Insira sua senha',
                  labelStyle: TextStyle(fontSize: 20,
                  color:Colors.black),
                  
                  prefixIcon: Icon(Icons.lock),
                  
                ),
                
                ), 
                ),
                
                Container(
        margin: const EdgeInsets.only(top:24),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black
          ),
          onPressed: () {
            _doLogin();
            
            
          },
          child: Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children:[ const Padding(
            padding: EdgeInsets.all(16),
            child:Text("Entrar", style: TextStyle(fontSize: 22),
            ),
           )
            
                ]

           , 
          ) ),
      ),
      ],
      
      ),
            ),
    ),
        ),
         
      ],
    ),
    
    );
    
  }
  void _doLogin() async {
    String emailForm = this._emailInputController.text;
    String passForm = this._senhaInputController.text;

    UserData savedUser = await _getSavedUser();

    if(emailForm == savedUser.email && passForm == savedUser.senha){
      print('Login efetuado com sucesso');
      Navigator.of(context).pushNamed('/homeview');
    }else if(emailForm.isEmpty || emailForm == null || passForm.isEmpty || passForm == null){
          print('error');
    }else{
      showDialog(context: context, builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Usuario ou senha incorretos'),
          content: const Text('Por gentileza, tente novamente'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ]
        );
    });
    };
    print(savedUser);
  }

 

  Future<UserData> _getSavedUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? jsonUser = prefs.getString("loginUser");
    print(jsonUser);
    

    Map<String, dynamic> mapUser = json.decode(jsonUser!);
    UserData user = UserData.fromJson(mapUser);
    return user;
  }
}
