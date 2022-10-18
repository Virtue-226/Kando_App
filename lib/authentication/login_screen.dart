import 'package:drivers_app/authentication/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 150, horizontal: 30),
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Image(
                  image: AssetImage("assets/images/logo4.png"),
                ),
              ),

              const Text(
                "Login as Driver",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
              TextField(
                controller: emailTextEditingController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.grey),
                decoration: const InputDecoration(
                  labelText: "Email",
                  hintText: "Email",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
              TextField(
                controller: passwordTextEditingController,
                keyboardType: TextInputType.text,
                obscureText: true,
                style: const TextStyle(color: Colors.grey),
                decoration: const InputDecoration(
                  labelText: "Password",
                  hintText: "Password",
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                ),
                onPressed: () {
                  // Navigator.push(context, MaterialPageRoute(builder: (c)=> CarInfoScreen()));
                },
                child: const Text(
                  "Sign In",
                  style: TextStyle(color: Colors.black87, fontSize: 18),
                ),
              ),
              TextButton(
                child: const Text(
                  "Don't have an account? Signup here.",
                  style: TextStyle(color: Colors.grey),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (c) => SignUpScreen()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
