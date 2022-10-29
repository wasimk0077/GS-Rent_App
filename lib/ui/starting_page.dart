import 'package:authh_app/ui/Guest_Auth.dart';
import 'package:authh_app/ui/Guest_Discover_Vac.dart';
import 'package:authh_app/ui/authentication.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import './discover_vacant.dart';

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
              height: MediaQuery.of(context).size.height / 9, //height of button
              width: MediaQuery.of(context).size.width / 2,
              child: Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 20),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GuestAuthentication(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary:
                        Color.fromARGB(255, 196, 22, 22), // Background color
                    onPrimary: Colors.white,
                    shape: RoundedRectangleBorder(
                        //to set border radius to button
                        borderRadius: BorderRadius.circular(
                            10)), // Text Color (Foreground color)
                  ),
                  child: FittedBox(
                    child: Text(
                      "Guest",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height:
                  MediaQuery.of(context).size.height / 13, //height of button
              width: MediaQuery.of(context).size.width / 2,
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
                  child: FittedBox(
                    child: Text(
                      "Admin/Employee",
                      style: TextStyle(fontSize: 20),
                    ),
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