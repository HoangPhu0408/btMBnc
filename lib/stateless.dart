import 'package:flutter/material.dart';

class MyStateless extends StatelessWidget {
  const MyStateless({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Stateless widget"),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(8, 32, 8, 32),
          child: Center(
              child: Column(
            children: <Widget>[
              Image.network('https://googleflutter.com/sample_image.jpg'),
              const SizedBox(
                height: 32,
              ),
              const Text(
                'Build project by my hand!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Your name?',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              )
            ],
          )),
        ));
  }
}
