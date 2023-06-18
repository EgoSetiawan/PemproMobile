import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "assets/Background.png",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            height: 400,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            // child: ,
          ),
        ),
      ],
    );

    // Align(
    //   alignment: Alignment.bottomCenter,
    //   child: Container(
    //     height: 350, // Adjust the height as per your requirement
    //     color: Colors.white, // Replace with your desired card color
    //     child: const Center(
    //       child: Text(
    //         'Persistent Card',
    //         style: TextStyle(
    //           fontSize: 20,
    //           fontWeight: FontWeight.bold,
    //           color: Colors.black, // Replace with your desired text color
    //         ),
    //       ),
    //     ),
    //   ),
    // ),
  }
}
