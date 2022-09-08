import 'package:authh_app/ui/authentication.dart';
import 'package:flutter/material.dart';

void main() => runApp(Starting_page());

class Starting_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Color(0x121212), // Will work
      // backgroundColor: Colors.amberAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/logo.png'),
            ),
            SizedBox(
              height: 70, //height of button
              width: 200,
              child: Container(
                margin: const EdgeInsets.only(top: 30.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary:
                        Color.fromARGB(255, 196, 22, 22), // Background color
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                        //to set border radius to button
                        borderRadius: BorderRadius.circular(
                            10)), // Text Color (Foreground color)
                  ),
                  child: const Text(
                    'Log in with Google',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 50, //height of button
              width: 200,
              child: Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Authentication(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // Background color
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                        //to set border radius to button
                        borderRadius: BorderRadius.circular(
                            10)), // Text Color (Foreground color)
                  ),
                  child: const Text(
                    'Sign up with Mail',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
