import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final _formkey = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Form(
        key: _formkey,
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                key: ValueKey('Username'),
                decoration: InputDecoration(hintText: 'Enter Username'),
              ),
              SizedBox(height: 10,),
              TextFormField(
                key: ValueKey('Email'),
                decoration: InputDecoration(hintText: 'Enter Email'),
              ),
              TextFormField(
                obscureText: true,
                key: ValueKey('Password'),
                decoration: InputDecoration(hintText: 'Enter Password'),
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(onPressed: () {}, child: Text('Sign Up')),
              ),
              SizedBox(height: 10,),
              TextButton(onPressed: () {}, child: Text('Already have an account | Sign in')),
            ],
          ),
        ),
      ),
    );
  }
}
