import 'package:flutter/material.dart';
import 'package:shpref/model/user_model.dart';
import 'package:shpref/services/pref_service.dart';

class HomeUser extends StatefulWidget {
  const HomeUser({Key? key}) : super(key: key);

  @override
  _HomeUserState createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  void _doLogIn(){
    String email = emailController.text.toString();
    String password = passwordController.text.toString();
    User user = User.from(email:email,password: password);
    Prefs.storeUser(user);

    Prefs.loadUser().then((user) => {
      print(user!.email),
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150,
            width: 400,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/login.jpeg'),
                    fit: BoxFit.cover
                )
            ),
          ),
          SizedBox(height: 20,),
          Text("Welcome back!",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 35),),
          SizedBox(height: 8,),
          Text("Log in to your existant account of Q Allure",style: TextStyle(color: Colors.grey[500],fontSize: 16),),
          SizedBox(height: 40,),
          Container(
            margin: EdgeInsets.only(left: 20,right: 20),
            height: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                border: Border.all(color: Colors.blue, width: 2)
            ),
            child: Container(
                margin: EdgeInsets.only(left: 15,right: 15),
                child: Center(
                  child: TextField(
                    controller: emailController,
                    decoration: InputDecoration(

                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.blue),
                        border: InputBorder.none,
                        icon: Icon(Icons.person, color: Colors.blue,)
                    ),
                  ),
                )

            ),
          ),
          SizedBox(height: 15,),
          Container(
            margin: EdgeInsets.only(left: 20,right: 20),
            height: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                border: Border.all(color: Colors.blue, width: 2)
            ),
            child: Container(
                margin: EdgeInsets.only(left: 15,right: 15),
                child: Center(
                  child: TextField(
                    controller: passwordController,

                    decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.blue),
                        border: InputBorder.none,
                        icon: Icon(Icons.lock, color: Colors.blue,)
                    ),
                  ),
                )

            ),
          ),
          SizedBox(height: 15,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(width: 290,),
              Expanded(child: Text("Forgot Password?",textAlign: TextAlign.left,))
            ],
          ),
          SizedBox(height: 20,),
          Container(
            margin: EdgeInsets.only(left: 80,right: 80),
            height: 60,
            width: 220,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.blue[800]
            ),
            child: FlatButton(
              onPressed: (){
                _doLogIn();

              },
              child: Text("LOG IN",style: TextStyle(color: Colors.white,fontSize: 20),),
            ),
          ),
          SizedBox(height: 50,),
          Text("Or connect using",style: TextStyle(color: Colors.grey[500],fontSize: 16),),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.blue[800]
                ),
                child: FlatButton(
                    onPressed: (){


                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.facebook,color: Colors.white,size: 15,),
                        SizedBox(width: 5,),
                        Text("Facebook",style: TextStyle(color: Colors.white,fontSize: 14),),
                      ],
                    )
                ),
              ),
              SizedBox(width: 20,),
              Container(

                height: 40,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.red[800]
                ),
                child: FlatButton(
                    onPressed: (){

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.facebook,color: Colors.white,size: 20,),
                        SizedBox(width: 5,),
                        Text("Google",style: TextStyle(color: Colors.white,fontSize: 16),),
                      ],
                    )
                ),
              ),



            ],
          ),
          SizedBox(height: 60,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Don't have an account?",style: TextStyle(color: Colors.grey[800],fontSize: 15,fontWeight: FontWeight.w400),),
              SizedBox(width: 10,),

              Text("Sign Up",style: TextStyle(color: Colors.blue[400],fontSize: 16,fontWeight: FontWeight.w800),)
            ],
          )





        ],
      ),

    );
  }
}
