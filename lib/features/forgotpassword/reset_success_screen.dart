import 'package:flutter/material.dart';
import 'package:game/features/login/login_screen.dart';

class ResetSuccess extends StatefulWidget {
  const ResetSuccess({super.key});

  @override
  State<ResetSuccess> createState() => _ResetSuccessState();
}

class _ResetSuccessState extends State<ResetSuccess> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/images/img_password_update.jpg',
              width: width * 0.5,
              height: height * 0.3,
              fit: BoxFit.fill,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Update Successfull",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 30, right: 30, bottom: 30),
              child: Text(
                "Your password has been update.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Color.fromARGB(255, 60, 60, 60)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                    (Route<dynamic> route) => false,
                  );
                },
                child: Container(
                  width: width * 1,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 61, 161, 255),
                    borderRadius: BorderRadius.circular(
                        10), // Set your desired border radius value
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Done',
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
    );
  }
}
