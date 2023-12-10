import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'nav.dart';

class ResighterScreen extends StatefulWidget {
  ResighterScreen({Key? key}) : super(key: key);

  @override
  State createState() => _ResighterScreenState();
}

class _ResighterScreenState extends State<ResighterScreen> {
  final FnameController = TextEditingController();
  final SnameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var ConfirmPasswordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isShowed = true;
  bool isShowed1 = true;
  IconData suffix = Icons.visibility;
  IconData suffix1 = Icons.visibility;
  String _signupMessage = '';
  String confirmPassword = '';


  void _signup() async {
    try {
      UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // User signup successful
      setState(() {
        _signupMessage = 'You have signed up successfully!';
      });

      // Show the message in a SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_signupMessage),
          duration: Duration(seconds: 7),
          backgroundColor: Colors.green,

        ),
      );

      // Delay the navigation to the desired screen
      await Future.delayed(Duration(seconds: 5));
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => BottomNav(),
        ),
      );

      // Navigate to the desired screen
    } catch (error) {
      // Signup failed, handle the error
      setState(() {
        _signupMessage = 'Signup failed. Please try again.';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(_signupMessage),
          duration: Duration(seconds: 7),
          backgroundColor: Colors.red,
        ),
      );
      print('Signup Error: $error');
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Sign UP To pyramids App",
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 175,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: FnameController,
                            validator: (value) {
                              return value!.isEmpty
                                  ? "          Enter FirstName"
                                  : null;
                            },
                            decoration: InputDecoration(
                              hintText: ' Fist Name',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 6,
                        ),
                        Container(
                          width: 175,
                          height: 60,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            controller: SnameController,
                            validator: (value) {
                              return value!.isEmpty
                                  ? "          Enter SecondName"
                                  : null;
                            },
                            decoration: InputDecoration(
                              hintText: ' Last Name',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 350,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: emailController,
                      validator: (value) {
                        return value!.isEmpty
                            ? "          Enter your e-mail address"
                            : null;
                      },
                      onFieldSubmitted: (value) {
                        print(value);
                      },
                      onChanged: (value) {
                        print(value);
                      },
                      decoration: InputDecoration(
                        hintText: "E-mail address",
                        prefixIcon: Container(
                          child: Icon(Icons.email),
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 350,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: passwordController,
                      obscureText: isShowed,
                      validator: (value) {
                        final passwordRegex =
                            r'^(?=.*?[0-9])(?=.*?[!@#$%^&*])[A-Za-z0-9!@#$%^&*]{10,}$';
                        if (value!.isEmpty) {
                          return "          Enter your password";
                        } else if (!RegExp(passwordRegex).hasMatch(value)) {
                          return "     at least 10 characters, "
                              ",numbers, and special characters";
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {},
                      decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Container(
                          child: Icon(
                            Icons.lock,
                          ),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(suffix),
                          onPressed: () {
                            setState(() {
                              isShowed = !isShowed;
                              suffix = isShowed
                                  ? Icons.remove_red_eye
                                  : Icons.visibility_off;
                            });
                          },
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 350,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      controller: ConfirmPasswordController,
                      obscureText: isShowed,
                      onChanged: (value) {
                        confirmPassword = value;
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "          Enter your password";
                        } else if (value != passwordController.text) {
                          return "          Passwords do not match";
                        }
                        return null;
                      },
                      onFieldSubmitted: (value) {},
                      decoration: InputDecoration(
                        hintText: " Confirm Password",
                        prefixIcon: Container(
                          child: Icon(
                            Icons.lock,
                          ),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(suffix1),
                          onPressed: () {
                            setState(() {
                              isShowed1 = !isShowed1;
                              suffix1 = isShowed1
                                  ? Icons.remove_red_eye
                                  : Icons.visibility_off;
                            });
                          },
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      width: 220,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadiusDirectional.circular(20),
                        color: Colors.blueGrey[700],
                      ),
                      child: MaterialButton(
                        child: const Text(
                          "Sign up",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            _signup();
                          }
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BottomNav(),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Center(
                            child: Container(
                              width: 180,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadiusDirectional.circular(20),
                                color: Colors.blue,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.facebook,
                                    size: 35,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    "Facebook",
                                    style:
                                    Theme.of(context).textTheme.bodyText1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        TextButton(
                          onPressed: () async {
                            try {

                              // Google sign-up successful
                              setState(() {
                                _signupMessage =
                                'You have signed up successfully!';
                              });

                              // Show the message in a SnackBar
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(_signupMessage),
                                  duration: Duration(seconds: 10),
                                ),
                              );

                              // Delay the navigation to the desired screen
                              await Future.delayed(Duration(seconds: 5));

                              // Navigate to the desired screen
                            } catch (error) {
                              // Sign-up failed, handle the error
                              setState(() {
                                _signupMessage =
                                'Sign-up failed. Please try again.';
                              });
                              print('Sign-up Error: $error');
                            }
                          },
                          child: Center(
                            child: Container(
                              width: 180,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadiusDirectional.circular(20),
                                color: Colors.red[400],
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image(
                                    image: AssetImage(
                                      "assets/images/icons8-google-48.png",
                                    ),
                                    height: 35,
                                    width: 35,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Google",
                                    style:
                                    Theme.of(context).textTheme.bodyText1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
