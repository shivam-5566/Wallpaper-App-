import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RichText(
        textAlign: TextAlign.center,
        text: const TextSpan( text: "Robolex",
            style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 20,
                fontWeight: FontWeight.w600),
            children:[

          TextSpan(
              text: "Wallpaper",
              style: TextStyle(
                  color: Colors.amber,
                  fontWeight: FontWeight.w600,
                  fontSize: 20)),
        ]),
      ),
        );

  }
}
