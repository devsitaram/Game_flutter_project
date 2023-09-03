import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:game/features/forgotpassword/reset_success_screen.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final resetPasswordFormKey = GlobalKey<FormState>();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool passenable = true;

  void _resetPassword() async {
    if (resetPasswordFormKey.currentState!.validate()) {
      if (newPasswordController.text == confirmPasswordController.text) {
        print(newPasswordController.text);
        print(confirmPasswordController.text);
        // Write data to FlutterSecureStorage
        const secureStorage = FlutterSecureStorage();
        await secureStorage.write(
            key: "password", value: confirmPasswordController.text);
        // Navigate to the success screen
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ResetSuccess()),
        );
      } else {
        print("confirm password");
      }
    }
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
            key: resetPasswordFormKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.navigate_before_outlined,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    const Spacer(),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Reset password",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
                Image.asset(
                  'lib/images/img_reset_password.png',
                  width: width * 0.5,
                  height: height * 0.3,
                  fit: BoxFit.fill,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Create new password",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Text(
                    "Your new password must be different from previous used passwords.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        color: Color.fromARGB(255, 60, 60, 60)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password field is empty!';
                            }
                            return null;
                          },
                          controller: newPasswordController,
                          obscureText:
                              passenable, //if passenable == true, show **, else show password character
                          decoration: InputDecoration(
                              // border: const OutlineInputBorder(),
                              hintText: "New Password",
                              prefixIcon: const Icon(Icons.lock),
                              suffix: IconButton(
                                onPressed: () {
                                  //add Icon button at end of TextField
                                  setState(
                                    () {
                                      //refresh UI
                                      if (passenable) {
                                        //if passenable == true, make it false
                                        passenable = false;
                                      } else {
                                        passenable =
                                            true; //if passenable == false, make it true
                                      }
                                    },
                                  );
                                },
                                icon: Icon(passenable == true
                                    ? Icons.visibility_off
                                    : Icons.remove_red_eye),
                              )
                              //eye icon if passenable = true, else, Icon is ***__
                              ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password field is empty!';
                            }
                            return null;
                          },
                          controller: confirmPasswordController,
                          obscureText:
                              passenable, //if passenable == true, show **, else show password character
                          decoration: InputDecoration(
                              // border: const OutlineInputBorder(),
                              hintText: "Confirm Password",
                              // labelText: "Password",
                              prefixIcon: const Icon(Icons.lock),
                              suffix: IconButton(
                                onPressed: () {
                                  //add Icon button at end of TextField
                                  setState(
                                    () {
                                      //refresh UI
                                      if (passenable) {
                                        //if passenable == true, make it false
                                        passenable = false;
                                      } else {
                                        passenable =
                                            true; //if passenable == false, make it true
                                      }
                                    },
                                  );
                                },
                                icon: Icon(passenable == true
                                    ? Icons.visibility_off
                                    : Icons.remove_red_eye),
                              )
                              //eye icon if passenable = true, else, Icon is ***__
                              ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20, bottom: 20),
                        child: TextButton(
                          onPressed: () {
                            if (resetPasswordFormKey.currentState!.validate()) {
                              if (newPasswordController.text ==
                                  confirmPasswordController.text) {
                                print(newPasswordController.text);
                                print(confirmPasswordController.text);
                                // Write data to FlutterSecureStorage
                                const secureStorage = FlutterSecureStorage();
                                secureStorage.write(
                                    key: "password",
                                    value: confirmPasswordController.text);
                                // Navigate to the success screen
                                // ignore: use_build_context_synchronously
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const ResetSuccess()),
                                );
                              } else {
                                print("confirm password");
                              }
                            }
                          },
                          child: Container(
                            width: width * 1,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 61, 161, 255),
                              borderRadius: BorderRadius.circular(
                                  10), // Set your desired border radius value
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 5),
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Create',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
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
    );
  }
}
