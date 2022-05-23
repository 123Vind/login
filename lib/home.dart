import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'user.dart';
const String emailname = 'email';
const String passname = 'password';

class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: loginPage(),
    );
  }
}


class loginPage extends StatefulWidget {
  const loginPage({ Key? key }) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  List s =[];

 


  bool emails = true;
  bool pass = true;
  String emailErrorText='No email';
  Map<String,Object> values = {'Email':'email'} ;


  addlist(String email,String pass) async{
    String subemail = email.substring(0,2);
    final prefs = await SharedPreferences.getInstance(); 
    String jsondata = '{email: $email, password:$pass}';
    prefs.setString('user$subemail',jsondata);


  }

  getList() async{
    final prefs = await SharedPreferences.getInstance();
    s = prefs.getKeys().toList();
    
    for(int i = 0;i<s.length;i++){
      print(prefs.getString(s[i]));
      final parseJson = jsonDecode(prefs.getString(s[i]).toString());
      //var decodes = jsonDecode(parseJson);

    // print('${decodes.runtimeType}: $decodes');

    }
  }

  bool isValidEmail(String s){
    return RegExp( r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$').hasMatch(s);
  }

  @override
  Widget build(BuildContext context) {
    getList();
    return Container(

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32,vertical: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: TextField(
                
                controller: emailcontroller,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  focusColor: Colors.black,
                  errorText: emails?null:emailErrorText,
                  
                  prefixIcon:Icon(Icons.email) ,
                  border: OutlineInputBorder(
                    
                  ),
                  labelText:'Email' 
                  
                ),
              ),
            ),
                 Padding(
                   padding: const EdgeInsets.symmetric(vertical: 8),
                   child: TextField(      
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                errorText: pass?null:'Invalid Password',
                prefixIcon:Icon(Icons.lock) ,
                border: OutlineInputBorder(),
                labelText:'Password'
                
              ),
            ),
                 ),

                 Center(
                   child: ElevatedButton(style: ElevatedButton.styleFrom(
                     primary: Colors.black
                   ),onPressed: (){


                        setState(() {
                      if(isValidEmail(emailcontroller.text)){
                          emails = true;
                      }
                      else{
                        emailErrorText = 'Not a valid email';
                        emails = false;
                      }
                        if(passwordController.text.isEmpty){
                          pass = false;
                      }
                      else{
                        pass = true;
                      } 

                      if(emails && pass){

                            addlist(emailcontroller.text,passwordController.text);
                            print('added');
                      }         

                          getList();
                        });

                

                   }, child: Padding(
                     padding: const EdgeInsets.all(8),
                     child: Text('sign Up')),

                    
                   ),
                 )
          ],
        ),
      ),
      
    );
  }
}