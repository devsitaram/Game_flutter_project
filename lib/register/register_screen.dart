import 'package:flutter/material.dart';
class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: width * 1,
            height: height * 0.4, // Adjust the height as needed
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/images/img_tracking.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            width: width * 1,
            height: height * 0.6, // Adjust the height as needed
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  bottom: 0,
                  child: Container(
                    width: width * 1,
                    child: Column(
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: Text("Button"),
                        ),
                        Text("Some text"),
                        TextButton(
                          onPressed: () {},
                          child: Text("Button"),
                        ),
                        Text("Some text"),
                        // Add more TextButtons and Text widgets as needed
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}