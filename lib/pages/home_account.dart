import 'package:flutter/material.dart';
import 'package:shpref/model/account_model.dart';
import 'package:shpref/services/pref_service.dart';

class HomeAccount extends StatefulWidget {
  const HomeAccount({Key? key}) : super(key: key);

  @override
  _HomeAccountState createState() => _HomeAccountState();
}

class _HomeAccountState extends State<HomeAccount> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmpasswordController = TextEditingController();
  void _doLogIn(){
    String email = emailController.text.toString();
    String password = passwordController.text.toString();

    String name = nameController.text.toString();
    String phone = phoneController.text.toString();

    String confirmpassword = confirmpasswordController.text.toString();
    Account account = Account.from(email:email,password: password);
    Prefs.storeAccount(account);

    Prefs.loadAccount().then((account) => {
      print(account!.email),
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(width: 40,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 40,),
              Icon(Icons.arrow_back_outlined,color: Colors.black,size: 40,),

            ],
          ),

          SizedBox(height: 30,),
          Text("Let's Get Started!",style: TextStyle(color: Colors.black,fontSize: 35,fontWeight: FontWeight.bold),),
          SizedBox(height: 10,),
          Text("Create an account to Q Allure to get all features",style: TextStyle(color: Colors.grey[800],fontSize: 16,fontWeight: FontWeight.w500),),
          SizedBox(height: 40,),
          Container(
              //color: Colors.white,
              margin: EdgeInsets.only(left: 30,right: 30),
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(45),
                border: Border.all(color: Colors.blue,width: 2),
              ),
              padding: EdgeInsets.only(left: 20,right: 20),
              child: Center(
                child:  TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      icon: Icon(Icons.person,color: Colors.blue,),
                      hintText: 'Name',
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.blue)
                  ),
                ),
              )

          ),
          SizedBox(height: 20,),
          Container(
              //color: Colors.white,
              margin: EdgeInsets.only(left: 30,right: 30),
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
                border: Border.all(color: Colors.blue,width: 2),
              ),
              padding: EdgeInsets.only(left: 20,right: 20),
              child: Center(
                child:  TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      icon: Icon(Icons.email,color: Colors.blue,),
                      hintText: 'Email',
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.blue)
                  ),
                ),
              )

          ),
          SizedBox(height: 20,),
          Container(
              //color: Colors.white,
              margin: EdgeInsets.only(left: 30,right: 30),
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
                border: Border.all(color: Colors.blue,width: 2),
              ),
              padding: EdgeInsets.only(left: 20,right: 20),
              child: Center(
                child:  TextField(
                  controller: phoneController,
                  decoration: InputDecoration(
                      icon: Icon(Icons.smartphone,color: Colors.blue,),
                      hintText: 'Phone',
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.blue)
                  ),
                ),
              )

          ),
          SizedBox(height: 20,),
          Container(
              margin: EdgeInsets.only(left: 30,right: 30),
              height: 70,
             // color: Colors.white,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
                border: Border.all(color: Colors.blue,width: 2),
              ),
              padding: EdgeInsets.only(left: 20,right: 20),
              child: Center(
                child:  TextField(
                  controller: passwordController,
                  decoration: InputDecoration(
                      icon: Icon(Icons.lock,color: Colors.blue,),
                      hintText: 'Password',
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.blue)
                  ),
                ),
              )

          ),
          SizedBox(height: 20,),
          Container(
              margin: EdgeInsets.only(left: 30,right: 30),
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
                border: Border.all(color: Colors.blue,width: 2),
              ),
              padding: EdgeInsets.only(left: 20,right: 20),
              child: Center(
                child:  TextField(
                  controller: confirmpasswordController,
                  decoration: InputDecoration(
                      icon: Icon(Icons.lock,color: Colors.blue,),
                      hintText: 'Confirm Password',
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.blue)
                  ),
                ),
              )

          ),
          SizedBox(height: 50,),
          Container(
            margin: EdgeInsets.only(left: 40,right: 40),
            height: 70,
            width: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(35),
              color: Colors.blue[800],

            ),
            child: FlatButton(
              onPressed: (){
                _doLogIn();

              },
              child: Text("Create",style: TextStyle(color: Colors.white,fontSize: 25),),
            ),
          ),
          SizedBox(height: 50,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Already have an account?", style: TextStyle(fontSize: 17,color: Colors.grey[900]),),
              SizedBox(width: 10,),
              Text("Login here",style: TextStyle(color: Colors.blue[600],fontSize: 17,fontWeight: FontWeight.bold),)
            ],
          ),
          SizedBox(height: 60,)

        ],
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
