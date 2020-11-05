import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Center(
          child: Card(
            margin: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Form(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        key: ValueKey('email'),
                        autocorrect: false,
                        textCapitalization: TextCapitalization.none,
                        enableSuggestions: false,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email address',
                        ),
                      ),
                      TextFormField(
                        key: ValueKey('username'),
                        autocorrect: true,
                        textCapitalization: TextCapitalization.words,
                        enableSuggestions: false,
                        decoration: InputDecoration(labelText: 'Username'),
                      ),
                      TextFormField(
                        key: ValueKey('password'),
                        decoration: InputDecoration(labelText: 'Password'),
                        obscureText: true,
                      ),
                      SizedBox(height: 12),
                      RaisedButton(
                        child: Text('Login'),
                        onPressed: () {},
                      ),
                      FlatButton(
                        textColor: Theme.of(context).primaryColor,
                        child: Text('Create new account'),
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
