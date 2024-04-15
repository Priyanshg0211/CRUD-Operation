import 'package:crud_operation/Functions/authfucntion.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final _formkey = GlobalKey<FormState>();
  bool isLogin = false;
  String email = '';
  String Password = '';
  String Username = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Email Auth',
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
              !isLogin
                  ? TextFormField(
                      key: ValueKey('Username'),
                      decoration: InputDecoration(hintText: 'Enter Username'),
                      validator: (value) {
                        if (value.toString().length < 3) {
                          return 'Username is too Short';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        setState(() {
                          Username = value!;
                        });
                      },
                    )
                  : Container(),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                  key: ValueKey('Email'),
                  decoration: InputDecoration(hintText: 'Enter Email'),
                  validator: (value) {
                       if (!(value.toString().contains('@')))  {
                      return 'Invalid Email';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      email = value!;
                    });
                  }),
              TextFormField(
                obscureText: true,
                key: ValueKey('Password'),
                decoration: InputDecoration(hintText: 'Enter Password'),
                validator: (value) {
                  if (value.toString().length < 6) {
                    return 'Password is so small';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  setState(() {
                    Password = value!;
                  });
                },
              ),
              SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                          _formkey.currentState!.save();
                          isLogin
                              ? signin(email, Password)
                              : signup(email, Password);
                        }
                    },
                    child: isLogin ? Text('Login') : Text('Sign Up')),
              ),
              SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      isLogin = !isLogin;
                    });
                  },
                  child: isLogin
                      ? Text('Dont have an account | Sign Up')
                      : Text('Already Signed up? Login')),
            ],
          ),
        ),
      ),
    );
  }
}
