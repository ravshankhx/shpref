import 'package:flutter/material.dart';
import 'package:shpref/model/user_model.dart';
import 'package:shpref/services/pref_service.dart';
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20,right: 20),
              height: 50,
              padding: EdgeInsets.only(left: 15,right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.grey[200],

              ),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Email",
                  border: InputBorder.none,
                  icon: Icon(Icons.email, color: Colors.blue,),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20),
              height: 50,
              padding: EdgeInsets.only(left: 15,right: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.grey[200],

              ),
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: "Password",
                  border: InputBorder.none,
                  icon: Icon(Icons.lock, color: Colors.blue,),
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.blue
              ),
              child: FlatButton(
                onPressed: () {
                  _doLogIn();

                },
                child: Text("Log in",style: TextStyle(color: Colors.white),),

              ),
            )
          ],
        ),
      ),
    );
  }
}
