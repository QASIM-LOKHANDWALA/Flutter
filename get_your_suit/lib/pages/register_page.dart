import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_your_suit/logincomponents/my_button.dart';
import 'package:get_your_suit/logincomponents/my_textfield.dart';

import '../logincomponents/square_tile.dart';
import '../services/auth_service.dart';

class RegisterPage extends StatefulWidget {
  final Function()? onTap;
  RegisterPage({super.key,required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // User Sign Up Method
  void signUserUp() async {
    // Loading circle
    showDialog(context: context, builder: (context) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    });

    // Signing Up New User
    try {
      if(passwordController.text == confirmPasswordController.text){
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
      }else if(passwordController.text != confirmPasswordController.text){
        // Close the Loading circle
        Navigator.pop(context);
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.black,
              title: const Text("Error",style: TextStyle(color: Colors.white),),
              content: const Text("Entered Passwords Does't Match!",style: TextStyle(color: Colors.white),),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text("OK"),
                ),
              ],
            );
          },
        );
      }
    } on FirebaseAuthException catch (e) {
      // Close the Loading circle
      Navigator.pop(context);

      if (e.code == 'user-not-found') {
        wrongEmailMessage();
      } else if (e.code == 'wrong-password') {
        wrongPasswordMessage();
      } else {
        // General error message
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: Colors.black,
              title: Text("Error",style: TextStyle(color: Colors.white),),
              content: Text("An error occurred: ${e.message}",style: TextStyle(color: Colors.white),),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      }
    }
  }

  void wrongEmailMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Text("Error",style: TextStyle(color: Colors.white),),
          content: Text("Invalid email address. Please try again.",style: TextStyle(color: Colors.white),),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void wrongPasswordMessage() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Text("Error",style: TextStyle(color: Colors.white),),
          content: Text("Incorrect password. Please try again.",style: TextStyle(color: Colors.white),),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  void passwordDontMatch() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: Text("Error",style: TextStyle(color: Colors.white),),
          content: Text("Entered Passwords Does't Match!",style: TextStyle(color: Colors.white),),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }


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

                // Username TextField
                MyTextField(
                  controller: emailController,
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

                // Confirm Password TextField
                MyTextField(
                  controller: confirmPasswordController,
                  hintText: "Confirm Password",
                  obsecureText: true,
                ),
                const SizedBox(
                  height: 25,
                ),


                // Sign In Button
                MyButton(
                  onTap: signUserUp,
                  text: "Sign Up",
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
                    SquareTile(image: "lib/images/google.png", onTap: () => AuthService().signInWithGoogle(),),
                    const SizedBox(
                      width: 18,
                    ),
                    SquareTile(image: "lib/images/apple.png", onTap: () {},),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),

                // Registration Option
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already Have An Account?",style: TextStyle(color: Colors.grey[800]),),
                    const SizedBox(width: 5,),
                    GestureDetector(
                      child: const Text("Sign In Now",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.blue),),
                      onTap: widget.onTap,
                    ),
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
