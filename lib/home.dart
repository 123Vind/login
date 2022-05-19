import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
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
              
              decoration: InputDecoration(
                
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
                      if(emailcontroller.text.isEmpty){
                          print('Empty text field');
                      }
                      else{
                        print(emailcontroller.text);
                      }
                        if(passwordController.text.isEmpty){
                          print('password blank');
                      }
                      else{
                        print(passwordController.text);
                      }

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