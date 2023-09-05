// ignore_for_file: unrelated_type_equality_checks, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:game/features/gamepage/game_view.dart';

import '../forgotpassword/reste_verifivation_screen.dart';
import '../navigationbar/botton_navigations.dart';
import '../register/register_screen.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final loginFormKey = GlobalKey<FormState>();
  final loginUsername = TextEditingController();
  final loginPassword = TextEditingController();

  bool passenable = true;
  bool checkValue = false;

  String? name = "";
  String? password = "";

  @override
  void initState() {
    featchLoginValue();
    super.initState();
  }

  featchLoginValue() async {
    const secureStorage = FlutterSecureStorage();
    // Retrieve data from secure storage
    String? storedUsername = await secureStorage.read(key: "username");
    String? storedPassword = await secureStorage.read(key: "password");
    if (storedUsername != null && storedPassword != null) {
      name = storedUsername.toString();
      password = storedPassword.toString();
    } else {
      // toastMessage("Account not registered!");
      print("Account not registered!");
    }
  }

  void toastMessage(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Opacity(
                //   opacity: 1,
                //   child: Image.asset(
                //     'lib/images/img_tracking.jpg',
                //     width: width * 1,
                //     height: 300,
                //     fit: BoxFit.fill,
                //   ),
                // ),

                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 30, bottom: 30),
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
                        height: height * 0.67,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 20),
                          child: Column(
                            children: [
                              const Padding(
                                padding: EdgeInsets.all(10),
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

                              //Text fields
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'The username is empty!';
                                        }
                                        return null;
                                      },
                                      controller: loginUsername,
                                      decoration: const InputDecoration(
                                        hintText: 'Username',
                                        prefixIcon: Icon(Icons.person),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8),
                                    child: TextFormField(
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'The password is empty!';
                                        }
                                        return null;
                                      },
                                      controller: loginPassword,
                                      obscureText: passenable,
                                      decoration: InputDecoration(
                                        hintText: "Password",
                                        prefixIcon: const Icon(Icons.lock),
                                        suffix: IconButton(
                                          onPressed: () {
                                            setState(() {
                                              passenable =
                                                  !passenable; // Toggle the value
                                            });
                                          },
                                          icon: Icon(
                                            passenable
                                                ? Icons.visibility_off
                                                : Icons.remove_red_eye,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Row(
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
                              ),

                              // login button
                              SizedBox(
                                width: width * 1,
                                child: ElevatedButton(
                                  onPressed: () => {
                                    if (loginFormKey.currentState!.validate())
                                      {
                                        if (loginUsername.text == name &&
                                            loginPassword.text == password)
                                          {
                                            Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const BottonNavigationBar()),
                                              (Route<dynamic> route) => false,
                                            ),
                                          }
                                        else
                                          {
                                            print(
                                                "Invalid username and password!"),
                                            // toastMessage("Invalid username and password!");
                                          }
                                      }
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
                                          'Sign In',
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
                                    const EdgeInsets.only(top: 10, bottom: 5),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const Verification(),
                                      ),
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
                      padding: const EdgeInsets.only(top: 30, bottom: 30),
                      child: Column(
                        children: [
                          const Text(
                            "Or Login with",
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
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
                                      const Color.fromARGB(255, 45, 62, 255),
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
                                      const Color.fromARGB(255, 8, 8, 8),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
