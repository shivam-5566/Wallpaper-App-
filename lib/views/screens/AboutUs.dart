import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(height: 200,width: 200,color: Colors.orange[200],
      child: const Column(mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("About Us",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.black),),
          Text("Created By...",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.deepPurple),),
          Text("Shivam Singh",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.deepPurple),)

        ],
      ),
    );
  }
}
