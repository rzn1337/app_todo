import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:flutter_svg/flutter_svg.dart';

import '../service/auth_service.dart';
import 'signup_screen.dart';
import 'todo_page.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  firebase_auth.FirebaseAuth firebaseAuth = firebase_auth.FirebaseAuth.instance;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _pwdController = TextEditingController();

  AuthClass authClass = AuthClass();

  bool circular = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Text(
                "Sign In", 
                style: TextStyle(
                fontSize: 35,
                color: Colors.white,
                fontFamily: 'SF',
              ),
              ),
              SizedBox(
                height: 20,
              ),
              buttomItem("assets/google.svg", "Continue with Google", 17, () {
                authClass.googleSignIn(context);
              }),
              SizedBox(
                height: 15,
              ),
              Text("Or", 
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'SF', 
              fontSize: 18),
              ),
              SizedBox(
                height: 15,
              ),
              textItem("Email ...", _emailController, false),
              SizedBox(
                height: 15,
              ),
              textItem("Password ...", _pwdController, true),
              SizedBox(
                height: 30,
              ),
              coloredButton(),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                  style: TextStyle(
                    fontFamily: 'SF',
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                      context, 
                      MaterialPageRoute(builder: (builder) => SignUpPage()), 
                      (route) => false);
                    },
                    child: Text(
                      " Sign Up",
                    style: TextStyle(
                      fontFamily: 'SF',
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buttomItem(String image_path, String button_name, double size, Function onTap) 
  {
    return  InkWell(
      onTap: onTap != null ? () => onTap() : null,
      child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width - 60,
                child: Card(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), 
                    side: BorderSide(
                    width: 1,
                    color: Colors.lightBlue,
                  )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        image_path, 
                        height: 25, 
                        width: 25,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(button_name, 
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'SF',
                      fontSize: size,
                      ),),
                    ],
                  ),
                ),
              ),
    );
  }

  Widget textItem(String text, TextEditingController controller, bool obscureText) {
    return Container(
      width: MediaQuery.of(context).size.width - 70,
      height: 55,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(
          fontFamily: 'SF',
            fontSize: 17, 
            color: Colors.grey
          ),
        decoration: InputDecoration(
          labelText: text, 
          labelStyle: TextStyle(
            fontFamily: 'SF',
            fontSize: 17, 
            color: Colors.grey
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15), 
                  borderSide: BorderSide(
                  width: 1.5,
                  color: Colors.amber,
                ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15), 
                  borderSide: BorderSide(
                  width: 1,
                  color: Colors.lightBlue,
                ),
          ),
        ),
      ),
    );
 }

 Widget coloredButton() {
  return InkWell(
    onTap:() async {
      try {
        firebase_auth.UserCredential userCredential = 
        await firebaseAuth.signInWithEmailAndPassword(
          email: _emailController.text, 
          password: _pwdController.text);
          setState(() {
          circular = false;
        });
        Navigator.pushAndRemoveUntil(
          context, 
          MaterialPageRoute(builder: (builder) => ToDoPage()), 
        (route) => false);
      } catch (e) {
        final snackbar = SnackBar(content: Text(e.toString()));
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
        setState(() {
          circular = false;
        });
        
      }
    },
    child: Container(
      height: 60,
      width: MediaQuery.of(context).size.width - 90,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.amber,
      ),
      child: Center(
        child: circular
        ? CircularProgressIndicator()
        : Text("Sign In", 
        style: TextStyle(
          fontFamily: 'SF',
          color: Colors.black, 
          fontSize: 20)
          ),
      ),
    ),
  );
 }
}