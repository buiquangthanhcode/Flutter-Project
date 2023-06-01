import 'package:flutter/material.dart';

import '../../../app/routes/route_name.dart';

class FormLogin extends StatelessWidget {
  const FormLogin({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.usernameController,
    required this.passwordController,
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController usernameController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your username';
              }
              return null;
            },
            controller: usernameController,
            obscureText: false,
            decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                fillColor: Colors.grey.shade200,
                filled: true,
                hintText: "Username",
                hintStyle: TextStyle(color: Colors.grey[500])),
          ),
        ),
        const SizedBox(height: 10),
        // password textfield
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: TextFormField(
            controller: passwordController,
            obscureText: true,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
            decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade400),
                ),
                fillColor: Colors.grey.shade200,
                filled: true,
                hintText: "Password",
                hintStyle: TextStyle(color: Colors.grey[500])),
          ),
        ),
        const SizedBox(height: 25),
        // forgot password?
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Forgot Password?',
                style: TextStyle(color: Colors.grey[600]),
              ),
            ],
          ),
        ),
        // sign in button
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            if (_formKey.currentState!.validate()) {
              const snackBar = SnackBar(
                content: Text('Welcome to News App'),
                behavior: SnackBarBehavior.floating,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              Navigator.pushNamed(context, AppRouterName.navigationBottom);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please fill input')),
              );
            }
          },
          child: Container(
            padding: const EdgeInsets.all(25),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Center(
              child: Text(
                "Sign In",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
