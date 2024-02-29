import 'package:flutter/material.dart';
import 'package:get_your_suit/logincomponents/my_button.dart';
import 'package:get_your_suit/logincomponents/my_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  // User Sign In Method
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Padding(
                  padding: const EdgeInsets.only(top:30.0),
                  child: Image.asset(
                    "lib/images/logoNoBG.png",
                    height: 120,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),

                // Welcome Text
                Text(
                  "Welcome you've been missed!",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),

                // Username TextField
                MyTextField(
                  controller: usernameController,
                  hintText: "Username",
                  obsecureText: false,
                ),
                const SizedBox(
                  height: 10,
                ),

                // Password TextField
                MyTextField(
                  controller: passwordController,
                  hintText: "Password",
                  obsecureText: true,
                ),
                const SizedBox(
                  height: 10,
                ),

                // Forgot Password
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot Password?",
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),

                // Sign In Button
                MyButton(
                  onTap: signUserIn,
                ),
                const SizedBox(
                  height: 50,
                ),

                // Other Sign In Options
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "Continue With",
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),

                // Google & Apple Sign In Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey[200],
                      ),
                      child: Image.asset(
                        "lib/images/google.png",
                        height: 42,
                      ),
                    ),
                    const SizedBox(
                      width: 18,
                    ),
                    Container(
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey[200],
                      ),
                      child: Image.asset(
                        "lib/images/apple.png",
                        height: 42,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),

                // Registration Option
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Not A Member?",style: TextStyle(color: Colors.grey[800]),),
                    const SizedBox(width: 5,),
                    const Text("Register Now",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
