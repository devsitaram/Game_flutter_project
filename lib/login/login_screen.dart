import 'package:flutter/material.dart';

import '../register/register_screen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool checkValue = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Opacity(
                opacity: 1,
                child: Image.asset(
                  'lib/images/img_tracking.jpg',
                  width: width * 1,
                  height: 300,
                  fit: BoxFit.fill,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20,
                ),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 80, bottom: 80),
                      child: Column(
                        children: [
                          Text(
                            'WELCOME!',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w500,
                            ), //Textstyle
                          ),
                          Text(
                            'Sign in your account',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 84, 84, 84),
                              fontWeight: FontWeight.normal,
                            ), //Textstyle
                          ),
                        ],
                      ),
                    ),

                    // login fields care
                    Card(
                      elevation: 50,
                      shadowColor: Colors.black,
                      color: const Color.fromARGB(255, 255, 255, 255),
                      child: SizedBox(
                        width: width * 0.9,
                        height: height * 0.72,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(15),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'LOGIN',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontWeight: FontWeight.w500,
                                      ), //Textstyle
                                    ),
                                  ],
                                ),
                              ),

                              //Text
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  // emailS
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 16),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Email',
                                        prefixIcon: Icon(Icons.email),
                                      ),
                                    ),
                                  ),

                                  // password
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 16),
                                    child: TextField(
                                      decoration: InputDecoration(
                                        hintText: 'Password',
                                        prefixIcon: Icon(Icons.lock),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Checkbox(
                                    value: checkValue,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        checkValue = value!;
                                      });
                                    },
                                  ),
                                  Text(
                                    checkValue
                                        ? "Check"
                                        : "Uncheck", // Use ternary operator for conditional text
                                  )
                                ],
                              ),

                              // login button
                              SizedBox(
                                width: width * 1,
                                child: ElevatedButton(
                                  onPressed: () => {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Register()),
                                      (Route<dynamic> route) => false,
                                    )
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      const Color.fromARGB(255, 45, 154, 255),
                                    ),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.touch_app,
                                          color: Color.fromARGB(
                                              255, 250, 247, 247),
                                        ),
                                        Text(
                                          'Login',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ), //SizedBox

                              // forgot password
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 20, bottom: 10),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Register()),
                                    );
                                  },
                                  child: const Text(
                                    'Forgot Password?',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 107, 107, 107),
                                      fontWeight: FontWeight.w500,
                                    ), //Textstyle
                                  ),
                                ),
                              ),
                              const Divider(),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'New to Logistics?',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 107, 107, 107),
                                      fontWeight: FontWeight.w500,
                                    ), //Textstyle
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Register()),
                                      );
                                    },
                                    child: const Text(
                                      'Register',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color:
                                            Color.fromARGB(255, 45, 154, 255),
                                        fontWeight: FontWeight.w500,
                                      ), //Textstyle
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ), //Column
                        ), //Padding
                      ), //SizedBox
                    ), //Card

                    Padding(
                      padding: const EdgeInsets.only(top: 50, bottom: 50),
                      child: Column(
                        children: [
                          const Text(
                            "Or Login with",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 137, 137, 137),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 50),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () => {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Register()),
                                      (Route<dynamic> route) => false,
                                    )
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      Color.fromARGB(255, 45, 62, 255),
                                    ),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.facebook,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(left: 2),
                                          child: Text(
                                            'Facebook',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () => {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Register()),
                                      (Route<dynamic> route) => false,
                                    )
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      const Color.fromARGB(255, 45, 154, 255),
                                    ),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.tiktok,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                        ),
                                        Text(
                                          'Tik Tok',
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
