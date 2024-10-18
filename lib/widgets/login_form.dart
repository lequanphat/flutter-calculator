import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_state.dart';
import 'profile_image.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProfileImage(),
        SizedBox(height: 20),
        Text(
          'Hello! Welcome back!',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        SizedBox(height: 20),
        TextField(
          controller: usernameController,
          decoration: InputDecoration(
            labelText: 'Enter username',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.text,
          onChanged: (value) {
            appState.updateUsernameInput(value);
          },
        ),
        SizedBox(height: 20),
        TextField(
          controller: passwordController,
          decoration: InputDecoration(
            labelText: 'Enter password',
            border: OutlineInputBorder(),
          ),
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          onChanged: (value) {
            appState.updatePasswordInput(value);
          },
        ),
        SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text('Your Input'),
                    content: Text(
                      'Username: ${appState.username}\nPassword: ${appState.password}',
                    ),
                    actions: [
                      TextButton(
                        child: Text('OK'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: Text('Login'),
          ),
        ),
      ],
    );
  }
}
