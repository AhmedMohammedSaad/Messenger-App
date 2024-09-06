import 'package:flutter/material.dart';
import 'package:masenger_app/home.dart';

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.mark_chat_read,
              size: 230,
            ),
            const Text(
              'Welom To Chat App',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.arrow_forward,
                  size: 50,
                  color: Colors.white,
                ))
          ],
        ),
      ),
    );
  }
}
