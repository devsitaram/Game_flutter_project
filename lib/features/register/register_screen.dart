import 'package:flutter/material.dart';
import 'package:game/features/login/login_screen.dart';
import 'package:game/features/register/register_success.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool passenable = false;
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
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.navigate_before_outlined,
                        color: Color.fromARGB(255, 0, 0, 0),
                        size: 30,
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.w500,
                      ), //Textstyle
                    ),
                    const Spacer(),
                  ],
                ),
              ),

              // register fields care
              SizedBox(
                width: width * 1,
                height: height * 0.9,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(bottom: 30),
                        child: Text(
                          'Create new account',
                          style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.w500,
                          ), //Textstyle
                        ),
                      ),

                      //Text fields
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          const Padding(
                            padding: EdgeInsets.all(15),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Email',
                                prefixIcon: Icon(Icons.email),
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(10),
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Username',
                                prefixIcon: Icon(Icons.person),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: TextField(
                              obscureText: passenable,
                              decoration: InputDecoration(
                                hintText: "Password",
                                prefixIcon: const Icon(Icons.lock),
                                suffix: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      passenable = !passenable;
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

                      // login button
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 30, bottom: 50, left: 10, right: 10),
                        child: SizedBox(
                          width: width * 1,
                          child: ElevatedButton(
                            onPressed: () => {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const RegisterSuccess()),
                                (Route<dynamic> route) => false,
                              )
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 45, 154, 255),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(15),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.touch_app,
                                    color: Color.fromARGB(255, 250, 247, 247),
                                  ),
                                  Text(
                                    'Sign Up',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ), //SizedBox

                      // forgot password

                      const Padding(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          'By registering, you confirm that your account accept our tesm of Use and Privacy pliocy.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                            color: Color.fromARGB(255, 107, 107, 107),
                            fontWeight: FontWeight.w500,
                          ), //Textstyle
                        ),
                      ),

                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Already have an Account?',
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
                                      builder: (context) => const Login()),
                                );
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 45, 154, 255),
                                  fontWeight: FontWeight.w500,
                                ), //Textstyle
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ), //Column
                ), //Padding
              ), //Card
            ],
          ),
        ),
      ),
    );
  }
}
