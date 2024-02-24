import 'package:flutter/material.dart';

class splashScreen extends StatelessWidget {
  const splashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
              width: MediaQuery.of(context).size.width,
              height: 200,
              "https://memasik.app/img/memasik-logo.png"),
          SizedBox(height: 60,),
          Padding(
            padding: const EdgeInsets.only(left:10),
            child: Text("MemeGame App",style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800,)),
          ),
      ],
      ),
    );
  }
}
